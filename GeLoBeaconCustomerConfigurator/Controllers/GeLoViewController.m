//
//  GeLoViewController.m
//  GeLoBeaconCustomerConfigurator
//
//  Created by Zach Dennis on 4/10/14.
//  Copyright (c) 2014 GeLo. All rights reserved.
//

#import "GeLoViewController.h"
#import "GeLoDeviceListViewController.h"
#import "GeLoFirmwareLibrary/GeLoDeviceFinderService.h"
#import "GeLoFirmwareLibrary/GeLoDeviceService.h"
#import "GeLoFirmwareLibrary/GeLoAuthenticationProfile.h"
#import "GeLoFirmwareLibrary/GeLoOACProfile.h"
#import "GeLoFirmwareLibrary/BLEDebugProfile.h"

typedef NS_ENUM(NSUInteger, BeaconAnimation){
    BeaconAnimationFadeIn,
    BeaconAnimationFadeOut
};

@interface GeLoViewController ()
@property (strong,nonatomic) GeLoDeviceFinderService *deviceFinderService;
@property (strong,nonatomic) GeLoDeviceService *deviceService;
@property (strong,nonatomic) GeLoAuthenticationProfile *authProfile;
@property (strong,nonatomic) BLEDebugProfile *bleDebugProfile;
@property (strong,nonatomic) GeLoOACProfile *oacProfile;
@property (strong,nonatomic) GeLoDevice *device;
@property BOOL hasScannedAlready;
@property (strong,nonatomic) UIImage *beaconImage;
@property (strong,nonatomic) NSTimer *scanTimer;
@property BOOL autoConnectWhenViewAppears;
@end

@implementation GeLoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self fadeBeacon:BeaconAnimationFadeOut duration:0.0];

    self.beaconImage = [UIImage imageNamed:@"beacon.png"];
    self.statusLabel.hidden = NO;
    self.scanButton.enabled = NO;
    self.autoConnectWhenViewAppears = NO;

    self.hasScannedAlready = NO;
    self.activityIndicator.hidesWhenStopped = YES;

    self.deviceFinderService = [GeLoDeviceFinderService instance];

    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(authenticationSuccess:) name:kGeLoDeviceAuthenticationSuccess object:nil];
    [notificationCenter addObserver:self selector:@selector(authenticationFailure:) name:kGeLoDeviceAuthenticationFailure object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationItem.title = @"No beacon found";
    self.statusLabel.text = @"";

    if(self.autoConnectWhenViewAppears){
        [self connectToDevice: self.device];
        self.autoConnectWhenViewAppears = NO;
    } else {
        if(self.hasScannedAlready){
            self.scanButton.enabled = YES;
            [self fadeBeacon:BeaconAnimationFadeOut duration:0.0];
        } else {
            [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(startScan) userInfo:nil repeats:NO];
            self.hasScannedAlready = YES;
        }
    }
}

- (void)viewWillDisappear:(BOOL)animated {
   [self.deviceFinderService stopFindingDevices];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - GeLoDeviceListDelegate

- (void)deviceListDidCancelSelection
{
    [self.activityIndicator stopAnimating];
}

- (void)deviceListDidSelectDevice:(GeLoDevice *)device
{
    self.device = device;
    self.autoConnectWhenViewAppears = YES;
}

# pragma mark - UIViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSMutableDictionary *mutableUserInfoDict = [self.userInfoDict mutableCopy];

    if(self.deviceService)
        [mutableUserInfoDict setObject:self.deviceService forKey:@"DeviceService"];
    if(self.device)
        [mutableUserInfoDict setObject:self.device forKey:@"Device"];

    UIViewController *targetVC = (UIViewController *) [segue destinationViewController];
    [targetVC setUserInfoDict: mutableUserInfoDict];

    if([segue.identifier isEqualToString:@"listBeacons"]){
        GeLoDeviceListViewController *vc = (GeLoDeviceListViewController *)targetVC;
        vc.delegate = self;
    }
}

- (void) scan:(id)sender {
    [self startScan];
}


# pragma mark - Private Helpers

