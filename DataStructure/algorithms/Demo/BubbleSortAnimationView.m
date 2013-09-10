//
//  BubbleSortAnimationView.m
//  DataStructure
//
//  Created by Andrew on 13-8-21.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import "BubbleSortAnimationView.h"
#import "BubbleSortView.h"
#import <QuartzCore/QuartzCore.h>
#import <Foundation/Foundation.h>
#import "AlgorithmLogView.h"

@implementation BubbleSortAnimationView

@synthesize dataLength;
@synthesize dataBoxes;
@synthesize isRunningAnimation;
@synthesize animationGroupA;
@synthesize animationGroupB;

@synthesize fromIndex;
@synthesize toIndex;
@synthesize logView;

- (id)initWithFrame:(CGRect)frame dataLength: (NSInteger) length
{
    self = [super initWithFrame:frame];
    dataLength = length;
    
    if (self) {
        // Initialization code
        [self initializeView];
        logView = [[AlgorithmLogView alloc] initWithFrame:CGRectMake(0, self.frame.size.height / 2, self.frame.size.width, self.frame.size.height)];
        [self addSubview:logView];
    }
    return self;
}

- (void) initializeView {
    int data[] = {10, 3, 43, 9, 65};
    int left = 100;
    int top = 150;
    int width = 50;
    int height = 50;
    
    dataBoxes = [[NSMutableArray alloc] init];
    for (int i = 0; i < dataLength; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(left * i + 20, top, width, height)];
        [btn setTitle:[NSString stringWithFormat:@"%d", data[i]] forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor whiteColor]];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn.layer setBorderWidth:2];
        [btn.layer setBorderColor:[UIColor blackColor].CGColor];
        [btn setEnabled:NO];
        
        [dataBoxes addObject:btn];
        
        [self addSubview:btn];
    }
}

