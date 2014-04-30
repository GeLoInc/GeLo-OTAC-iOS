//
//  GeLoAdvUUIDViewController.h
//  GeLoBeaconOTAConfiguration
//
//  Created by Zach Dennis on 4/15/14.
//  Copyright (c) 2014 GeLo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GeLoPropertyViewController.h"

/*
 * GeLoAdvUUIDViewController is the view controller that
 * represents showing/editing the advertising UUID property.
 */
@interface GeLoAdvUUIDViewController : GeLoPropertyViewController

@property (weak, nonatomic) IBOutlet UITextField *uuidTextField;

@end
