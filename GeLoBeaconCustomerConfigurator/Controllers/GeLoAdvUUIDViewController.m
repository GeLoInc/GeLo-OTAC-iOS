//
//  GeLoAdvUUIDViewController.m
//  GeLoBeaconCustomerConfigurator
//
//  Created by Zach Dennis on 4/15/14.
//  Copyright (c) 2014 GeLo. All rights reserved.
//

#import "GeLoAdvUUIDViewController.h"
#import "GeLoAlertHelper.h"

#define kValidUUIDLengthWithoutDashes 32
#define kValidUUIDCharacterClass "[A-Fa-f0-9]"

@interface GeLoAdvUUIDViewController ()

@end

@implementation GeLoAdvUUIDViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.uuidTextField.text = self.device.advertisingUUID;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)cleanUUID: (NSString *)uuid {
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression
        regularExpressionWithPattern:@"-"
        options:NSRegularExpressionCaseInsensitive
        error:&error];

    return [regex stringByReplacingMatchesInString:uuid options:0 range:NSMakeRange(0, uuid.length) withTemplate:@""];
}

- (BOOL)validateUUIDLength:(NSString *)uuid {
    return uuid.length == kValidUUIDLengthWithoutDashes;
}

- (BOOL)validateUUIDCharacters:(NSString *)uuid {
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression
        regularExpressionWithPattern:@kValidUUIDCharacterClass
        options:NSRegularExpressionCaseInsensitive
        error:&error];

    NSUInteger numberOfMatches = [regex numberOfMatchesInString:uuid options:0 range:NSMakeRange(0, uuid.length)];
    return numberOfMatches > 0;
}

- (IBAction)save:(id)sender{
    NSString *uuid = [self cleanUUID: self.uuidTextField.text];

    if([self validateUUIDLength: uuid]){
        if([self validateUUIDCharacters: uuid]){
            self.device.advertisingUUID = uuid;
            [super save:sender];            
        } else {
            [GeLoAlertHelper showError:@"The UUID is not valid. It contains invalid characters. Only A-F and 0-9 are allowed."
                withTitle:@"Invalid UUID"
                andUIControl:self.uuidTextField];
        }
    } else {
        [GeLoAlertHelper showError:@"The UUID is not valid. It doesn't have the right number of characters."
            withTitle:@"Invalid UUID"
            andUIControl:self.uuidTextField];
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
