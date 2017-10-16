//
//  ThirdViewController.m
//  NSNotificationCenterStepper
//
//  Created by Sanjay Shah on 2017-10-15.
//  Copyright © 2017 Sanjay Shah. All rights reserved.
//

#import "ThirdViewController.h"
#import "FirstViewController.h"


@interface ThirdViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

- (void) keyboardDidChange: (NSNotification *) notification;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

@property (readonly) CGFloat oldConstraint;

@end


@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //create notif center
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    //add this VC as an observer, and call keyBoardDidChange when we are sent a message about KeyboardChangingFrame. We dont care who sent the message, so nil is ok.
    [notificationCenter addObserver:self selector:@selector(keyboardDidChange:) name:UIKeyboardDidChangeFrameNotification object:nil];
    
    //set old constraint to current bottom constraint
    _oldConstraint = self.bottomConstraint.constant;
    
}

//action takes in a notif
-(void) keyboardDidChange: (NSNotification *) notification {
    
    //all notifs are stored in dictionaries. So lets get info about the KeyboardFrameEnd
    NSValue *value = [notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    //convert the value to a rect
    CGRect rect = value.CGRectValue;
    
    //get the y point so we can make the new bottom constraint the difference
    CGFloat yPos = rect.origin.y;
    CGFloat viewHeight = self.view.bounds.size.height;
    
    
    if (yPos == viewHeight){
        self.bottomConstraint.constant = self.oldConstraint;
    }
    else{
        self.bottomConstraint.constant = viewHeight- yPos;
        
    }
}


//whenever a view is tapped, make the keyboard disaapear
- (IBAction)viewTapped:(UITapGestureRecognizer *)sender {
    
    [self.textField resignFirstResponder];
    
}


@end
