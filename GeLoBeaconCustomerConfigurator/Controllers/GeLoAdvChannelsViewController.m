//
//  GeLoAdvChannelsViewController.m
//  GeLoBeaconCustomerConfigurator
//
//  Created by Zach Dennis on 4/15/14.
//  Copyright (c) 2014 GeLo. All rights reserved.
//

#import "GeLoAdvChannelsViewController.h"

@interface GeLoAdvChannelsViewController ()
@property (nonatomic,strong) UISwitch *advOn37Switch;
@property (nonatomic,strong) UISwitch *advOn38Switch;
@property (nonatomic,strong) UISwitch *advOn39Switch;
@end

@implementation GeLoAdvChannelsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    self.advOn37Switch = [[UISwitch alloc] init];
    self.advOn38Switch = [[UISwitch alloc] init];
    self.advOn39Switch = [[UISwitch alloc] init];

    [self registerForSwitchNotifications];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.advOn37Switch.on = self.device.willAdvertiseOnChannel37;
    self.advOn38Switch.on = self.device.willAdvertiseOnChannel38;
    self.advOn39Switch.on = self.device.willAdvertiseOnChannel39;
}

# pragma mark Private Methods

- (void)registerForSwitchNotifications {
    [self.advOn37Switch addTarget:self action:@selector(advChannelsWereChanged:) forControlEvents:UIControlEventValueChanged];
    [self.advOn38Switch addTarget:self action:@selector(advChannelsWereChanged:) forControlEvents:UIControlEventValueChanged];
    [self.advOn39Switch addTarget:self action:@selector(advChannelsWereChanged:) forControlEvents:UIControlEventValueChanged];

}

- (void)advChannelsWereChanged:(NSNotification*)aNotification
{
    [self.device
        setAdvertiseOnChannel37:self.advOn37Switch.on
        andChannel38:self.advOn38Switch.on
        andChannel39:self.advOn39Switch.on];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"GeLoAdvChannelCell"];

    switch(indexPath.row){
        case 0:
            cell.textLabel.text = @"Channel 37";
            cell.accessoryView = self.advOn37Switch;
            break;
        case 1:
            cell.textLabel.text = @"Channel 38";
            cell.accessoryView = self.advOn38Switch;
            break;
        case 2:
            cell.textLabel.text = @"Channel 39";
            cell.accessoryView = self.advOn39Switch;
            break;
    }

    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
