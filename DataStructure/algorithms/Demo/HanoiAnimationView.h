//
//  HanoiAnimationView.h
//  DataStructure
//
//  Created by Andrew on 13-8-21.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IAnimationView.h"

@class CALayer;
@class CABasicAnimation;
@class CAAnimationGroup;

@interface HanoiAnimationView : UIView <IAnimationView>  {
    NSMutableArray *column1_rects;
    NSMutableArray *column2_rects;
    NSMutableArray *column3_rects;
}

@property (nonatomic, retain) CALayer *rect1;
@property (nonatomic, retain) CALayer *rect2;
@property (nonatomic, retain) CALayer *rect3;
@property (nonatomic, retain) CALayer *currentRectLayer;

@property (nonatomic, retain) CAAnimationGroup *animaitonGroup;

//@property (nonatomic) NSInteger fromColumn;
//@property (nonatomic) NSInteger toColumn;

@property (nonatomic, retain) NSThread *moveThread;
@property (nonatomic, assign) BOOL isRunningAnimation;

- (id)initWithFrame:(CGRect)frame dataLength: (NSInteger) length;

- (IBAction) BeginRun: (id)sender;

- (void) initializeLayers;

- (void) MoveRect;

@end
