//
//  GeLoPasscodeViewController.m
//  GeLoBeaconOTAConfiguration
//
//  Created by Zach Dennis on 4/15/14.
//  Copyright (c) 2014 GeLo. All rights reserved.
//

#import "GeLoPasscodeViewController.h"

@interface GeLoPasscodeViewController ()

@end

@implementation GeLoPasscodeViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.passcodeTextField.text = [NSString stringWithFormat: @"%lu", (unsigned long)self.device.advertisingPasscode];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)save:(id)sender
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterNoStyle;
    self.device.advertisingPasscode = [NSNumber numberWithLongLong:self.passcodeTextField.text.longLongValue].unsignedIntegerValue;
    [super save:sender];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
