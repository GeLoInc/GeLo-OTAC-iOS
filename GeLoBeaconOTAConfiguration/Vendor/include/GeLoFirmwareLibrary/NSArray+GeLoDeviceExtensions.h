//
//  GeLoDevice.h
//  GeLoFirmwareUpdater
//
//  Created by Zach Dennis on 2/1/14.
//  Copyright (c) 2014 Zach Dennis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "GeLoDevice.h"

@interface NSArray (GeLoDeviceExtensions)

- (GeLoDevice *) deviceForPeripheral: (CBPeripheral *) peripheral;

@end
