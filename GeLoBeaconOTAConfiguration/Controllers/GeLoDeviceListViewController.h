//
//  GeLoDeviceListViewController.h
//  GeLoBeaconOTAConfiguration
//
//  Created by Zach Dennis on 4/21/14.
//  Copyright (c) 2014 GeLo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GeLoDeviceListDelegate.h"
#import "GeLoFirmwareLibrary/GeLoDevice.h"

/*
 * GeLoDeviceListViewController is the view controller that lists
 * multiple devices found. It is usually not shown as the most common
 * flow for configuring beacons is to configure one at a time.
 */
@interface GeLoDeviceListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (strong, nonatomic)id<GeLoDeviceListDelegate> delegate;

- (IBAction)cancel:(id)sender;

@end
