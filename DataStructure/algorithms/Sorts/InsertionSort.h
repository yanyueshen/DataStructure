//
//  InsertionSort.h
//  DataStructure
//
//  Created by Andrew on 13-8-24.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import "BasicAlgorithmView.h"
#import "IAnimationView.h"

@class CABasicAnimation;
@class InsertionSortAnimationView;


@interface InsertionSort : BasicAlgorithmView



+ (InsertionSort *) SharedInsertionSortView;

- (id) initWithFrame:(CGRect)frame animationView: (id<IAnimationView>) AnimationView;

- (void) initializeCodeData;
- (void) insertionSort;
- (void) moveToNextStep;

@end
