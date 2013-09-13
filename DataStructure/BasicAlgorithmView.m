//
//  BasicAlgorithmView.m
//  DataStructure
//
//  Created by Andrew on 13-8-22.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import "BasicAlgorithmView.h"
#import "CodeAnimation.h"
#import "DataAnimation.h"
#import <QuartzCore/QuartzCore.h>
#import <Foundation/Foundation.h>

@implementation BasicAlgorithmView

@synthesize codeData;
@synthesize codeLayers;
@synthesize currentLineNumber;
@synthesize currentAnimationIndex;
@synthesize isAnimationBack;
@synthesize codeAnimationArray;
@synthesize selectionAnimation;
@synthesize codeRunningControllers;
@synthesize animationView;
@synthesize Status;
@synthesize currentAnimation;


- (id)initWithFrame:(CGRect)frame animationView: (id<IAnimationView>) AnimationView
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        Status = Stop;      // At the very begining, the status should be stop.
        
        codeRunningControllers = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Start", @"Pause", @"Stop", nil]];
        [codeRunningControllers addTarget:self action:@selector(codeRunningControllerChanged:) forControlEvents:UIControlEventValueChanged];
        [codeRunningControllers setFrame:CGRectMake(5, self.frame.size.height - 100, self.frame.size.width - 10, 50)];
        [self addSubview:codeRunningControllers];
        
        animationView = AnimationView;
        
        [self initializeCodeData];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        Status = Stop;      // At the very begining, the status should be stop.
        
        codeRunningControllers = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Start", @"Pause", @"Stop", nil]];
        [codeRunningControllers addTarget:self action:@selector(codeRunningControllerChanged:) forControlEvents:UIControlEventValueChanged];
        [codeRunningControllers setFrame:CGRectMake(5, self.frame.size.height - 100, self.frame.size.width - 10, 50)];
        [self addSubview:codeRunningControllers];
    }
    return self;
}

- (void) initializeCodeData {
    // Initialize the code array.
    CGFloat height = 20.0f;
    CGFloat top = 100.0f;
    CGFloat width = [self frame].size.width - 10;
    
    self.codeLayers = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < [self.codeData count]; i++)
    {
        CATextLayer *label = [CATextLayer layer];
        [label setString:[self.codeData objectAtIndex:i]];
        [label setBackgroundColor:[UIColor whiteColor].CGColor];
        [label setForegroundColor:[UIColor blackColor].CGColor];
        [label setFontSize:12.0f];
        
        CGRect frame = CGRectMake(10, top + height * i, width, height);
        [label setFrame:frame];
        //  NSLog(@"width :%f", label.frame.origin.x);
        
        [self.codeLayers addObject:label];
        [self.layer addSublayer:label];
    }
    
    NSLog(@"Insertion Sort view layer.x: %f", self.layer.frame.origin.x);
    
//    CATextLayer *lastLayer = [self.codeLayers objectAtIndex:[self.codeLayers count] - 1];
//    CGRect rect = CGRectMake(10, lastLayer.frame.origin.y + 50, 100, 40);
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [button addTarget:self action:@selector(runCode:) forControlEvents:UIControlEventTouchDown];
//    [button setTitle:@"Run" forState:UIControlStateNormal];
//    [button setFrame:rect];
//    [self addSubview:button];
    
    self.codeAnimationArray = [[NSMutableArray alloc] init];
    [self aligorithm];
}


- (void) codeRunningControllerChanged:(id)sender {
    UISegmentedControl * segmentedControl = (UISegmentedControl *)sender;
    switch(segmentedControl.selectedSegmentIndex)
    {
        case 0:
            if(Status == Stop)
            {
            [self runCode];
            }
            else
            {
                Status = Running;
                [self finishOneStepAnimation:nil afterAnimation:currentAnimation];
            }
            break;
        case 1:
            if (Status == Pause) {
                Status = Running;
            } else {
                Status = Pause;
            }
            
            break;
        case 2:
            [self stopTheWholeAligrithm];
            [self.animationView stopAnimation];
            Status = Stop;
            break;
        default:
            break;
    }
}

