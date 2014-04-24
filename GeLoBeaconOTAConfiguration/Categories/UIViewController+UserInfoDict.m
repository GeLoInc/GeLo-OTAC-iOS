//
//  UIViewController+UserInfoDict.m
//  GeLoFirmwareUpdater
//
//  Created by Zach Dennis on 2/1/14.
//  Copyright (c) 2014 Zach Dennis. All rights reserved.
//

#import "UIViewController+UserInfoDict.h"
#import <objc/runtime.h>

static NSDictionary *UserInfoDict;

@implementation UIViewController (UserInfoDict)

- (NSDictionary *) userInfoDict {
    NSDictionary* dict = objc_getAssociatedObject(self, &UserInfoDict);
    if (!dict)
        return @{};
    return dict;
}

- (void) setUserInfoDict: (NSDictionary *) dict {
    objc_setAssociatedObject(self, &UserInfoDict, dict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
