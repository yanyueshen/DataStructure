//
//  DirectedGraphDeepFirstAnimationView.m
//  DataStructure
//
//  Created by Andrew on 13-9-12.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import "DirectedGraphDeepFirstAnimationView.h"
#import "IllustrateDirectGraphView.h"
#import "GraphMatrixView.h"
#import "GraphVertexSetterFactory.h"

@implementation DirectedGraphDeepFirstAnimationView

- (id)initWithFrame:(CGRect)frame dataLength:(NSInteger)length
{
    self = [super initWithFrame:frame dataLength:length];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) initializeAnimationView {
    illustrateView = [IllustrateDirectGraphView new];
    [illustrateView setFrame:animationViewsContainer.frame];
    [illustrateView setBackgroundColor:[UIColor whiteColor]];
    [animationViewsContainer addSubview:illustrateView];
    
}

- (void) initializeGraphMatrixView {
    id<IGraphVertexSetter> setter = [GraphVertexSetterFactory generateGraphVertexSetter:UndirectedWithWeightGraphAdjacencyMatrix];
    matrixView = [[GraphMatrixView alloc] initWithFrame:animationViewsContainer.frame andSetter:setter];
    [matrixView setBackgroundColor:[UIColor whiteColor]];
    [animationViewsContainer addSubview:matrixView];
}

@end
