//
//  GeLoOACProfile.h
//  GeLoFirmwareUpdater
//
//  Created by Zach Dennis on 3/28/14.
//  Copyright (c) 2014 Zach Dennis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BLEPRofile.h"
#import "GeLoDevice.h"

@interface GeLoOACProfile : BLEProfile

- (id) initWithDevice:(GeLoDevice *)device;
- (void) factoryReset;
- (void) restartDevice;

@property (nonatomic,strong) GeLoDevice *device;

@end
