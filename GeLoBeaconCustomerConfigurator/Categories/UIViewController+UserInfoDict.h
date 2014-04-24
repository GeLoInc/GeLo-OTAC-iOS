//
//  UIViewController+UserInfoDict.h
//  GeLoFirmwareUpdater
//
//  Created by Zach Dennis on 2/1/14.
//  Copyright (c) 2014 Zach Dennis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (UserInfoDict)

- (NSDictionary *) userInfoDict;
- (void) setUserInfoDict: (NSDictionary *) dict;

@end
