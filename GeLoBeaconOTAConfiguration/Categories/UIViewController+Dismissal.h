//
//  UIViewController+Dismissal.h
//  GeLoBeaconOTAConfiguration
//
//  Created by Zach Dennis on 4/21/14.
//  Copyright (c) 2014 GeLo. All rights reserved.
//

#import <UIKit/UIKit.h>

/* 
 * UIViewController+Dismissal adds method(s) to UIViewController
 * to allow it be dismissed regardless of if its a modal
 * window or not.
 */
@interface UIViewController (Dismissal)

/*
 * Pops current view controller from the stack regardless of if its modal or not.
 */
- (void)dismiss;

@end
