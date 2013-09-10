//
//  QuickSortAnimationView.m
//  DataStructure
//
//  Created by Andrew on 13-9-2.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import "QuickSortAnimationView.h"
#import "QuickSortView.h"

@implementation QuickSortAnimationView

- (void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    [[QuickSortView SharedQuickSortView] moveToNextStep];
}

@end
