//
//  BasicSortAnimationView.h
//  DataStructure
//
//  Created by Andrew on 13-8-31.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IAnimationView.h"

@class CAAnimationGroup;

@interface BasicSortAnimationView : UIView <IAnimationView> {
    @public
    NSMutableArray *dataBoxes;
}

@property (nonatomic) NSInteger dataLength;
@property (nonatomic) NSMutableArray *dataBoxes;
@property (nonatomic) BOOL isRunningAnimation;
@property (nonatomic) CAAnimationGroup *animationGroupA;
@property (nonatomic) CAAnimationGroup *animationGroupB;

- (id)initWithFrame:(CGRect)frame dataLength: (NSInteger) length;
- (void) initializeView;

- (void) MoveAction;

@end