- (void)fadeBeacon:(BeaconAnimation)animation duration:(float)duration {
    //Create an animation with pulsating effect
    CABasicAnimation *fade;
    fade = [CABasicAnimation animationWithKeyPath:@"opacity"];

    fade.delegate = self;

    if(animation == BeaconAnimationFadeIn){
        fade.fromValue = [NSNumber numberWithFloat:0.1f];
        fade.toValue = [NSNumber numberWithFloat:1.0f];
    } else {
        fade.fromValue = [NSNumber numberWithFloat:1.0f];
        fade.toValue = [NSNumber numberWithFloat:0.1f];
    }
    fade.duration = duration;
    fade.autoreverses = NO;
    fade.fillMode = kCAFillModeForwards;
    fade.removedOnCompletion = NO;

    [self.beaconImageView.layer addAnimation:fade forKey:@"fadedInitially"];
}

- (void)startScan {
    self.navigationItem.title = @"Scanning";
    self.statusLabel.text = @"";
    self.scanButton.enabled = NO;
    [self.activityIndicator startAnimating];
    __weak GeLoViewController *weakSelf = self;
    [self.deviceFinderService findDevices: ^(NSArray *allDevicesFound, GeLoDevice *device){
        if(weakSelf.scanTimer) [weakSelf.scanTimer invalidate];

        if(allDevicesFound.count == 1){
            NSDictionary *userInfoDict = @{@"Device": device};
            weakSelf.scanTimer = [NSTimer scheduledTimerWithTimeInterval:4 target:weakSelf selector:@selector(stopScanningAndConnect:) userInfo:userInfoDict repeats:NO];
        } else {
            [weakSelf.deviceFinderService stopFindingDevices];
            NSMutableDictionary *mutableUserInfoDict = [self.userInfoDict mutableCopy];
            [mutableUserInfoDict setObject:allDevicesFound forKey:@"Devices"];
            [weakSelf performSegueWithIdentifier:@"listBeacons" sender:self];
        }
    }];
}

- (void) stopScanningAndConnect:(NSTimer *)timer
{
    self.scanButton.enabled = YES;
    NSDictionary *dict =  timer.userInfo;
    [timer invalidate];
    GeLoDevice *device = [dict objectForKey:@"Device"];
    [self.deviceFinderService stopFindingDevices];
    [self connectToDevice: device];
}

- (void) connectToDevice:(GeLoDevice *)device{
    [self fadeBeacon:BeaconAnimationFadeIn duration:0.4f];

    __weak GeLoViewController *weakSelf = self;
    self.device = device;

    self.navigationItem.title = device.name;

    self.deviceService = [self.deviceFinderService prepareConnectTo: device
        onDisconnect: ^(GeLoDevice *device){
            UIAlertView *alertView = [[UIAlertView alloc]
                initWithTitle:@"Disconnected"
                message:@"The beacon has been disconnected."
                delegate:weakSelf
                cancelButtonTitle:@"OK"
                otherButtonTitles:nil];
            alertView.tag = 0;
            [alertView show];
        }];

    self.authProfile = [[GeLoAuthenticationProfile alloc] initWithDevice:self.device];
    [self.authProfile authAsCustomer];
    [self.deviceService addAuthenticationProfile:self.authProfile];

    self.bleDebugProfile = [[BLEDebugProfile alloc] initWithPeripheral:self.device.peripheral];
    [self.deviceService addProfile: self.bleDebugProfile];

    self.oacProfile = [[GeLoOACProfile alloc] initWithDevice: self.device];
    [self.deviceService addProfile: self.oacProfile];

    [self.deviceService connect];
}

- (void) authenticationSuccess: (NSNotification *) notification {
    self.statusLabel.text = @"Connected";
    [self.activityIndicator stopAnimating];
    self.device = notification.object;
    [self performSegueWithIdentifier:@"deviceConfigSegue" sender:self];
}

- (void) authenticationFailure: (NSNotification *) notification {
    self.statusLabel.text = @"Bad passcode";
    [self.activityIndicator stopAnimating];
    [self fadeBeacon:BeaconAnimationFadeOut duration:0.4f];
    self.scanButton.enabled = YES;
}


@end
