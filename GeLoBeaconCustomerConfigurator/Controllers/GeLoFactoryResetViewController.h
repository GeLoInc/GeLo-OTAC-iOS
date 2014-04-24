//
//  GeLoFactoryResetViewController.h
//  GeLoBeaconCustomerConfigurator
//
//  Created by Zach Dennis on 4/18/14.
//  Copyright (c) 2014 GeLo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GeLoPropertyViewController.h"

@interface GeLoFactoryResetViewController : GeLoPropertyViewController<UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *resetBeaconButton;

- (IBAction)resetBeacon:(id)sender;

@end
