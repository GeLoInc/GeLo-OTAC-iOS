//
//  GeLoConnectableViewController.m
//  GeLoBeaconOTAConfiguration
//
//  Created by Thomas Peterson on 7/15/14.
//  Copyright (c) 2014 GeLo. All rights reserved.
//

#import "GeLoConnectableViewController.h"

@interface GeLoConnectableViewController ()

@end

@implementation GeLoConnectableViewController

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
    self.connectableSwitch.on = self.device.advertisingConnectable != 0;
	[self registerForSwitchNotifications];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)registerForSwitchNotifications {
    [self.connectableSwitch addTarget:self action:@selector(advConnectableWasChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)advConnectableWasChanged:(NSNotification*)aNotification {
    [self.device setAdvertisingConnectable:[[NSNumber numberWithBool:self.connectableSwitch.on] integerValue]];
}

@end
