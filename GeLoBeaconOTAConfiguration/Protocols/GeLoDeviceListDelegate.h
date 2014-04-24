//
//  GeLoDeviceListDelegate.h
//  GeLoBeaconOTAConfiguration
//
//  Created by Zach Dennis on 4/21/14.
//  Copyright (c) 2014 GeLo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GeLoFirmwareLibrary/GeLoDevice.h"

@protocol GeLoDeviceListDelegate <NSObject>

- (void)deviceListDidCancelSelection;
- (void)deviceListDidSelectDevice:(GeLoDevice *)device;

@end
