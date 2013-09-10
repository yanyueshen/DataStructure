//
//  HanoiAnimationView.m
//  DataStructure
//
//  Created by Andrew on 13-8-21.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import "HanoiAnimationView.h"
#import "Hanoi.h"
#import <QuartzCore/QuartzCore.h>
#import <Foundation/Foundation.h>
#import "AlgorithmLogView.h"

@implementation HanoiAnimationView

@synthesize rect1;
@synthesize rect2;
@synthesize rect3;
@synthesize currentRectLayer;
@synthesize animaitonGroup;
@synthesize logView;
@synthesize moveThread;
@synthesize isRunningAnimation;

@synthesize fromIndex;
@synthesize toIndex;

- (id)initWithFrame:(CGRect)frame dataLength: (NSInteger) length
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeLayers];
        logView = [[AlgorithmLogView alloc] initWithFrame:CGRectMake(0, self.frame.size.height / 2, self.frame.size.width, self.frame.size.height)];
        [self addSubview:logView];
    }
    return self;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (IBAction) BeginRun:(id)sender
{
//    self.fromColumn = 1;
//    self.toColumn = 3;
//    
//    [self MoveRect];
}

- (void)MoveRect
{
    
//    NSMutableArray *fromArray;
//    NSMutableArray *toArray;
//    
//    switch (fromColumn)
//    {
//        case 1:
//            fromArray = column1_rects;
//            break;
//        case 2:
//            fromArray = column2_rects;
//            break;
//        case 3:
//            fromArray = column3_rects;
//            break;
//        default:
//            break;
//    }
//    
//    switch (toColumn)
//    {
//        case 1:
//            toArray = column1_rects;
//            break;
//        case 2:
//            toArray = column2_rects;
//            break;
//        case 3:
//            toArray = column3_rects;
//            break;
//        default:
//            break;
//    }
//    
//    CALayer *currentLayer = [fromArray objectAtIndex:[fromArray count] - 1];
//    [fromArray removeObjectAtIndex:[fromArray count] - 1];
//    [toArray addObject:currentLayer];
//    
//    CGFloat x = currentLayer.frame.origin.x + currentLayer.frame.size.width / 2;
//    
//    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"position"];
//    CGPoint p1_from = CGPointMake(x, currentLayer.frame.origin.y);
//    CGPoint p1_to = CGPointMake(x, 100);
//    [animation1 setFromValue:[NSValue valueWithBytes:&p1_from objCType:@encode(CGPoint)]];
//    [animation1 setToValue:[NSValue valueWithBytes:&p1_to objCType:@encode(CGPoint)]];
//    [animation1 setAutoreverses:NO];
//    animation1.removedOnCompletion = NO;
//    animation1.fillMode = kCAFillModeForwards;
//    [animation1 setDuration:1.0f];
//    [animation1 setBeginTime:0.0f];
//    
//    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"position"];
//    CGPoint p2_from = CGPointMake(x, 100);
//    CGPoint p2_to = CGPointMake(100 * (toColumn - 1) + 150, 100);
//    [animation2 setFromValue:[NSValue valueWithBytes:&p2_from objCType:@encode(CGPoint)]];
//    [animation2 setToValue:[NSValue valueWithBytes:&p2_to objCType:@encode(CGPoint)]];
//    animation2.autoreverses = NO;
//    animation2.fillMode = kCAFillModeForwards;
//    animation2.removedOnCompletion = NO;
//    [animation2 setDuration:1.0f];
//    [animation2 setBeginTime:1.0f];
//    
//    CABasicAnimation *animation3 = [CABasicAnimation animationWithKeyPath:@"position"];
//    CGPoint p3_from = CGPointMake(100 * (toColumn - 1) + 150, 100);
//    CGPoint p3_to = CGPointMake(100 * (toColumn - 1) + 150, 300 - [toArray count] * 20 + 10);
//    [animation3 setFromValue:[NSValue valueWithBytes:&p3_from objCType:@encode(CGPoint)]];
//    [animation3 setToValue:[NSValue valueWithBytes:&p3_to objCType:@encode(CGPoint)]];
//    animation3.autoreverses = NO;
//    animation3.fillMode = kCAFillModeForwards;
//    animation3.removedOnCompletion = NO;
//    [animation3 setDelegate:self];
//    [animation3 setDuration:1.0f];
//    [animation3 setBeginTime:2.0f];
//    
//    animaitonGroup = [CAAnimationGroup animation];
//    [animaitonGroup setDuration:3.0f];
//    [animaitonGroup setAnimations:[NSArray arrayWithObjects:animation1, animation2, animation3, nil]];
//    
//    self.isRunningAnimation = NO;
//    
//    [currentLayer setPosition:p3_to];
//    
//    animaitonGroup.delegate = self;
//    [currentLayer addAnimation:animaitonGroup forKey:@"move"];
//    //[currentLayer release];
    

}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    //firstCodeAppDelegate *delegate = (firstCodeAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    //RootViewController *codeController = [delegate rootViewController];
    Hanoi *codeView = [Hanoi SharedHanoiView];
    [codeView moveToNextStep];
}

