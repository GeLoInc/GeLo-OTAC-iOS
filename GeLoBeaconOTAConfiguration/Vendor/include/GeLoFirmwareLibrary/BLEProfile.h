//
//  BLEProfile.h
//  GeLoFirmwareUpdater
//
//  Created by Zach Dennis on 3/28/14.
//  Copyright (c) 2014 Zach Dennis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface BLEProfile : NSObject

+ (CBUUID *) serviceCBUUID;

@property (strong,nonatomic) CBPeripheral *peripheral;
@property BOOL requiresAuthentication;
@property BOOL shouldDiscoverCharacteristics;
@property BOOL shouldDiscoverCharacteristicDescriptors;
@property (strong,nonatomic) CBUUID *serviceCBUUID;
@property (strong,nonatomic) NSArray *characteristicCBUUIDs;
@property (strong,nonatomic) void (^refreshBlock)(BLEProfile *_profile);

- (id) initWithPeripheral:(CBPeripheral *)peripheral;

// no-op by default, override in subclass. This is called when
// the profile is no longer going to be used. Perform cleanup.
- (void) cancel;

// no-op by default, override in subclass. This is called when
// the profile is no longer going to be used. Perform cleanup.
- (void) disconnected;

// will call refreshBlock if set to request that the profile be refreshed from the
// device, otherwise no-op.
- (void) refresh;

// no-op by default, override in subclass. Called when
// the profile received a write response from a characteristic
- (void) didWriteValueForCharacteristic:(CBCharacteristic *) characteristic error: (NSError *) error;

// Defaults to NO.
- (BOOL) shouldNotifyCharacteristicValue: (CBCharacteristic *) characteristic;

/* Defaults to YES for readable properties otherwise NO. */
- (BOOL) shouldReadCharacteristicValue: (CBCharacteristic *) characteristic;

/* Defaults to YES */
- (BOOL) shouldReadCharacteristicDescriptorValue: (CBDescriptor *) descriptor;

// no-op by default, override in subclass
- (void) discoveredCharacteristic: (CBCharacteristic *) characteristic;

// no-op by default, override in subclass
- (void) discoveredCharacteristicDescriptor: (CBDescriptor *) descriptor;

// no-op by default, override in subclass
- (void) updateValueForCharacteristic: (CBCharacteristic *) characteristic;

// no-op by default, override in subclass
- (void) updateValueForDescriptor: (CBDescriptor *) descriptor;

@end
