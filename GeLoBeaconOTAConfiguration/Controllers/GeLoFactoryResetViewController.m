//
//  GeLoFactoryResetViewController.m
//  GeLoBeaconOTAConfiguration
//
//  Created by Zach Dennis on 4/18/14.
//  Copyright (c) 2014 GeLo. All rights reserved.
//

#import "GeLoFactoryResetViewController.h"

#define kResetCancelButton 0
#define kResetOkButton     1

@interface GeLoFactoryResetViewController ()

@end

@implementation GeLoFactoryResetViewController


- (IBAction)resetBeacon:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc]
        initWithTitle:@"Reset Beacon"
            message:@"Are you sure?"
        delegate:self
        cancelButtonTitle:@"Cancel"
        otherButtonTitles:@"Ok", nil];
    alertView.tag = 0;
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch(buttonIndex){
        case kResetCancelButton: {
            // no-op, do nothing
            break;
        }
        case kResetOkButton: {
            self.device.factoryReset = YES;
            [self.navigationController popViewControllerAnimated:YES];
            break;
        }
    }
}

@end
