//
//  GeLoDeviceListDelegate.h
//  GeLoBeaconOTAConfiguration
//
//  Created by Zach Dennis on 4/21/14.
//  Copyright (c) 2014 GeLo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GeLoFirmwareLibrary/GeLoDevice.h"

/* 
 * GeLoDeviceListDelegate is the protocol that should be adhered to
 * when it is possible to select a GeLo device from a list of devices or
 * to cancel selecting any device at all.
 */
@protocol GeLoDeviceListDelegate <NSObject>

- (void)deviceListDidCancelSelection;
- (void)deviceListDidSelectDevice:(GeLoDevice *)device;

@end
