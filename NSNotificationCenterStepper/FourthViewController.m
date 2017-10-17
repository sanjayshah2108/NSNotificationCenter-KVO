//
//  FourthViewController.m
//  NSNotificationCenterStepper
//
//  Created by Sanjay Shah on 2017-10-15.
//  Copyright © 2017 Sanjay Shah. All rights reserved.
//

#import "FourthViewController.h"
#import "customView.h"

@interface FourthViewController ()

@property (weak, nonatomic) IBOutlet UIView *movingView;

@property (weak, nonatomic) IBOutlet customView *inputView;

@property (weak, nonatomic) IBOutlet UIPanGestureRecognizer *pan;


@end

@implementation FourthViewController

- (IBAction)pan:(UIPanGestureRecognizer *)sender {
    
    CGPoint currentPoint = [sender translationInView:self.inputView];
    
    CGRect movingViewRect =  self.movingView.frame;
    
    movingViewRect.origin.x += currentPoint.x;
    movingViewRect.origin.y += currentPoint.y;
    
    self.movingView.frame = movingViewRect;
    
    [sender setTranslation:CGPointZero inView:self.movingView];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];

    //registers 4thView as an observer, to observe any new change on the property 'point' on the custom inputView
    [self.inputView addObserver:self forKeyPath:@"point" options:NSKeyValueObservingOptionNew context:nil];

    
    
}

//action for observing object i.e this view to conduct
-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    
    if([keyPath isEqualToString:@"point"]){
        
        //get value of keyPath 'point', and convert it to a Point to be used by subViews
        id value = change[NSKeyValueChangeNewKey];
        NSValue *valueCast = (NSValue*) value;
        
        CGPoint point = valueCast.CGPointValue;
        
        CGFloat movingViewX = self.movingView.center.x;
        CGFloat movingViewY = self.movingView.center.y;
        
        movingViewX += point.x;
        movingViewY += point.y;
        
        CGPoint newCenter = CGPointMake(movingViewX, movingViewY);
        
        self.movingView.center = newCenter;
        
    }
}

- (IBAction)tappedView:(UITapGestureRecognizer *)sender {
    
    //make movingRect move to 200, 200 when screen is tapped
    CGPoint originalPoint =  CGPointMake(200, 200);
    self.movingView.center = originalPoint;
}


@end
