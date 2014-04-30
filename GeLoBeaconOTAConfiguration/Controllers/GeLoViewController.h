//
//  GeLoViewController.h
//  GeLoBeaconOTAConfiguration
//
//  Created by Zach Dennis on 4/10/14.
//  Copyright (c) 2014 GeLo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GeLoDeviceListDelegate.h"

/* 
 * GeLoViewController is the first view controller displayed in the application.
 */
@interface GeLoViewController : UIViewController<GeLoDeviceListDelegate>

@property (weak, nonatomic) IBOutlet UILabel *instructionsLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIImageView *beaconImageView;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *scanButton;

- (IBAction)scan:(id)sender;
@end
