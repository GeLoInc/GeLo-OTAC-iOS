/*
 BLETIOADProfile.h
 TIOADExample

 Created by Ole Andreas Torvmark on 11/22/12.
 Copyright (c) 2013 Texas Instruments. All rights reserved.

 */

#import "oad.h"
#import "BLEProfile.h"
#import "GeLoDevice.h"
#import "GeLoFirmwareImage.h"

@protocol GeLoOADProfileDelegate<NSObject>
- (void) oadProfileUploadReady;
- (void) oadProfileUploadStarted;
- (void) oadProfileUploadFinished;
- (void) oadProfileUploadCanceled;
- (void) oadProfileUploadProgress: (float) percentage secondsRemaining: (float) secondsRemaining withBlocksLeft: (NSUInteger) blocksLeft ofTotalBlocksRemaining: (NSUInteger) totalBlocks;
@end


@interface GeLoOADProfile : BLEProfile

@property (strong,nonatomic) GeLoFirmwareImage *firmwareImage;
@property (strong,nonatomic) GeLoDevice *d;
@property (strong,nonatomic) id<GeLoOADProfileDelegate> delegate;

@property int nBlocks;
@property int nBytes;
@property int iBlocks;
@property int iBytes;
@property BOOL canceled;
@property BOOL inProgramming;
@property uint16_t imgVersion;

-(id) initWithDevice:(GeLoDevice *) device;
-(void) cancel;
-(void) configureProfile;

-(void) uploadImage:(GeLoFirmwareImage *)firmwareImage;

@end
