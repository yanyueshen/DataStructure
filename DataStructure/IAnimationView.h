//
//  IAnimationView.h
//  DataStructure
//
//  Created by Andrew on 13-8-29.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import "DataAnimation.h"

@class AlgorithmLogView;

@protocol IAnimationView

@property (nonatomic) NSInteger fromIndex;
@property (nonatomic) NSInteger toIndex;
@property (nonatomic) DataAnimationStep step;

@property (nonatomic) AlgorithmLogView *logView;

- (void) startAnimation;
- (void) stopAnimation;
- (void) log: (NSString *)logText;

// The following methods are for Graph
@optional
- (NSMutableArray *) getGraphNodes;
- (NSMutableArray *) getGraphMatrix;

@end
