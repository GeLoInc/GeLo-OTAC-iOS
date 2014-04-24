//
//  GeLoDeviceCharacteristic.h
//  GeLoFirmwareUpdater
//
//  Created by Zach Dennis on 3/27/14.
//  Copyright (c) 2014 Zach Dennis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface GeLoDeviceCharacteristic : NSObject

+ (GeLoDeviceCharacteristic *)withName:(NSString *)name UUID:(CBUUID *) uuid;

- (id)initWithName:(NSString *)name UUID:(CBUUID *) uuid;

@property (copy) NSString *name;
@property CBUUID *UUID;
@property NSString *value;
@end
