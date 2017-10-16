//
//  FirstViewController.m
//  NSNotificationCenterStepper
//
//  Created by Sanjay Shah on 2017-10-15.
//  Copyright © 2017 Sanjay Shah. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@property NSDictionary *userInfo;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   // SecondViewController *secondViewController = [[SecondViewController alloc] init];

}



- (IBAction)stepperChange:(UIStepper *)sender {
    
    //create notif center
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
    //create dictioanry with stepper value
    self.userInfo = @{@"stepperValue" : @(self.stepper.value)};
    NSLog(@"%f", (self.stepper.value));
    
    //create a notification with a name, self?, adn a dict
    NSNotification* notification = [[NSNotification alloc] initWithName:@"increaseStepper" object:self userInfo:self.userInfo];
    
    //post notif to the notif Center
    [notificationCenter postNotification:notification];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