- (void) initializeLayers {
    CALayer *ground = [CALayer layer];
    [ground setBackgroundColor:[UIColor blackColor].CGColor];
    [ground setFrame:CGRectMake(50, 300, 400, 10)];
    
    CALayer *column1 = [CALayer layer];
    [column1 setBackgroundColor:[UIColor blackColor].CGColor];
    [column1 setFrame:CGRectMake(145, 150, 10, 150)];
    
    CALayer *column2 = [CALayer layer];
    [column2 setBackgroundColor:[UIColor blackColor].CGColor];
    [column2 setFrame:CGRectMake(245, 150, 10, 150)];
    
    CALayer *column3 = [CALayer layer];
    [column3 setBackgroundColor:[UIColor blackColor].CGColor];
    [column3 setFrame:CGRectMake(345, 150, 10, 150)];
    
    rect1 = [CALayer layer];
    [rect1 setFrame:CGRectMake(120, 240, 60, 20)];
    [rect1 setBorderColor:[UIColor blackColor].CGColor];
    [rect1 setBorderWidth:1];
    [rect1 setBackgroundColor:[UIColor whiteColor].CGColor];
    
    rect2 = [CALayer layer];
    [rect2 setFrame:CGRectMake(110, 260, 80, 20)];
    [rect2 setBorderColor:[UIColor blackColor].CGColor];
    [rect2 setBorderWidth:1];
    [rect2 setBackgroundColor:[UIColor whiteColor].CGColor];
    
    rect3 = [CALayer layer];
    [rect3 setFrame:CGRectMake(100, 280, 100, 20)];
    [rect3 setBorderColor:[UIColor blackColor].CGColor];
    [rect3 setBorderWidth:1];
    [rect3 setBackgroundColor:[UIColor whiteColor].CGColor];
    
    [self.layer addSublayer:ground];
    [self.layer addSublayer:column1];
    [self.layer addSublayer:column2];
    [self.layer addSublayer:column3];
    
    [self.layer addSublayer:rect1];
    [self.layer addSublayer:rect2];
    [self.layer addSublayer:rect3];
    
    column1_rects = [[NSMutableArray alloc] initWithObjects:rect3, rect2, rect1, nil];
    column2_rects = [[NSMutableArray alloc] init];
    column3_rects = [[NSMutableArray alloc] init];
}

