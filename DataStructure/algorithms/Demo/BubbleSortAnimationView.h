//
//  BubbleSortAnimationView.h
//  DataStructure
//
//  Created by Andrew on 13-8-21.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IAnimationView.h"

@class CAAnimationGroup;

@interface BubbleSortAnimationView : UIView <IAnimationView>

@property (nonatomic) NSInteger dataLength;
@property (nonatomic) NSMutableArray *dataBoxes;
@property (nonatomic) BOOL isRunningAnimation;
@property (nonatomic) CAAnimationGroup *animationGroupA;
@property (nonatomic) CAAnimationGroup *animationGroupB;

//@property (nonatomic) NSInteger dataAIndex;
//@property (nonatomic) NSInteger dataBIndex;


- (id)initWithFrame:(CGRect)frame dataLength: (NSInteger) length;
- (void) initializeView;

- (void) MoveAction;

@end
