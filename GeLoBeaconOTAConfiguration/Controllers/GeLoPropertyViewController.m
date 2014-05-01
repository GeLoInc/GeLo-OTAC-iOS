//
//  GeLoPropertyViewController.m
//  GeLoBeaconOTAConfiguration
//
//  Created by Zach Dennis on 4/15/14.
//  Copyright (c) 2014 GeLo. All rights reserved.
//

#import "GeLoPropertyViewController.h"

@interface GeLoPropertyViewController ()
@property (weak,nonatomic) GeLoDevice *device;
@end

@implementation GeLoPropertyViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.device = [self.userInfoDict objectForKey:@"Device"];
}

// Override in a subclass, call this after you have successfully saved.
// This will handle any navigation.
- (IBAction)save:(id)sender{
    [self dismiss];
}

- (IBAction)cancel:(id)sender{
    [self dismiss];
}

@end
