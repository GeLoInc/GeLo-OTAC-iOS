//
//  GeLoDevice.h
//  GeLoFirmwareUpdater
//
//  Created by Zach Dennis on 2/1/14.
//  Copyright (c) 2014 Zach Dennis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

/*****************************************************************
* GeLoDeviceProperty values represent the core properties
* that a GeLo device has. There are reader methods
* available which make consuming properties easier, but these
* are the primitive properties.
*/
typedef NS_ENUM(NSUInteger, GeLoDeviceProperty) {
  GeLoDevicePropertyAdvertisingSerialNumber,
  GeLoDevicePropertyAdvertisingMajor,
  GeLoDevicePropertyAdvertisingMinor,
  GeLoDevicePropertyAdvertisingTransmitPower,
  GeLoDevicePropertyAdvertisingCalibratedPower,
  GeLoDevicePropertyAdvertisingInterval,
  GeLoDevicePropertyAdvertisingChannelMap,
  GeLoDevicePropertyAdvertisingUUID,
  GeLoDevicePropertyAdvertisingPasscode,
  GeLoDevicePropertyFactoryReset
};

#define kGeLoSelectedDevice @"kGeLoSelectedDevice"
#define kGeLoMaintenanceManufacturerDataLength 9

typedef void(^GeLoDevicePropertyChangeBlock)(void);

@interface GeLoDevice : NSObject <NSCopying>

-(id) initWithPeripheral: (CBPeripheral *) peripheral andManager: (CBCentralManager *) manager;
-(NSString *)geLoPasscode;
-(NSString *)customerPasscode;
-(void) loadProperty:(GeLoDeviceProperty)property value:(id)value;
-(void) updateWithAdvertisementData: (NSDictionary *) advertisementData;

/*****************************************************************
* Peripheral and Manager are used to ensure we have the latest version of the peripheral
* that represents this device.
*/
@property (nonatomic, strong) CBPeripheral *peripheral;
@property (nonatomic, strong) CBCentralManager *manager;

/* Device identification and related properties for maintenance mode */
@property (nonatomic, readonly) NSString *identifier;
@property (nonatomic, readonly) NSString *name;
@property NSUInteger companyId;
@property NSUInteger major;
@property NSUInteger minor;
@property NSUInteger build;
@property (nonatomic) NSUInteger serialNumber;
@property (readonly) NSString *firmwareVersion;


@property BOOL factoryReset;


/*****************************************************************
 * ADVERTISING PROPERTIES FOR THE DEVICE WHEN IT IS NOT IN MAINTENANCE
 ******************************************************************/

/* advertisingInterval returns in microseconds */
@property (nonatomic) NSNumber *advertisingInterval;
@property (nonatomic) NSNumber *advertisingIntervalInMilliseconds;
@property (readonly) NSString *advertisingIntervalInMillisecondsString;
@property (nonatomic) BOOL advertisingIntervalLoaded;

@property (nonatomic) NSUInteger advertisingChannelMap;
@property (readonly) BOOL willAdvertiseOnChannel37;
@property (readonly) BOOL willAdvertiseOnChannel38;
@property (readonly) BOOL willAdvertiseOnChannel39;
@property (nonatomic) BOOL advertisingChannelMapLoaded;
@property (readonly) NSString *advertisingChannelMapString;
- (void)setAdvertiseOnChannel37:(BOOL)on37 andChannel38:(BOOL)on38 andChannel39:(BOOL)on39;

@property (nonatomic) NSData *advertisingUUIDData;
@property (nonatomic) NSString *advertisingUUID;

@property (nonatomic) BOOL advertisingUUIDLoaded;

@property (nonatomic) NSUInteger advertisingSerialNumber;
@property (nonatomic) BOOL advertisingSerialNumberLoaded;

@property (nonatomic) NSUInteger advertisingMajor;
@property (nonatomic) BOOL advertisingMajorLoaded;

@property (nonatomic) NSUInteger advertisingMinor;
@property (nonatomic) BOOL advertisingMinorLoaded;

@property (nonatomic) NSUInteger advertisingPasscode;
@property (nonatomic) BOOL advertisingPasscodeLoaded;

@property (nonatomic) NSUInteger advertisingTransmitPower;
@property (nonatomic) BOOL advertisingTransmitPowerLoaded;
@property (readonly) NSString *advertisingTransmitPowerString;
@property (readonly) BOOL willTransmitAtHighPower;
@property (readonly) BOOL willTransmitAtMediumPower;
@property (readonly) BOOL willTransmitAtLowPower;
- (void)setAdvertisingPowerToHigh;
- (void)setAdvertisingPowerToMedium;
- (void)setAdvertisingPowerToLow;

@property (nonatomic) NSInteger advertisingCalibratedPower;
@property (nonatomic) BOOL advertisingCalibratedPowerLoaded;


@end



