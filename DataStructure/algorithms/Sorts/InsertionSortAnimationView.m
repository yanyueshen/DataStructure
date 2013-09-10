//
//  InsertionSortAnimationView.m
//  DataStructure
//
//  Created by Andrew on 13-8-24.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import "InsertionSortAnimationView.h"
#import <QuartzCore/QuartzCore.h>
#import <Foundation/Foundation.h>
#import "InsertionSort.h"

@implementation InsertionSortAnimationView

@synthesize fromIndex;
@synthesize toIndex;
@synthesize step;
@synthesize orignalCompareBoxPosition;
@synthesize previousBoxPosition;
@synthesize compareButton;
@synthesize previousButton;
@synthesize positionArray;
@synthesize movedBoxesIndexes;

- (void) initializeView {
    [super initializeView];
    
    // Initialze the position array.
    if(positionArray == nil) {
        positionArray = [NSMutableArray array];
    }
    
    for (int i = 0; i < dataBoxes.count; i++) {
        
        UIButton __weak *btn = (UIButton *)dataBoxes[i];
//        NSDictionary *dic =@{@"x_off": [NSNumber numberWithFloat:btn.layer.position.x],@"y_off":[NSNumber numberWithFloat:btn.layer.position.y]};
        NSValue *position = [NSValue valueWithCGPoint:btn.layer.position];
//        CGPoint *c = [position pointerValue];
        [positionArray addObject:position];
    }
}

- (id) initWithFrame:(CGRect)frame dataLength:(NSInteger)length {
    self = [super initWithFrame:frame dataLength:length];
    
    return self;
}

- (void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    [[InsertionSort SharedInsertionSortView] moveToNextStep];
}

- (void) startAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"position"];
    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    
    CGPoint from;
    CGPoint to;
    CGFloat duration;
    CGFloat totalDuration;
    
    switch (step) {
        case Step0:
        {
            // From index is the current box's index. Store it to the movedBoxesIndexes for re-sort the boxes.
            [movedBoxesIndexes addObject:[NSNumber numberWithInt:fromIndex]];
            
            previousButton = (UIButton *)dataBoxes[fromIndex];
            from = [[positionArray objectAtIndex:fromIndex] CGPointValue];
            to = [[positionArray objectAtIndex:toIndex] CGPointValue];
            duration = 0.5f;
            totalDuration = duration;
        }
            break;
        case Step1:
        {
            // Re-new the movedBoxesIndexes mutable array.
            if (movedBoxesIndexes == nil) {
                movedBoxesIndexes = [NSMutableArray array];
            } else {
                [movedBoxesIndexes removeAllObjects];
            }
            
            [movedBoxesIndexes addObject:[NSNumber numberWithInt:fromIndex]];
            
            previousButton = (UIButton *)dataBoxes[fromIndex];
            compareButton = previousButton;
            previousBoxPosition = previousButton.layer.position;
            orignalCompareBoxPosition = previousButton.layer.position;
            from = orignalCompareBoxPosition;
            to = CGPointMake(from.x, from.y - previousButton.frame.size.height - 20);
            duration = 0.5f;
            totalDuration = duration;
        }
            break;
        case Step2:
        {
            from = CGPointMake(compareButton.layer.position.x, compareButton.layer.position.y - compareButton.frame.size.height - 20);
            CGPoint to1 = [[positionArray objectAtIndex:toIndex] CGPointValue];
            to = CGPointMake(to1.x, from.y);
            
            // The second step animation.
            CGPoint from1 = CGPointMake(to1.x, to.y);
            [animation1 setFromValue:[NSValue valueWithBytes:&from1 objCType:@encode(CGPoint)]];
            [animation1 setToValue:[NSValue valueWithBytes:&to1 objCType:@encode(CGPoint)]];
            [animation1 setBeginTime:0.5f];
            [animation1 setDuration:0.5f];
            [animation1 setAutoreverses:NO];
            [animation1 setRemovedOnCompletion:NO];
            [animation1 setFillMode:kCAFillModeForwards];
            duration = 0.5f;
            totalDuration = 1.0f;
            
            // re-sort the boxes.
            if (movedBoxesIndexes != nil && movedBoxesIndexes.count > 1) {
                NSLog(@"moved the boxes.");
                NSNumber __weak *pointerFirstIndex = [movedBoxesIndexes objectAtIndex:0];
                UIButton __weak *first = dataBoxes[pointerFirstIndex.integerValue];
                NSNumber __weak *pointerIndex = nil;
                
                for (int i = 1; i < movedBoxesIndexes.count; i++) {
                    pointerIndex = movedBoxesIndexes[i];
                    UIButton __weak *btn = dataBoxes[pointerIndex.integerValue];
                    dataBoxes[pointerIndex.integerValue + 1] = btn;
                }
                dataBoxes[pointerIndex.integerValue] = first;
            }
        }
            break;
        default:
            break;
    }
    
    [animation setFromValue:[NSValue valueWithBytes:&from objCType:@encode(CGPoint)]];
    [animation setToValue:[NSValue valueWithBytes:&to objCType:@encode(CGPoint)]];
    [animation setDuration:duration];
    [animation setBeginTime:0.0f];
    [animation setAutoreverses:NO];
    [animation setRemovedOnCompletion:NO];
    [animation setFillMode:kCAFillModeForwards];
    
    [animGroup setDuration:totalDuration];
    [animGroup setDelegate:self];
    [animGroup setAutoreverses:NO];
    [animGroup setRemovedOnCompletion:NO];
    [animGroup setFillMode:kCAFillModeForwards];
    
    UIButton *btnFrom;
    if (step == Step2) {
        [animGroup setAnimations:[NSArray arrayWithObjects:animation, animation1, nil]];
        btnFrom =  compareButton;
    } else {
        [animGroup setAnimations:[NSArray arrayWithObjects:animation, nil]];
        btnFrom = (UIButton *)dataBoxes[fromIndex];
    }    
    
    [btnFrom.layer addAnimation:animGroup forKey:@"aa"];
}

@end