- (void) changeLayerBackgroundToColorful
{
    if (Status != Running) {
        return;
    }
    
    if (currentLineNumber >= [codeAnimationArray count])
    {
        // when the current Line number is more than the quantity of the code animaiton array
        // the animation should be terminated.
        return;
    }
    
    isAnimationBack = NO;
    CodeAnimation *codeAnimation = [codeAnimationArray objectAtIndex:currentLineNumber];
    currentAnimationIndex = codeAnimation.lineNumber;
    
    CATextLayer *layer = [codeLayers objectAtIndex:self.currentAnimationIndex];
    selectionAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    
    selectionAnimation.fromValue = (id)[UIColor clearColor].CGColor;
    selectionAnimation.toValue = (id)[UIColor blueColor].CGColor;
    selectionAnimation.duration = 0.5f;
    selectionAnimation.autoreverses = NO;
    selectionAnimation.fillMode = kCAFillModeForwards;
    selectionAnimation.removedOnCompletion = NO;
    selectionAnimation.delegate = self;
    [layer addAnimation:selectionAnimation forKey:@"aa"];
    
}

- (void) changeLayerBackgroundBack
{
    isAnimationBack = YES;
    
    CATextLayer *layer = [codeLayers objectAtIndex:self.currentAnimationIndex];
    selectionAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    
    selectionAnimation.delegate = self;
    selectionAnimation.fromValue = (id)[UIColor blueColor].CGColor;
    selectionAnimation.toValue = (id)[UIColor clearColor].CGColor;
    selectionAnimation.duration = 0.5f;
    selectionAnimation.autoreverses = NO;
    selectionAnimation.fillMode = kCAFillModeForwards;
    selectionAnimation.removedOnCompletion = NO;
    [layer addAnimation:selectionAnimation forKey:kBackToClearBgAnimationKey];
}

- (void)addAnimationData:(NSInteger)lineNumber needAnimation:(BOOL)needAnimation fromColumn:(NSInteger)fromColumn toColumn:(NSInteger)toColumn step: (DataAnimationStep) step
{
    CodeAnimation *codeAnimation = [[CodeAnimation alloc] init];
    codeAnimation.lineNumber = lineNumber;
    if (needAnimation)
    {
        
        DataAnimation *dataAnimation = [[DataAnimation alloc] init];
        dataAnimation.start = fromColumn;
        dataAnimation.end = toColumn;
        dataAnimation.step = step;
        
        codeAnimation.dataAnimation = dataAnimation;
        
    }
    
    [self.codeAnimationArray addObject:codeAnimation];
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    currentAnimation = anim;
    [self finishOneStepAnimation:@selector(fireAnimationViewAction:) afterAnimation:anim];
}

- (void) finishOneStepAnimation:(SEL)animationViewAction afterAnimation:(CAAnimation *)anim {
    CATextLayer *layer = [self.codeLayers objectAtIndex:self.currentAnimationIndex];
    
    if (anim == [layer animationForKey:@"aa"])
    {
        NSLog(@"current Line Number:%d Total Animation:%d", self.currentLineNumber, [self.codeAnimationArray count]);
        CodeAnimation *codeAnimation = [self.codeAnimationArray objectAtIndex:self.currentLineNumber];
        if(codeAnimation.dataAnimation != nil)
        {
            // start move boxes animaiton
            if (animationViewAction != nil) {
                [self performSelector:animationViewAction withObject:codeAnimation];
            }
        }
        else
        {
            [self changeLayerBackgroundBack];
        }
    }
    else if(anim == [layer animationForKey:kBackToClearBgAnimationKey])
    {
        self.currentLineNumber++;
        [self changeLayerBackgroundToColorful];
    }
}

- (void) runCode:(id)sender {
    currentLineNumber = 0;
    
    
    isAnimationBack = NO;
    
    [self changeLayerBackgroundToColorful];
}

- (void) runCode {
    Status = Running;
    currentLineNumber = 0;
    isAnimationBack = NO;
    [self changeLayerBackgroundToColorful];

}

- (void) stopTheWholeAligrithm {
    currentLineNumber = 0;
    isAnimationBack = YES;
    
}

- (void) moveToNextStep {
    [self changeLayerBackgroundBack];
}

@end
