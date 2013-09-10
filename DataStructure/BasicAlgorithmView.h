//
//  BasicAlgorithmView.h
//  DataStructure
//
//  Created by Andrew on 13-8-22.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IAnimationView.h"
#import "DataAnimation.h"

@class CABasicAnimation;
@class CAAnimation;
@class CodeAnimation;

#define kToColorfulBgAnimationKey @"changeToColorfulBackground"
#define kBackToClearBgAnimationKey @"changeBackToClearBackground"

typedef enum {
    Running,
    Pause,
    Stop
} AnimationStatus;

@interface BasicAlgorithmView : UIView {
    @public
    __weak id<IAnimationView> animationView;
    AnimationStatus Status;
}

@property (strong,nonatomic) NSArray *codeData;
@property (strong, nonatomic) NSMutableArray *codeLayers;
@property (nonatomic) NSInteger currentLineNumber;
@property (nonatomic) NSInteger currentAnimationIndex;
@property (nonatomic) BOOL isAnimationBack;
@property (nonatomic, retain) NSMutableArray *codeAnimationArray;
@property (nonatomic, retain) CABasicAnimation *selectionAnimation;
@property (strong, nonatomic) UISegmentedControl *codeRunningControllers;
@property (weak, nonatomic)  id<IAnimationView> animationView;
@property (nonatomic) AnimationStatus Status;
@property (nonatomic) CAAnimation *currentAnimation;

- (id) initWithFrame:(CGRect)frame animationView: (id<IAnimationView>) AnimationView;

- (void) initializeCodeData;
- (void) aligorithm;

- (void) runCode:(id)sender;
- (void) runCode;
- (void) codeRunningControllerChanged:(id)sender;
- (void) moveToNextStep;

- (void) changeLayerBackgroundToColorful;
- (void) changeLayerBackgroundBack;
- (void)addAnimationData:(NSInteger)lineNumber needAnimation:(BOOL)needAnimation fromColumn:(NSInteger)fromColumn toColumn:(NSInteger)toColumn step: (DataAnimationStep) step;
- (void) stopTheWholeAligrithm;
- (void) finishOneStepAnimation:(SEL) animationViewAction afterAnimation:(CAAnimation *)anim;
- (void) fireAnimationViewAction: (CodeAnimation *)codeAnimation;

@end
