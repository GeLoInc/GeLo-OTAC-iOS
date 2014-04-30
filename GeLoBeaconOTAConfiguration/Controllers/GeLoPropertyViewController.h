//
//  GeLoPropertyViewController.h
//  GeLoBeaconOTAConfiguration
//
//  Created by Zach Dennis on 4/15/14.
//  Copyright (c) 2014 GeLo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GeLoFirmwareLibrary/GeLoDevice.h"

/*
 * GeLoPropertyViewController is a base class intended to be used
 * by more specific subclasses that represent a single property.
 *
 * It provides a common interface for saving and canceling a property
 * although specifics should be implemented by the subclass with super called
 * appropriately.
 */
@interface GeLoPropertyViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate>
@property (weak,readonly) GeLoDevice *device;

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end
