//
//  UtilMacros.h
//  GeLoFirmwareUpdater
//
//  Created by Zach Dennis on 3/11/14.
//  Copyright (c) 2014 Zach Dennis. All rights reserved.
//

#ifndef GeLoFirmwareUpdater_UtilMacros_h
#define GeLoFirmwareUpdater_UtilMacros_h

#define HI_UINT32(a) (((a) >> 16) & 0xFFFF)  // Return the high 2 bytes from a uint32
#define LO_UINT32(a) ((a) & 0xFFFF)          // Return the low 2 bytes from a uint32

#define HI_UINT16(a) (((a) >> 8) & 0xff)     // Return the high byte from a uint16
#define LO_UINT16(a) ((a) & 0xff)            // Return the low byte from a uint16

#endif
