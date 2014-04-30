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

/* 
 * Displays a UIAlert for the given error message, title, and UIControl. Always
 * uses an "OK" cancel button. There is no way to determine what button was selected.
 */
+ (void)showError:(NSString *)msg withTitle:(NSString *)title andUIControl: (UIControl *) control;

@end
