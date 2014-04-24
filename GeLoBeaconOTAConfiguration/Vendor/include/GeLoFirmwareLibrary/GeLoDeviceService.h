//
//  GeLoDeviceService.h
//  GeLoFirmwareUpdater
//
//  Created by Zach Dennis on 3/28/14.
//  Copyright (c) 2014 Zach Dennis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "GeLoDevice.h"
#import "BLEProfile.h"
#import "GeLoAuthenticationProfile.h"
#import "GeLoOACProfile.h"

#define kGeLoDeviceAuthenticationSuccess  @"GeLoDeviceAuthenticationSuccess"
#define kGeLoDeviceAuthenticationFailure  @"GeLoDeviceAuthenticationFailure"

@interface GeLoDeviceService : NSObject<CBPeripheralDelegate>

- (id) initWithDevice: (GeLoDevice *)device
    connect: (void(^)(GeLoDevice *)) connect
    retryConnect:(void (^)(GeLoDevice *)) retryConnect
    disconnect: (void(^)(GeLoDevice *)) disconnect;
- (void) connect;
- (void) connected;
- (void) disconnect;
- (void) restartDevice;

- (void) addAuthenticationProfile:(GeLoAuthenticationProfile *)authProfile;
- (void) addProfile: (BLEProfile *) profile;

@property (strong,nonatomic) GeLoDevice *device;
@property (strong,nonatomic) void (^onDisconnect)(GeLoDevice *);

@end
