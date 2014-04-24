//
//  GeLoAuthenticationProfile.h
//  GeLoFirmwareUpdater
//
//  Created by Zach Dennis on 4/8/14.
//  Copyright (c) 2014 Zach Dennis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BLEProfile.h"
#import "GeLoDevice.h"

@interface GeLoAuthenticationProfile : BLEProfile

- (id) initWithDevice:(GeLoDevice *)device;
- (void) authAsCustomer;
- (void) authAsGeLo;

@property (readonly) BOOL authenticated;
@property (strong,nonatomic) void (^onAuthenticated)(GeLoDevice *, BOOL success);

@end
