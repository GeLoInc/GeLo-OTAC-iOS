//
//  GeLoBLEDeviceService.h
//  GeLoFirmwareUpdater
//
//  Created by Zach Dennis on 3/28/14.
//  Copyright (c) 2014 Zach Dennis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "GeLoDeviceService.h"
#import "GeLoDevice.h"

@interface GeLoDeviceFinderService : NSObject<CBCentralManagerDelegate,CBPeripheralDelegate>

+ (GeLoDeviceFinderService *) instance;

- (id) init;
- (GeLoDeviceService *) prepareConnectTo:(GeLoDevice *) device onDisconnect: (void(^)(GeLoDevice *)) onDisconnect;
- (void) findDevices: (void (^)(NSArray *devices, GeLoDevice *device)) onDeviceFound;
- (void) stopFindingDevices;
- (void) reset;

- (NSArray *) devices;

@property (strong, nonatomic) void (^onBTLEStateChange)(void);

@end
