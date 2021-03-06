//
//  GeLoAdvChannelsViewController.h
//  GeLoBeaconOTAConfiguration
//
//  Created by Zach Dennis on 4/15/14.
//  Copyright (c) 2014 GeLo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GeLoPropertyViewController.h"

/*
 * GeLoAdvChannelsViewController is the view controller that
 * represents showing/editing the device's advertising channels.
 */
@interface GeLoAdvChannelsViewController : GeLoPropertyViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
