//
//  SecondViewController.m
//  NSNotificationCenterStepper
//
//  Created by Sanjay Shah on 2017-10-15.
//  Copyright © 2017 Sanjay Shah. All rights reserved.
//

#import "SecondViewController.h"
#import "FirstViewController.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UILabel *stepperValueLabel;

@end

@implementation SecondViewController

- (instancetype) init {
    self = [super init];
    if (self) {
        }

    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    FirstViewController *fcv;
//    self.stepperValueLabel.text = [NSString stringWithFormat:@"%f", (fcv.stepper.value)];
//    NSLog(@"%f", (fcv.stepper.value));
    
    
    //need to add this observer to the notifCenter before the view gets loaded, and call stepperChange if a notif with the name 'increaseStepper' gets posted by a specifc sender(nil in this case)
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(stepperChange:)
                                                 name:@"increaseStepper"
                                               object:nil];
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}


//this action takes in the notif which contains info
- (void)stepperChange:(NSNotification* ) notification {
    
    //gets the string of the stepper value
    NSString *stepperValueAsString = [NSString stringWithFormat:@"%@",[notification.userInfo objectForKey:@"stepperValue"]];
    
    //assigns the labelText to that value
    self.stepperValueLabel.text = stepperValueAsString;
    NSLog(@"%@",[notification.userInfo objectForKey:@"stepperValue"] );
    NSLog(@"String: %@", stepperValueAsString);
    
}

-(void)dealloc
{
    //removes this VC from observing the defalt Center, as view did load makes it an observer again
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
