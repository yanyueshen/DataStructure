//
//  QuickSortView.m
//  DataStructure
//
//  Created by Andrew on 13-9-2.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import "QuickSortView.h"
#import "CodeAnimation.h"
#import "DataAnimation.h"
#import <QuartzCore/QuartzCore.h>
#import <Foundation/Foundation.h>

@implementation QuickSortView


static QuickSortView *sharedQuickSortView;

+ (QuickSortView *) SharedQuickSortView {
    return sharedQuickSortView;
}

- (id)initWithFrame:(CGRect)frame animationView:(id<IAnimationView>)AnimationView
{
    self = [super initWithFrame:frame animationView:AnimationView];
    if (self) {
        // Initialization code
    }
    
    sharedQuickSortView = self;
    
    return self;
}

- (void) initializeCodeData {
    self.codeData = @[@"InsertionSort(int[] data, int length) {",
                      @"    int i = left + 1, j = right;",
                      @"    int  key = a[left];",
                      @"    if (left >= right)",
                      @"        return;",
                      @"    while (1) {",
                      @"        while (a[j] > key)",
                      @"            j--;",
                      @"        while (a[i] < key&&i<j)",
                      @"            i++;",
                      @"        if(i >= j)",
                      @"            break;",
                      @"        swap(&a[i],&a[j]);",
                      @"        if(a[i]==key)",
                      @"            j--;",
                      @"        else",
                      @"            i++;",
                      @"    }",
                      @"    swap(&a[left],&a[j]);",
                      @"    if(left  < i - 1)",
                      @"         quick_sort(a, left, i - 1);",
                      @"    if(j + 1 < right)",
                      @"         quick_sort(a, j + 1 , right);",
                      @"}"];
    [super initializeCodeData];
}

-(void) fireAnimationViewAction:(CodeAnimation *)codeAnimation {
    [animationView setFromIndex:codeAnimation.dataAnimation.start];
    [animationView setToIndex:codeAnimation.dataAnimation.end];
    [animationView setStep:codeAnimation.dataAnimation.step];
    
    [animationView log:[NSString stringWithFormat:@"Interchange %d with %d", codeAnimation.dataAnimation.start, codeAnimation.dataAnimation.end]];
    [animationView startAnimation];
}

- (void) aligorithm {
    int data[] = {10, 3, 43, 9, 65};
    [self quick_sort:data left:0 right:4];
}

-(void) quick_sort:(int [])a left: (int)left right:(int) right
{
    int i = left + 1, j = right;
    [self addAnimationData:1 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
    
    int  key = a[left];
    [self addAnimationData:2 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
    
    if (left >= right)
    {
        [self addAnimationData:3 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
        return;
        [self addAnimationData:4 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
    }
    
    [self addAnimationData:5 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
    while (1) {
        [self addAnimationData:6 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
        while (a[j] > key) {            
            j--;
            [self addAnimationData:7 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
        }
        
        [self addAnimationData:8 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
        while (a[i] < key && i < j) {            
            i++;
            [self addAnimationData:9 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
        }
        
        [self addAnimationData:10 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
        if(i >= j) {
            [self addAnimationData:11 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
            break;
        }
        
        int temp = a[i];
        a[i] = a[j];
        a[j] = temp;
        [self addAnimationData:12 needAnimation:YES fromColumn:i toColumn:j step:Step0];
        
        [self addAnimationData:13 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
        if(a[i]==key) {            
            j--;
            [self addAnimationData:14 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
        }
        else {
            [self addAnimationData:15 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
            i++;
            [self addAnimationData:16 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
        }
    }
    [self addAnimationData:17 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
    
    int temp = a[left];
    a[left] = a[j];
    a[j] = temp;
    [self addAnimationData:18 needAnimation:YES fromColumn:left toColumn:j step:Step0];
    
    [self addAnimationData:19 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
    if(left  < i - 1) {
        [self addAnimationData:20 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
        [self quick_sort:a left:left right: i - 1];
    }
    
    [self addAnimationData:21 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
    if(j + 1 < right) {
        [self addAnimationData:22 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
        [self quick_sort:a left: j + 1 right: right];
    }
    [self addAnimationData:23 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
    
}

@end
