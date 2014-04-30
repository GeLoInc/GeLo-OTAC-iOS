//
//  UIViewController+UserInfoDict.h
//  GeLoFirmwareUpdater
//
//  Created by Zach Dennis on 2/1/14.
//  Copyright (c) 2014 Zach Dennis. All rights reserved.
//

#import <UIKit/UIKit.h>

/* 
 * UIViewController+UserInfoDict adds method(s) to UIViewController
 * to allow data to be passed between view controllers. It's akin
 * to the mechanism for passing route parameters in web applications.
 *
 * Note: It uses the userInfoDict name based on common Cocoa conventions.
 */
@interface UIViewController (UserInfoDict)

- (NSDictionary *) userInfoDict;
- (void) setUserInfoDict: (NSDictionary *) dict;

@end
