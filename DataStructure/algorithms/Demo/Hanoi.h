//
//  Hanoi.h
//  DataStructure
//
//  Created by Andrew on 13-8-20.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasicAlgorithmView.h"

@class CABasicAnimation;
@class HanoiAnimationView;

@interface Hanoi : BasicAlgorithmView //UIView

//@property (strong, nonatomic) HanoiAnimationView *animationView;

- (id) initWithFrame:(CGRect)frame animationView:(HanoiAnimationView *)hanoiAnimationView;

- (void) Hannoi:(int)n a:(NSString *)a b:(NSString *)b c:(NSString *)c;

- (void) moveToNextStep;

+ (Hanoi *) SharedHanoiView;
@end
