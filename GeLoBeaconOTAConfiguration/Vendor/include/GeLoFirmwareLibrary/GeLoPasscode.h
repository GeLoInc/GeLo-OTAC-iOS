//
//  GeLoPasscode.h
//  GeLoFirmwareUpdater
//
//  Created by Zach Dennis on 2/11/14.
//  Copyright (c) 2014 Zach Dennis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GeLoLibraryMacros.h"

@interface GeLoPasscode : NSObject

+ (NSString *)geLoPasscodeString:(NSUInteger)serialNumber;
+ (NSString *)customerPasscodeString:(NSUInteger)serialNumber;

- (id) initWithSeed:(NSUInteger)major serialNumber:(NSUInteger)serialNumber secret:(NSUInteger)secret;

-(NSString *)passcodeAsString;

@end
