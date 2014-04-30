//
//  GeLoDeviceConfigurationControllerTableViewController.h
//  GeLoBeaconOTAConfiguration
//
//  Created by Zach Dennis on 4/11/14.
//  Copyright (c) 2014 GeLo. All rights reserved.
//

#import <UIKit/UIKit.h>

/* 
 * GeLoDevicePropertyListViewController is shown when a user has connected
 * to a device and they are viewing all properties on that device.
 */
@interface GeLoDevicePropertyListViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

- (IBAction)done:(id)sender;

@end
