//
//  UndirectGraphDeepFirstAnimationView.m
//  DataStructure
//
//  Created by Andrew on 13-9-12.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import "UndirectGraphDeepFirstAnimationView.h"
#import "IllustrateUndirectGraphView.h"
#import "GraphMatrixView.h"
#import "GraphVertexSetterFactory.h"

@implementation UndirectGraphDeepFirstAnimationView

- (id)initWithFrame:(CGRect)frame dataLength:(NSInteger)length
{
    self = [super initWithFrame:frame dataLength:length];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) initializeAnimationView {
    illustrateView = [IllustrateUndirectGraphView new];
    [illustrateView setFrame:animationViewsContainer.frame];
    [illustrateView setBackgroundColor:[UIColor whiteColor]];
    [animationViewsContainer addSubview:illustrateView];

}

- (void) initializeGraphMatrixView {
    id<IGraphVertexSetter> setter = [GraphVertexSetterFactory generateGraphVertexSetter:UndirectedGraphAdjacencyMatrix];
    matrixView = [[GraphMatrixView alloc] initWithFrame:animationViewsContainer.frame andSetter:setter];
    [matrixView setBackgroundColor:[UIColor whiteColor]];
    [animationViewsContainer addSubview:matrixView];
}


@end
