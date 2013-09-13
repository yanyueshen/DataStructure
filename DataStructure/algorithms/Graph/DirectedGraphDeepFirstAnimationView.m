//
//  DirectedGraphDeepFirstAnimationView.m
//  DataStructure
//
//  Created by Andrew on 13-9-12.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import "DirectedGraphDeepFirstAnimationView.h"
#import "IllustrateDirectGraphView.h"

@implementation DirectedGraphDeepFirstAnimationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
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

@end
