//
//  GeLoAdvMinorViewController.m
//  GeLoBeaconOTAConfiguration
//
//  Created by Zach Dennis on 4/15/14.
//  Copyright (c) 2014 GeLo. All rights reserved.
//

#import "GeLoAdvMinorViewController.h"
#import "GeLoAlertHelper.h"

#define kValidMinimumMinorValue 1
#define kValidMaximumMinorValue 65535

@interface GeLoAdvMinorViewController ()

@end

@implementation GeLoAdvMinorViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.minorTextField.text = [NSString stringWithFormat:@"%lu", (unsigned long)self.device.advertisingMinor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)validateMinimumMinorValue:(unsigned long)minor {
    return (minor >= kValidMinimumMinorValue);
}

- (BOOL)validateMaximumMinorValue:(unsigned long)minor {
	return (minor <= kValidMaximumMinorValue);
}

- (void)save:(id)sender {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterNoStyle;
    unsigned long minor = [NSNumber numberWithLongLong:self.minorTextField.text.longLongValue].unsignedIntegerValue;
	if([self validateMinimumMinorValue: minor]) {
		if ([self validateMaximumMinorValue: minor]) {
			self.device.advertisingMinor = minor;
			[super save:sender];
		}else {
			[GeLoAlertHelper showError:@"The minor value is not valid. It must be less than or equal to 65,535."
							 withTitle:@"Invalid Minor"
						  andUIControl:self.minorTextField];
		}
	}else {
		[GeLoAlertHelper showError:@"The minor value is not valid. It must be greater than 0."
						 withTitle:@"Invalid Minor"
					  andUIControl:self.minorTextField];
	}
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
