//
//  BubbleSortView.m
//  DataStructure
//
//  Created by Andrew on 13-8-21.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import "BubbleSortView.h"
#import "BubbleSortAnimationView.h"
#import "CodeAnimation.h"
#import "DataAnimation.h"
#import <QuartzCore/QuartzCore.h>
#import <Foundation/Foundation.h>


@implementation BubbleSortView


//@synthesize animationView;

static BubbleSortView *staticSharedBubbleSortView;

+ (BubbleSortView *) SharedBubbleSortView {
    return staticSharedBubbleSortView;
}

- (id)initWithFrame:(CGRect)frame animationView:(id<IAnimationView> )bubbleSortAnimationView
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        animationView = bubbleSortAnimationView;
        [self initializeCodeData];
    }
    
    staticSharedBubbleSortView = self;
    return self;
}

- (void) initializeCodeData {
    if (self.codeLayers != nil && self.codeLayers.count > 0) {
        for (int i = 0; i < self.codeLayers.count; i++) {
            [self.codeLayers[i] removeFromSuperlayer];
        }
    }
    
    self.codeData = @[@"BubbleSort(int[] data, int length) {", @"    for (int i = 0; i < length - 1; i++) {", @"        for (int j = length - 1; j > i; j--) {", @"            if(original[i] < original[j]) {", @"                swap(data[i], data[j]);", @"            }", @"        }", @"    }", @"}"];
    
    CGFloat height = 20.0f;
    CGFloat top = 100.0f;
    CGFloat width = [self frame].size.width - 10;
    
    self.codeLayers = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < [self.codeData count]; i++)
    {
        CATextLayer *label = [CATextLayer layer];
        [label setString:[self.codeData objectAtIndex:i]];
        [label setBackgroundColor:[UIColor whiteColor].CGColor];
        [label setForegroundColor:[UIColor blackColor].CGColor];
        [label setFontSize:12.0f];
        
        CGRect frame = CGRectMake(10, top + height * i, width, height);
        [label setFrame:frame];
        //  NSLog(@"width :%f", label.frame.origin.x);
        
        [self.codeLayers addObject:label];
        [self.layer addSublayer:label];
    }
    
    NSLog(@"hanoi view layer.x: %f", self.layer.frame.origin.x);
    
    CATextLayer *lastLayer = [self.codeLayers objectAtIndex:[self.codeLayers count] - 1];
    CGRect rect = CGRectMake(10, lastLayer.frame.origin.y + 50, 100, 40);
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self action:@selector(runCode:) forControlEvents:UIControlEventTouchDown];
    [button setTitle:@"Run" forState:UIControlStateNormal];
    [button setFrame:rect];
    [self addSubview:button];
    
    self.codeAnimationArray = [[NSMutableArray alloc] init];
    [self bubbleSort];
}


- (void) bubbleSort {
    int original[] = {10, 3, 43, 9, 65};
    int n = 5;
    [self addAnimationData:1 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
    for (int i = 0; i < n - 1; i++) {
        [self addAnimationData:2 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
        for (int j = n - 1; j > i; j--) {
            [self addAnimationData:3 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
            if(original[i] < original[j]) {
                int temp = original[i];
                original[i] = original[j];
                original[j] = temp;
                [self addAnimationData:4 needAnimation:YES fromColumn:i toColumn:j step:Step0];
            }
            [self addAnimationData:5 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
        }
        [self addAnimationData:6 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
    }
    [self addAnimationData:7 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
    
    for (int i = 0; i < n; i ++) {
        NSLog(@"%d", original[i]);
    }
}


- (void) fireAnimationViewAction:(CodeAnimation *)codeAnimation {
    [animationView setFromIndex:codeAnimation.dataAnimation.start];
    [animationView setToIndex:codeAnimation.dataAnimation.end];
    [animationView log:[NSString stringWithFormat:@"Interchange %d with %d", codeAnimation.dataAnimation.start, codeAnimation.dataAnimation.end]];
    [animationView startAnimation];
}
- (void) moveToNextStep
{
    [self changeLayerBackgroundBack];
}

@end
