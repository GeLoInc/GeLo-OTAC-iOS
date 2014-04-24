//
//  GeLoPropertyViewController.h
//  GeLoBeaconOTAConfiguration
//
//  Created by Zach Dennis on 4/15/14.
//  Copyright (c) 2014 GeLo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GeLoFirmwareLibrary/GeLoDevice.h"

@interface GeLoPropertyViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate>
@property (weak,readonly) GeLoDevice *device;

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end
