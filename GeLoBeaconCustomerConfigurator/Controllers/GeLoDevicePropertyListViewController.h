//
//  GeLoDeviceConfigurationControllerTableViewController.h
//  GeLoBeaconCustomerConfigurator
//
//  Created by Zach Dennis on 4/11/14.
//  Copyright (c) 2014 GeLo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GeLoDevicePropertyListViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

- (IBAction)done:(id)sender;

@end
