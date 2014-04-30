//
//  GeLoAdvMajorViewController.h
//  GeLoBeaconOTAConfiguration
//
//  Created by Zach Dennis on 4/15/14.
//  Copyright (c) 2014 GeLo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GeLoPropertyViewController.h"

/*
 * GeLoAdvMajorViewController is the view controller that
 * represents showing/editing the ibeacon major property.
 */
@interface GeLoAdvMajorViewController : GeLoPropertyViewController

@property (weak, nonatomic) IBOutlet UITextField *majorTextField;

@end
