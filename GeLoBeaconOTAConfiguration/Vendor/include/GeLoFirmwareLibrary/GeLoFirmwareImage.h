//
//  GeLoFirmwareImage.h
//  GeLoFirmwareUpdater
//
//  Created by Zach Dennis on 2/4/14.
//  Copyright (c) 2014 Zach Dennis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GeLoFirmwareImageBlock.h"
#import "oad.h"

#define GeLoFirmwareImageFileExtension @"bin"

@interface GeLoFirmwareImage : NSObject

+ (GeLoFirmwareImage *) fromFileAtPath: (NSString *) filePath;

- (id) initWithData: (NSData *) data;

- (NSData *)header;
- (void) enumerateBlocksUsingBlock:(void (^)(GeLoFirmwareImageBlock *imageBlock, NSUInteger idx, BOOL *stop)) block;
- (void) resetEnumerationToBlockNumber: (NSUInteger) blkNumber;

@property (readonly) NSArray* blocks;
@property (readonly) NSData *data;
@property (readonly) NSUInteger version;
@property (readonly) BOOL isValid;

@end
