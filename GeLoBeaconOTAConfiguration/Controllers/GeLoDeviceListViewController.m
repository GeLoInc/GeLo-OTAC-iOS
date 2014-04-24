//
//  GeLoDeviceListViewController.m
//  GeLoBeaconOTAConfiguration
//
//  Created by Zach Dennis on 4/21/14.
//  Copyright (c) 2014 GeLo. All rights reserved.
//

#import "GeLoDeviceListViewController.h"
#import "GeLoFirmwareLibrary/GeLoDeviceFinderService.h"
#import "GeLoFirmwareLibrary/GeLoDeviceService.h"
#import "GeLoFirmwareLibrary/GeLoDevice.h"

@interface GeLoDeviceListViewController ()
@property (strong,nonatomic) GeLoDeviceFinderService *deviceFinderService;
@property (strong,nonatomic) GeLoDeviceService *deviceService;
@property (weak,nonatomic) NSArray *devices;
@end

@implementation GeLoDeviceListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.deviceFinderService = [GeLoDeviceFinderService instance];
    self.navigationBar.topItem.title = @"Multiple Found";
    [self startScan];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startScan {
    __weak GeLoDeviceListViewController *weakSelf = self;
    [self.deviceFinderService findDevices: ^(NSArray *allDevicesFound, GeLoDevice *device){
        weakSelf.devices = allDevicesFound;
        [weakSelf.tableView reloadData];
    }];
}

- (IBAction)cancel:(id)sender {
    [self.deviceFinderService stopFindingDevices];
    [self.delegate deviceListDidCancelSelection];
    [self dismiss];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.deviceFinderService.devices.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"beaconTableViewCell" forIndexPath: indexPath];

    GeLoDevice *device = [self.devices objectAtIndex: indexPath.row];
    cell.textLabel.text = device.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.deviceFinderService stopFindingDevices];
    GeLoDevice *device = [self.devices objectAtIndex:indexPath.row];
    if(self.delegate){
        [self.delegate deviceListDidSelectDevice:device];
        [self dismiss];
    }
}

@end