- (void) startAnimation {
    UIButton *tempBtn = dataBoxes[fromIndex];
    dataBoxes[fromIndex] = dataBoxes[toIndex];
    dataBoxes[toIndex] = tempBtn;
    
    CABasicAnimation *animA1 =  [CABasicAnimation animationWithKeyPath:@"position"];
    
    UIButton *boxA = (UIButton *)dataBoxes[fromIndex];
    UIButton *boxB = (UIButton *)dataBoxes[toIndex];
    
    CGPoint boxAPoint = CGPointMake(boxA.frame.origin.x, boxA.frame.origin.y);
    CGPoint boxBPoint = CGPointMake(boxB.frame.origin.x, boxB.frame.origin.y);
    
    float aOriginalX = boxA.layer.position.x;// + boxA.frame.size.width / 2;
    float aOriginalY = boxA.layer.position.y;
    float bOriginalX = boxB.layer.position.x;// + boxB.frame.size.width / 2;
    float bOriginalY = boxB.layer.position.y;
    
    CGPoint fromAP1 = CGPointMake(aOriginalX, aOriginalY);
    CGPoint toAP1 = CGPointMake(aOriginalX, aOriginalY - boxA.frame.size.height - 20);
    
    [animA1 setFromValue:[NSValue valueWithBytes:&fromAP1 objCType:@encode(CGPoint)]];
    [animA1 setToValue:[NSValue valueWithBytes:&toAP1 objCType:@encode(CGPoint)]];
    [animA1 setDuration:1];
    [animA1 setBeginTime:0.0f];
    [animA1 setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    
    CABasicAnimation *animA2 = [CABasicAnimation animationWithKeyPath:@"position"];
    CGPoint fromAP2 = CGPointMake(aOriginalX, aOriginalY - boxA.frame.size.height - 20);
    CGPoint toAP2 = CGPointMake(bOriginalX, aOriginalY - boxA.frame.size.height - 20);
    [animA2 setFromValue:[NSValue valueWithBytes:&fromAP2 objCType:@encode(CGPoint)]];
    [animA2 setToValue:[NSValue valueWithBytes:&toAP2 objCType:@encode(CGPoint)]];

    [animA2 setDuration:1];
    [animA2 setBeginTime:1.0f];
    [animA2 setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    
    CGPoint fromAP3 = CGPointMake(bOriginalX, aOriginalY - boxA.frame.size.height - 20);
    CGPoint toAP3 = CGPointMake(bOriginalX, bOriginalY);
    CABasicAnimation *animA3 = [CABasicAnimation animationWithKeyPath:@"position"];
    [animA3 setFromValue:[NSValue valueWithBytes:&fromAP3 objCType:@encode(CGPoint)]];
    [animA3 setToValue:[NSValue valueWithBytes:&toAP3 objCType:@encode(CGPoint)]];
    [animA3 setDuration:1];
    [animA3 setBeginTime:2.0f];
    [animA3 setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    
    
    // -------------------------------------------------------------------------
    
    CGPoint fromBP1 = CGPointMake(bOriginalX, bOriginalY);
    CGPoint toBP1 = CGPointMake(bOriginalX, bOriginalY + boxB.frame.size.height + 20);
    
    CABasicAnimation *animB1 = [CABasicAnimation animationWithKeyPath:@"position"];
    [animB1 setFromValue:[NSValue valueWithBytes:&fromBP1 objCType:@encode(CGPoint)]];
    [animB1 setToValue:[NSValue valueWithBytes:&toBP1 objCType:@encode(CGPoint)]];
    [animB1 setDuration:1];
    [animB1 setBeginTime:0.0f];
    [animB1 setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    
    CABasicAnimation *animB2 = [CABasicAnimation animationWithKeyPath:@"position"];
    CGPoint fromBP2 = CGPointMake(bOriginalX, bOriginalY + boxB.frame.size.height + 20);
    CGPoint toBP2 = CGPointMake(aOriginalX, bOriginalY + boxB.frame.size.height + 20);
    [animB2 setFromValue:[NSValue valueWithBytes:&fromBP2 objCType:@encode(CGPoint)]];
    [animB2 setToValue:[NSValue valueWithBytes:&toBP2 objCType:@encode(CGPoint)]];
    [animB2 setDuration:1];
    [animB2 setBeginTime:1.0f];
    [animB2 setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    
    CGPoint fromBP3 = CGPointMake(aOriginalX, bOriginalY + boxB.frame.size.height + 20);
    CGPoint toBP3 = CGPointMake(aOriginalX, aOriginalY);
    CABasicAnimation *animB3 = [CABasicAnimation animationWithKeyPath:@"position"];
    [animB3 setFromValue:[NSValue valueWithBytes:&fromBP3 objCType:@encode(CGPoint)]];
    [animB3 setToValue:[NSValue valueWithBytes:&toBP3 objCType:@encode(CGPoint)]];
    [animB3 setDuration:1];
    [animB3 setBeginTime:2.0f];
    [animB3 setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    
    animationGroupB = [CAAnimationGroup animation];
    [animationGroupB setDuration:3.0f];
    [animationGroupB setAnimations:[NSArray arrayWithObjects:animB1, animB2, animB3, nil]];
    [animationGroupB setAutoreverses:NO];
    [animationGroupB setRemovedOnCompletion:NO];
    [animationGroupB setFillMode:kCAFillModeBackwards];
    
    animationGroupA = [CAAnimationGroup animation];
    [animationGroupA setDuration:3];
    [animationGroupA setAnimations:[NSArray arrayWithObjects:animA1, animA2, animA3, nil]];
    [animationGroupA setDelegate:self];
    [animationGroupA setAutoreverses:NO];
    [animationGroupA setRemovedOnCompletion:NO];
    [animationGroupA setFillMode:kCAFillModeBackwards];
    
    [boxA.layer setFrame:CGRectMake(boxBPoint.x, boxBPoint.y, boxA.frame.size.width, boxA.frame.size.height)];
    [boxB.layer setFrame:CGRectMake(boxAPoint.x, boxAPoint.y, boxB.frame.size.width, boxB.frame.size.height)];
    
    [boxA.layer addAnimation:animationGroupA forKey:@"move"];
    [boxB.layer addAnimation:animationGroupB forKey:@"moveb"];
}

- (void) stopAnimation {
    if (dataBoxes != nil && dataBoxes.count) {
        for (int i = 0; i < dataBoxes.count; i++) {
            [dataBoxes[i] removeFromSuperview];
        }
    }
    
    [dataBoxes removeAllObjects];
    
    [self initializeView];
}

- (void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    [[BubbleSortView SharedBubbleSortView] moveToNextStep];
}

- (void) log:(NSString *)logText {
    [logView Log:logText];
}

@end
