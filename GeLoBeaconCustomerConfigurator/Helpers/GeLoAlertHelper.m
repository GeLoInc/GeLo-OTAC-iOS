//
//  GeLoAlertHelper.m
//  GeLoBeaconCustomerConfigurator
//
//  Created by Zach Dennis on 4/16/14.
//  Copyright (c) 2014 GeLo. All rights reserved.
//

#import "GeLoAlertHelper.h"

@implementation GeLoAlertHelper

+ (void)showError:(NSString *)msg withTitle:(NSString *)title andUIControl:(UIControl *) control {
    [control resignFirstResponder];
    UIAlertView *alertView = [[UIAlertView alloc]
        initWithTitle:title
            message:msg
        delegate:self
        cancelButtonTitle:@"OK"
        otherButtonTitles:nil];
    alertView.tag = 0;
    [alertView show];
}

@end
