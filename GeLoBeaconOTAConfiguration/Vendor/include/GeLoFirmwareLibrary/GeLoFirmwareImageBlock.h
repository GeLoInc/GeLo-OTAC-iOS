//
//  GeLoFirmwareImageBlock.h
//  GeLoFirmwareUpdater
//
//  Created by Zach Dennis on 2/27/14.
//  Copyright (c) 2014 Zach Dennis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GeLoFirmwareLibrary/GeLoLibraryMacros.h"
#import "oad.h"

@interface GeLoFirmwareImageBlock : NSObject

@property (readonly) NSUInteger number;
@property (readonly) NSData *data;

+(NSArray *)arrayWithData:(NSData *) data;

-(id) initWithNumber:(NSUInteger) number andData: (NSData *) data;
-(NSData *) requestData;


@end