- (void) startAnimation {
    NSMutableArray *fromArray;
    NSMutableArray *toArray;
    
    switch (self.fromIndex)
    {
        case 1:
            fromArray = column1_rects;
            break;
        case 2:
            fromArray = column2_rects;
            break;
        case 3:
            fromArray = column3_rects;
            break;
        default:
            break;
    }
    
    switch (self.toIndex)
    {
        case 1:
            toArray = column1_rects;
            break;
        case 2:
            toArray = column2_rects;
            break;
        case 3:
            toArray = column3_rects;
            break;
        default:
            break;
    }
    
    CALayer *currentLayer = [fromArray objectAtIndex:[fromArray count] - 1];
    [fromArray removeObjectAtIndex:[fromArray count] - 1];
    [toArray addObject:currentLayer];
    
    CGFloat x = currentLayer.frame.origin.x + currentLayer.frame.size.width / 2;
    
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"position"];
    CGPoint p1_from = CGPointMake(x, currentLayer.frame.origin.y);
    CGPoint p1_to = CGPointMake(x, 100);
    [animation1 setFromValue:[NSValue valueWithBytes:&p1_from objCType:@encode(CGPoint)]];
    [animation1 setToValue:[NSValue valueWithBytes:&p1_to objCType:@encode(CGPoint)]];
    [animation1 setAutoreverses:NO];
    animation1.removedOnCompletion = NO;
    animation1.fillMode = kCAFillModeForwards;
    [animation1 setDuration:1.0f];
    [animation1 setBeginTime:0.0f];
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"position"];
    CGPoint p2_from = CGPointMake(x, 100);
    CGPoint p2_to = CGPointMake(100 * (toIndex - 1) + 150, 100);
    [animation2 setFromValue:[NSValue valueWithBytes:&p2_from objCType:@encode(CGPoint)]];
    [animation2 setToValue:[NSValue valueWithBytes:&p2_to objCType:@encode(CGPoint)]];
    animation2.autoreverses = NO;
    animation2.fillMode = kCAFillModeForwards;
    animation2.removedOnCompletion = NO;
    [animation2 setDuration:1.0f];
    [animation2 setBeginTime:1.0f];
    
    CABasicAnimation *animation3 = [CABasicAnimation animationWithKeyPath:@"position"];
    CGPoint p3_from = CGPointMake(100 * (toIndex - 1) + 150, 100);
    CGPoint p3_to = CGPointMake(100 * (toIndex - 1) + 150, 300 - [toArray count] * 20 + 10);
    [animation3 setFromValue:[NSValue valueWithBytes:&p3_from objCType:@encode(CGPoint)]];
    [animation3 setToValue:[NSValue valueWithBytes:&p3_to objCType:@encode(CGPoint)]];
    animation3.autoreverses = NO;
    animation3.fillMode = kCAFillModeForwards;
    animation3.removedOnCompletion = NO;
    [animation3 setDelegate:self];
    [animation3 setDuration:1.0f];
    [animation3 setBeginTime:2.0f];
    
    animaitonGroup = [CAAnimationGroup animation];
    [animaitonGroup setDuration:3.0f];
    [animaitonGroup setAnimations:[NSArray arrayWithObjects:animation1, animation2, animation3, nil]];
    
    self.isRunningAnimation = NO;
    
    [currentLayer setPosition:p3_to];
    
    animaitonGroup.delegate = self;
    [currentLayer addAnimation:animaitonGroup forKey:@"move"];
}

- (void) stopAnimation {
    if(column1_rects != nil && column1_rects.count > 0)
    {
        for (int i = 0; i < column1_rects.count; i++) {
            CALayer *layer = column1_rects[i];
            [layer removeFromSuperlayer];
        }
        [column1_rects removeAllObjects];
    }

    if(column2_rects != nil && column2_rects.count > 0) {
        for (int i = 0; i < column2_rects.count; i++) {
            CALayer *layer = column2_rects[i];
            [layer removeFromSuperlayer];
        }
        [column2_rects removeAllObjects];
    }
    
    if (column3_rects != nil && column3_rects.count > 0) {
        for (int i = 0; i < column3_rects.count; i++) {
            CALayer *layer = column3_rects[i];
            [layer removeFromSuperlayer];
        }
        
        [column3_rects removeAllObjects];
    }
    
    [self initializeLayers];
}

- (void) log:(NSString *)logText {
    [logView Log:logText];
}

@end
