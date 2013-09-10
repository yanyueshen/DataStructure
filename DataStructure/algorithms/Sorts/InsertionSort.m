//
//  InsertionSort.m
//  DataStructure
//
//  Created by Andrew on 13-8-24.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import "InsertionSort.h"
#import "CodeAnimation.h"
#import "DataAnimation.h"
#import <QuartzCore/QuartzCore.h>
#import <Foundation/Foundation.h>

@implementation InsertionSort

static InsertionSort *sharedInsertionSortView;

+ (InsertionSort *) SharedInsertionSortView {
    return sharedInsertionSortView;
}

- (id)initWithFrame:(CGRect)frame animationView: (id<IAnimationView>) AnimationView
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        animationView = AnimationView;
        
        [self initializeCodeData];
    }
    
    sharedInsertionSortView = self;
    return self;
}

- (void) initializeCodeData {
    
    
    // Initialize the code array.
    self.codeData = @[@"InsertionSort(int[] data, int length) {",
                      @"    int first = 0, last = 4;",
                      @"    int i, j;",
                      @"    int temp;",
                      @"    for (i = first + 1; i <= last; i++) {",
                      @"        temp = data[i];",
                      @"        j = i - 1;",
                      @"        while ((j>=first) && data[j] > temp) {",
                      @"            data[j + 1] = data[j];",
                      @"            j--;",
                      @"        }",
                      @"        data[j + 1] = temp;",
                      @"    }",
                      @"}"];
    
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
    
    NSLog(@"Insertion Sort view layer.x: %f", self.layer.frame.origin.x);
    
    CATextLayer *lastLayer = [self.codeLayers objectAtIndex:[self.codeLayers count] - 1];
    CGRect rect = CGRectMake(10, lastLayer.frame.origin.y + 50, 100, 40);
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self action:@selector(runCode:) forControlEvents:UIControlEventTouchDown];
    [button setTitle:@"Run" forState:UIControlStateNormal];
    [button setFrame:rect];
    [self addSubview:button];
    
    self.codeAnimationArray = [[NSMutableArray alloc] init];
    [self insertionSort];
}

- (void) moveToNextStep {
    [self changeLayerBackgroundBack];
}

-(void) fireAnimationViewAction:(CodeAnimation *)codeAnimation {
    [animationView setFromIndex:codeAnimation.dataAnimation.start];
    [animationView setToIndex:codeAnimation.dataAnimation.end];
    [animationView setStep:codeAnimation.dataAnimation.step];
    
    [animationView log:[NSString stringWithFormat:@"Interchange %d with %d", codeAnimation.dataAnimation.start, codeAnimation.dataAnimation.end]];
    [animationView startAnimation];
}

- (void) insertionSort {
    
    
    int data[] = {10, 3, 43, 9, 65};
    [self addAnimationData:1 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
    int first = 0, last = 4;
    [self addAnimationData:2 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
    int i, j;
    [self addAnimationData:3 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
    int temp;
    [self addAnimationData:4 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
    
    for (i = first + 1; i <= last; i++) {
        [self addAnimationData:5 needAnimation:YES fromColumn:i toColumn:-1 step:Step1];
        temp = data[i];
        [self addAnimationData:6 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
        
        j = i - 1;
        [self addAnimationData:7 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
        
        while ((j>=first) && data[j] > temp) {
            [self addAnimationData:8 needAnimation:YES fromColumn:j toColumn:j+1 step:Step0];
            data[j + 1] = data[j];
            [self addAnimationData:9 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
            j--;
            [self addAnimationData:10 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
        }
        [self addAnimationData:11 needAnimation:YES fromColumn:-1 toColumn:j+1 step:Step2];
        data[j + 1] = temp;
        [self addAnimationData:12 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
    }
    [self addAnimationData:13 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
}

@end
