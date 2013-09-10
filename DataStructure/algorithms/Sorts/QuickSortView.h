//
//  QuickSortView.h
//  DataStructure
//
//  Created by Andrew on 13-9-2.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasicAlgorithmView.h"
#import "IAnimationView.h"

@interface QuickSortView : BasicAlgorithmView

+ (QuickSortView *) SharedQuickSortView;

- (id)initWithFrame:(CGRect)frame animationView:(id<IAnimationView>)AnimationView;

-(void) quick_sort:(int [])a left: (int)left right:(int) right;

@end
