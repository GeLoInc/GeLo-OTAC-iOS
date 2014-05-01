//
//  GeLoAdvIntervalViewController.m
//  GeLoBeaconOTAConfiguration
//
//  Created by Zach Dennis on 4/15/14.
//  Copyright (c) 2014 GeLo. All rights reserved.
//

#import "GeLoAdvIntervalViewController.h"

@interface GeLoAdvIntervalViewController ()
@property (strong,nonatomic) NSNumberFormatter *numberFormatter;
@end

@implementation GeLoAdvIntervalViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.numberFormatter = [[NSNumberFormatter alloc] init];
    self.numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    self.numberFormatter.maximumFractionDigits = 2;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    NSString *str = [self.numberFormatter stringFromNumber: self.device.advertisingIntervalInMilliseconds];
    self.advIntervalTextField.text = str;

    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender{
    // Strip out separators in case for ease of editing a user left in a comma.
    // This prevents the number formatter from incorrectly producing 0 in
    // the case of 1,00 which should be interprted as 100.
    NSString *cleanedAdvInterval = [self.advIntervalTextField.text stringByReplacingOccurrencesOfString:self.numberFormatter.groupingSeparator withString:@""];
    NSNumber *n = [self.numberFormatter numberFromString:cleanedAdvInterval];
    self.device.advertisingIntervalInMilliseconds = n;
    [super save:sender];    
}

- (UIView *)inputAccessoryView {
    return nil;
}

@end
