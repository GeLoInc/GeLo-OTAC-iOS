//
//  GeLoPasscodeViewController.h
//  GeLoBeaconOTAConfiguration
//
//  Created by Zach Dennis on 4/15/14.
//  Copyright (c) 2014 GeLo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GeLoPropertyViewController.h"

/*
 * GeLoPasscodeViewController is the view controller that
 * represents showing/editing the passcode for the device.
 */
@interface GeLoPasscodeViewController : GeLoPropertyViewController
@property (weak, nonatomic) IBOutlet UITextField *passcodeTextField;
@end
