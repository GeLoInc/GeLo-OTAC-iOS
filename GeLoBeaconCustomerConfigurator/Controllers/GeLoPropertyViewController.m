//
//  GeLoPropertyViewController.m
//  GeLoBeaconCustomerConfigurator
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

    [self registerForKeyboardNotifications];
}

- (void)registerForKeyboardNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self
            selector:@selector(keyboardWasShown:)
            name:UIKeyboardDidShowNotification object:nil];
   [[NSNotificationCenter defaultCenter] addObserver:self
             selector:@selector(keyboardWillBeHidden:)
             name:UIKeyboardWillHideNotification object:nil];
}

// Override in a subclass, call this after you have successfully saved.
// This will handle any navigation.
- (IBAction)save:(id)sender{
    [self dismiss];
}

- (IBAction)cancel:(id)sender{
    [self dismiss];
}

#pragma mark UITextFieldDelegate

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification {
}

// Called when the UIKeyboardWillHideNotification is sent    
- (void)keyboardWillBeHidden:(NSNotification*)aNotification {
}


@end
