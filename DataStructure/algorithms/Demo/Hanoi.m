//
//  Hanoi.m
//  DataStructure
//
//  Created by Andrew on 13-8-20.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import "Hanoi.h"
#import "CodeAnimation.h"
#import "DataAnimation.h"
#import "HanoiAnimationView.h"
#import <QuartzCore/QuartzCore.h>

#define kToColorfulBgAnimationKey @"changeToColorfulBackground"
#define kBackToClearBgAnimationKey @"changeBackToClearBackground"

@implementation Hanoi

static Hanoi *staticShareHanoiView;

+(Hanoi *)SharedHanoiView {
    return staticShareHanoiView;
}

- (id) initWithFrame:(CGRect)frame animationView:(HanoiAnimationView *)hanoiAnimationView {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.animationView = hanoiAnimationView;
    
        self.codeData = [[NSArray alloc] initWithObjects: @"void Hannoi(int n, char a, char b, char c）", @"{", @"    if(n==1)",
                    @"    {", @"        NSLog(@\"把%d号从%@ 挪动到 %@\\n\", 1, a, c);", @"    }", @"    else", @"    {",
                    @"        Hannoi（n-1, a, c, b);", @"        NSLog(@\"把%d号从%@挪动到%@\\n\", n, a, c);",
                    @"        Hannoi(n-1, b, c, b);", @"    }", @"}", nil];
        
        
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
        
        NSLog(@"hanoi view layer.x: %f", self.layer.frame.origin.x);
        
        CATextLayer *lastLayer = [self.codeLayers objectAtIndex:[self.codeLayers count] - 1];
        CGRect rect = CGRectMake(10, lastLayer.frame.origin.y + 50, 100, 40);
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button addTarget:self action:@selector(runCode:) forControlEvents:UIControlEventTouchDown];
        [button setTitle:@"Run" forState:UIControlStateNormal];
        [button setFrame:rect];
        [self addSubview:button];
        
        self.codeAnimationArray = [[NSMutableArray alloc] init];
        [self Hannoi:3 a:@"a" b:@"b" c:@"c"];
    }
    
    staticShareHanoiView = self;
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

//- (void)runCode:(id)sender
//{
//    currentLineNumber = 0;
//    
//    
//    isAnimationBack = NO;
//    
//    [self changeLayerBackgroundToColorful];
//}

//- (void) changeLayerBackgroundToColorful
//{
//    if (currentLineNumber >= [codeAnimationArray count])
//    {
//        // when the current Line number is more than the quantity of the code animaiton array
//        // the animation should be terminated.
//        return;
//    }
//    
//    isAnimationBack = NO;
//    CodeAnimation *codeAnimation = [codeAnimationArray objectAtIndex:currentLineNumber];
//    currentAnimationIndex = codeAnimation.lineNumber;
//    
//    CATextLayer *layer = [codeLayers objectAtIndex:self.currentAnimationIndex];
//    selectionAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
//    
//    selectionAnimation.fromValue = (id)[UIColor clearColor].CGColor;
//    selectionAnimation.toValue = (id)[UIColor blueColor].CGColor;
//    selectionAnimation.duration = 0.5f;
//    selectionAnimation.autoreverses = NO;
//    selectionAnimation.fillMode = kCAFillModeForwards;
//    selectionAnimation.removedOnCompletion = NO;
//    selectionAnimation.delegate = self;
//    [layer addAnimation:selectionAnimation forKey:@"aa"];
//    
//}
//
//- (void) changeLayerBackgroundBack
//{
//    isAnimationBack = YES;
//    
//    CATextLayer *layer = [codeLayers objectAtIndex:self.currentAnimationIndex];
//    selectionAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
//    
//    selectionAnimation.delegate = self;
//    selectionAnimation.fromValue = (id)[UIColor blueColor].CGColor;
//    selectionAnimation.toValue = (id)[UIColor clearColor].CGColor;
//    selectionAnimation.duration = 0.5f;
//    selectionAnimation.autoreverses = NO;
//    selectionAnimation.fillMode = kCAFillModeForwards;
//    selectionAnimation.removedOnCompletion = NO;
//    [layer addAnimation:selectionAnimation forKey:kBackToClearBgAnimationKey];
//}

- (void) moveToNextStep
{
    [self changeLayerBackgroundBack];
}

//- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
//{
//    CATextLayer *layer = [self.codeLayers objectAtIndex:self.currentAnimationIndex];
//    
//    if (anim == [layer animationForKey:@"aa"])
//    {
//        NSLog(@"current Line Number:%d Total Animation:%d", self.currentLineNumber, [self.codeAnimationArray count]);
//        CodeAnimation *codeAnimation = [self.codeAnimationArray objectAtIndex:self.currentLineNumber];
//        if(codeAnimation.dataAnimation != nil)
//        {
//            // start move boxes animaiton
//            
//            //hanioAnimationController *aHanioAminationController = [hanioAnimationController sharedHanoiAnimationController];
//          
////            animationView.fromColumn = codeAnimation.dataAnimation.start;
////            animationView.toColumn = codeAnimation.dataAnimation.end;
//            //NSLog(@"from: %d  to: %d", codeAnimation.dataAnimation.start, codeAnimation.dataAnimation.end);
//            //[animationView MoveRect];
//            
//            [animationView setFromIndex:codeAnimation.dataAnimation.start];
//            [animationView setToIndex:codeAnimation.dataAnimation.end];
//            [animationView startAnimation];
//             
//        }
//        else
//        {
//            [self changeLayerBackgroundBack];
//        }
//    }
//    else if(anim == [layer animationForKey:kBackToClearBgAnimationKey])
//    {
//        self.currentLineNumber++;
//        [self changeLayerBackgroundToColorful];
//    }
//}

- (void)fireAnimationViewAction: (CodeAnimation *)codeAnimation {
    [animationView setFromIndex:codeAnimation.dataAnimation.start];
    [animationView setToIndex:codeAnimation.dataAnimation.end];
    [animationView log:[NSString stringWithFormat:@"move from %d to %d", codeAnimation.dataAnimation.start, codeAnimation.dataAnimation.end]];
    
    [animationView startAnimation];
}

//- (void)addAnimationData:(NSInteger)lineNumber needAnimation:(BOOL)needAnimation fromColumn:(NSInteger)fromColumn toColumn:(NSInteger)toColumn
//{
//    CodeAnimation *codeAnimation = [[CodeAnimation alloc] init];
//    codeAnimation.lineNumber = lineNumber;
//    if (needAnimation)
//    {
//        
//        DataAnimation *dataAnimation = [[DataAnimation alloc] init];
//        dataAnimation.start = fromColumn;
//        dataAnimation.end = toColumn;
//        
//        codeAnimation.dataAnimation = dataAnimation;
//        
//    }
//    
//    [self.codeAnimationArray addObject:codeAnimation];
//
//}

- (void) Hannoi:(int)n a:(NSString *)a b:(NSString *)b c:(NSString *)c
{
    NSInteger from = 0;
    NSInteger to = 0;
    
    if([a isEqualToString:@"a"])
    {
        from = 1;
    }
    else if([a isEqualToString:@"b"])
    {
        from = 2;
    }
    else if([a isEqualToString:@"c"])
    {
        from = 3;
    }
    
    if([c isEqualToString:@"a"])
    {
        to = 1;
    }
    else if([c isEqualToString:@"b"])
    {
        to = 2;
    }
    else if([c isEqualToString:@"c"])
    {
        to = 3;
    }
    
    
    [self addAnimationData:1 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
    [self addAnimationData:2 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
    
    if(n==1)
    {
        [self addAnimationData:3 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
        [self addAnimationData:4 needAnimation:YES fromColumn:from toColumn:to step:Step0];
        NSLog(@"把 %d 号从 %@ 挪动到 %@\n", 1, a, c);
        [self addAnimationData:5 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
    }
    else
    {
        [self addAnimationData:6 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
        [self addAnimationData:7 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
        [self addAnimationData:8 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
        [self Hannoi: n-1 a:a b:c c:b];
        
        [self addAnimationData:9 needAnimation:YES fromColumn:from toColumn:to step:Step0];
        NSLog(@"把 %d 号从 %@ 挪动到 %@\n", n, a, c);
        
        [self addAnimationData:10 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
        
        //Hannoi(n-1,b,a,c);
        [self Hannoi: n-1 a:b b:a c:c];
        
        [self addAnimationData:11 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
    }
    [self addAnimationData:12 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
}


@end
