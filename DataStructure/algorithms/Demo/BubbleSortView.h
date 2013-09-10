//
//  BubbleSortView.h
//  DataStructure
//
//  Created by Andrew on 13-8-21.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasicAlgorithmView.h"

@class CABasicAnimation;

@interface BubbleSortView : BasicAlgorithmView // UIView

//@property (strong, nonatomic) BubbleSortAnimationView *animationView;

+ (BubbleSortView *) SharedBubbleSortView;

- (id) initWithFrame:(CGRect)frame animationView: (id<IAnimationView> ) bubbleSortAnimationView;

- (void) initializeCodeData;
- (void) bubbleSort;
- (void) moveToNextStep;

@end
