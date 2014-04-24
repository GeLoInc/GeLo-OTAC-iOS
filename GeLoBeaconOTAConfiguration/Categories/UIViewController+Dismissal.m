//
//  UIViewController+Dismissal.m
//  GeLoBeaconOTAConfiguration
//
//  Created by Zach Dennis on 4/21/14.
//  Copyright (c) 2014 GeLo. All rights reserved.
//

#import "UIViewController+Dismissal.h"

@implementation UIViewController (Dismissal)

- (void)dismiss{
    BOOL isModal = self.presentingViewController ? YES : NO;
    if(isModal){
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
