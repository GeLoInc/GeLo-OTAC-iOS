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
@interface GeLoPropertyViewController : UIViewController
@property (weak,readonly) GeLoDevice *device;

/*
 * Save always dismisses the current property view controller. Should be overridden
 * by every subclass and called via [super save] when the subclass has finished
 * it's saving action.
 */
- (IBAction)save:(id)sender;

/*
 * Cancel always dismisses the current property view controller. Should be overridden
 * by a subclass for cancel-specific beahvior and called via [super cancel] when
 * the subclass is done canceling. Otherwise, don't override. 
 */
- (IBAction)cancel:(id)sender;

@end
