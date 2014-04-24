//
//  GeLoAdvPowerViewController.m
//  GeLoBeaconOTAConfiguration
//
//  Created by Zach Dennis on 4/15/14.
//  Copyright (c) 2014 GeLo. All rights reserved.
//

#import "GeLoAdvPowerViewController.h"

#define kHighPowerIndex   0
#define kMediumPowerIndex 1
#define kLowPowerIndex    2

@interface GeLoAdvPowerViewController ()

@end

@implementation GeLoAdvPowerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch(indexPath.row){
        case kHighPowerIndex:
            [self.device setAdvertisingPowerToHigh];
            break;
        case kMediumPowerIndex:
            [self.device setAdvertisingPowerToMedium];
            break;
        case kLowPowerIndex:
            [self.device setAdvertisingPowerToLow];
            break;
    }

    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"GeLoAdvPowerCell"];

    switch(indexPath.row){
        case kHighPowerIndex:
            cell.textLabel.text = @"High";
            cell.detailTextLabel.text = @"0db";
            if(self.device.willTransmitAtHighPower){
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            } else {
                cell.accessoryType = UITableViewCellAccessoryNone;
            }
            break;
        case kMediumPowerIndex:
            cell.textLabel.text = @"Medium";
            cell.detailTextLabel.text = @"-6db";
            if(self.device.willTransmitAtMediumPower){
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            } else {
                cell.accessoryType = UITableViewCellAccessoryNone;
            }
            break;
        case kLowPowerIndex:
            cell.textLabel.text = @"Low";
            cell.detailTextLabel.text = @"-23db";
            if(self.device.willTransmitAtLowPower){
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            } else {
                cell.accessoryType = UITableViewCellAccessoryNone;
            }
            break;
    }

    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
