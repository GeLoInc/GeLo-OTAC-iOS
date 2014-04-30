//
//  GeLoAdvMinorViewController.h
//  GeLoBeaconOTAConfiguration
//
//  Created by Zach Dennis on 4/15/14.
//  Copyright (c) 2014 GeLo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GeLoPropertyViewController.h"

/*
 * GeLoAdvMinorViewController is the view controller that
 * represents showing/editing the ibeacon minor property.
 */
@interface GeLoAdvMinorViewController : GeLoPropertyViewController
@property (weak, nonatomic) IBOutlet UITextField *minorTextField;
@end
