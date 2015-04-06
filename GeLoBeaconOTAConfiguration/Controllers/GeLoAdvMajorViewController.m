//
//  GeLoAdvMajorViewController.m
//  GeLoBeaconOTAConfiguration
//
//  Created by Zach Dennis on 4/15/14.
//  Copyright (c) 2014 GeLo. All rights reserved.
//

#import "GeLoAdvMajorViewController.h"
#import "GeLoAlertHelper.h"

#define kValidMinimumMajorValue 0
#define kValidMaximumMajorValue 65535

@interface GeLoAdvMajorViewController ()

@end

@implementation GeLoAdvMajorViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.majorTextField.text = [NSString stringWithFormat:@"%lu", (unsigned long)self.device.advertisingMajor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)validateMinimumMajorValue:(unsigned long)minor {
    return (minor >= kValidMinimumMajorValue);
}

- (BOOL)validateMaximumMajorValue:(unsigned long)minor {
	return (minor <= kValidMaximumMajorValue);
}

- (void)save:(id)sender {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterNoStyle;
    unsigned long major = [NSNumber numberWithLongLong:self.majorTextField.text.longLongValue].unsignedIntegerValue;
    if([self validateMinimumMajorValue: major]) {
		if ([self validateMaximumMajorValue: major]) {
			self.device.advertisingMajor = major;
			[super save:sender];
		}else {
			[GeLoAlertHelper showError:@"The major value is not valid. It must be less than or equal 65,535."
							 withTitle:@"Invalid Major"
						  andUIControl:self.majorTextField];
		}
	}else {
		[GeLoAlertHelper showError:@"The major value is not valid. It must be greater than or equal to 0."
						 withTitle:@"Invalid Major"
					  andUIControl:self.majorTextField];
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
