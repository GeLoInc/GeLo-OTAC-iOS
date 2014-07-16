//
//  GeLoDeviceConfigurationControllerTableViewController.m
//  GeLoBeaconOTAConfiguration
//
//  Created by Zach Dennis on 4/11/14.
//  Copyright (c) 2014 GeLo. All rights reserved.
//

#import "GeLoDevicePropertyListViewController.h"
#import "GeLoFirmwareLibrary/GeLoDeviceService.h"

@interface GeLoDevicePropertyListViewController ()
@property (strong,nonatomic) GeLoDeviceService *deviceService;
@property (strong,nonatomic) NSArray *configurableProperties;
@property (nonatomic, strong) UIBarButtonItem *backButton;
@property (nonatomic, strong) GeLoDevice *device;
@end

#define kBeaconPropertyAdvIntervalIndex (0)
#define kBeaconPropertyAdvChannelsIndex (1)
#define kBeaconPropertyAdvUUIDIndex     (2)
#define kBeaconPropertyAdvMajorIndex    (3)
#define kBeaconPropertyAdvMinorIndex    (4)
#define kBeaconPropertyAdvPowerIndex    (5)
#define kBeaconPropertyPasscodeIndex    (6)
#define kBeaconPropertyConnectableIndex (7)
#define kBeaconFactoryResetIndex        (8)

#define kBeaconPropertyAdvInterval "Adv. Interval"
#define kBeaconPropertyAdvChannels "Adv. Channels"
#define kBeaconPropertyAdvUUID     "UUID"
#define kBeaconPropertyAdvMajor    "Major"
#define kBeaconPropertyAdvMinor    "Minor"
#define kBeaconPropertyAdvPower    "Power"
#define kBeaconPropertyPasscode    "Passcode"
#define kBeaconFactoryReset        "Factory Reset"
#define kBeaconPropertyConnectable "Connectable"



@implementation GeLoDevicePropertyListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;

    self.configurableProperties = @[
        @kBeaconPropertyAdvInterval,
        @kBeaconPropertyAdvChannels,
        @kBeaconPropertyAdvUUID,
        @kBeaconPropertyAdvMajor,
        @kBeaconPropertyAdvMinor,
        @kBeaconPropertyAdvPower,
        @kBeaconPropertyPasscode,
		@kBeaconPropertyConnectable,
        @kBeaconFactoryReset
    ];

    self.clearsSelectionOnViewWillAppear = YES;

    self.backButton = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = self.backButton;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.deviceService = [self.userInfoDict objectForKey: @"DeviceService"];
    self.device = [self.userInfoDict objectForKey: @"Device"];

    self.doneButton.title = @"Done";

    NSArray *keypaths = @[
        @keypath(self.device.advertisingIntervalLoaded),
        @keypath(self.device.advertisingChannelMapLoaded),
        @keypath(self.device.advertisingUUIDLoaded),
        @keypath(self.device.advertisingMajorLoaded),
        @keypath(self.device.advertisingMinorLoaded),
        @keypath(self.device.advertisingTransmitPowerLoaded),
        @keypath(self.device.advertisingPasscodeLoaded),
		@keypath(self.device.advertisingConnectableLoaded)
    ];
    [self observeProperties:keypaths withBlock:^(__weak GeLoDevicePropertyListViewController *self, NSString *keyPath, id old, id new) {
        [[self tableView] reloadData];
    }];
}


- (void) dealloc {
	/// Make sure we remove all of our observations otherwise we'll get a lot of hate regarding KVO.
	[self removeAllObservations];
}

- (void)viewWillDisappear:(BOOL)animated {
	/// Make sure we remove all of our observations otherwise we'll get a lot of hate regarding KVO.
	[self removeAllObservations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *targetVC = (UIViewController *) [segue destinationViewController];
    [targetVC setUserInfoDict: [self.userInfoDict copy]];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.configurableProperties.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *property = [self.configurableProperties objectAtIndex:indexPath.row];
    if([property isEqualToString: @kBeaconPropertyAdvInterval]){
        [self performSegueWithIdentifier:@"pushEditAdvInterval" sender:self];

    } else if([property isEqualToString: @kBeaconPropertyAdvChannels]){
        [self performSegueWithIdentifier:@"pushEditAdvChannels" sender:self];

    } else if([property isEqualToString: @kBeaconPropertyAdvUUID]){
        [self performSegueWithIdentifier:@"pushEditAdvUUID" sender:self];

    } else if([property isEqualToString: @kBeaconPropertyAdvMajor]){
        [self performSegueWithIdentifier:@"pushEditAdvMajor" sender:self];

    } else if([property isEqualToString: @kBeaconPropertyAdvMinor]){
        [self performSegueWithIdentifier:@"pushEditAdvMinor" sender:self];

    } else if([property isEqualToString: @kBeaconPropertyAdvPower]){
        [self performSegueWithIdentifier:@"pushEditAdvPower" sender:self];

    } else if([property isEqualToString: @kBeaconPropertyPasscode]){
        [self performSegueWithIdentifier:@"pushEditPasscode" sender:self];
        
    } else if([property isEqualToString: @kBeaconPropertyConnectable]){
		[self performSegueWithIdentifier:@"pushEditConnectable" sender:self];

	} else if([property isEqualToString: @kBeaconFactoryReset]){
        [self performSegueWithIdentifier:@"pushFactoryReset" sender:self];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"GeLoPropertyCell"];

    NSString *subtitle = @"Loading...";
    NSString *title = [self.configurableProperties objectAtIndex:indexPath.row];

    switch(indexPath.row){
        case(kBeaconPropertyAdvIntervalIndex): {
            if(self.device.advertisingIntervalLoaded){
                subtitle = self.device.advertisingIntervalInMillisecondsString;
            }
            break; }
        case(kBeaconPropertyAdvChannelsIndex): {
            if(self.device.advertisingChannelMapLoaded){
                subtitle = self.device.advertisingChannelMapString;
            }
            break; }
        case(kBeaconPropertyAdvUUIDIndex): {
            if(self.device.advertisingUUIDLoaded){
                subtitle = self.device.advertisingUUID;
            }
            break; }
        case(kBeaconPropertyAdvMajorIndex): {
            if(self.device.advertisingMajorLoaded){
                subtitle = [NSString stringWithFormat: @"%lu", (unsigned long)self.device.advertisingMajor];
            }
            break; }
        case(kBeaconPropertyAdvMinorIndex): {
            if(self.device.advertisingMinorLoaded){
                subtitle = [NSString stringWithFormat: @"%lu", (unsigned long)self.device.advertisingMinor];
            }
            break; }
        case(kBeaconPropertyAdvPowerIndex): {
            if(self.device.advertisingTransmitPowerLoaded   ){
                subtitle = self.device.advertisingTransmitPowerString;
            }
            break; }
        case(kBeaconPropertyPasscodeIndex): {
            if(self.device.advertisingPasscodeLoaded){
                subtitle = @"";
            }
            break; }
		case(kBeaconPropertyConnectableIndex): {
			if (self.device.advertisingConnectableLoaded) {
				subtitle = self.device.advertisingConnectableString;
			}
			break; }
        case(kBeaconFactoryResetIndex): {
				subtitle = @"";
            break; }
    }

    cell.textLabel.text = title;
    cell.detailTextLabel.text = subtitle;

    return cell;
}

- (IBAction)done:(id)sender {
    self.doneButton.title = @"Restarting";    
    self.doneButton.enabled = false;
    __weak UIViewController *weakSelf = self;
    if(self.deviceService){
        [self.deviceService restartDevice:^{
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }];
    }
}

@end
