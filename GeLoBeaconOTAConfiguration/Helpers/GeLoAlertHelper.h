//
//  GeLoAlertHelper.h
//  GeLoBeaconOTAConfiguration
//
//  Created by Zach Dennis on 4/16/14.
//  Copyright (c) 2014 GeLo. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 * GeLoAlertHelper is a helper class for displaying common alert messages to the
 * user.
 */
@interface GeLoAlertHelper : NSObject

+ (void)showError:(NSString *)msg withTitle:(NSString *)title andUIControl: (UIControl *) control;

@end
