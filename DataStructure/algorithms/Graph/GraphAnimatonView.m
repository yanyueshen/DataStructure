//
//  GraphAnimatonView.m
//  DataStructure
//
//  Created by Andrew on 13-9-9.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import "GraphAnimatonView.h"
#import "IllustrateUndirectGraphView.h"
#import "GraphMatrixView.h"
#import "BaseIllustrateGraphView.h"
#import <QuartzCore/QuartzCore.h>
#import "GraphDeepFirstSearch.h"

@implementation GraphAnimatonView

#pragma mark IAnimationView properties
@synthesize fromIndex;
@synthesize toIndex;
@synthesize step;

#pragma mark GraphAnimationView Properties
@synthesize matrixView;
@synthesize illustrateView;
@synthesize txtBoxesQuantity;
@synthesize btnGenerateGraph;
@synthesize btnGenerateMatrix;
@synthesize animationViewsContainer;

- (id)initWithFrame:(CGRect)frame dataLength: (NSInteger) length
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        // Initialize top bar
        txtBoxesQuantity = [[UITextField alloc] init];
        txtBoxesQuantity.enabled = YES;
        txtBoxesQuantity.placeholder = @"Length of The Matrix";
        txtBoxesQuantity.borderStyle = UITextBorderStyleRoundedRect;
        txtBoxesQuantity.keyboardType = UIKeyboardTypeNumberPad;
        
        [txtBoxesQuantity setFrame:CGRectMake(0, 5, 150, 40)];
        [self addSubview:txtBoxesQuantity];
        
        btnGenerateMatrix = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btnGenerateMatrix setFrame:CGRectMake(170, 5, 120, 40)];
        [btnGenerateMatrix setTitle:@"Generate Matrix" forState:UIControlStateNormal];
        [btnGenerateMatrix setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btnGenerateMatrix setBackgroundColor:[UIColor whiteColor]];
        [btnGenerateMatrix addTarget:self action:@selector(generateMatrix:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnGenerateMatrix];
        
        btnGenerateGraph = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btnGenerateGraph setFrame:CGRectMake(300, 5, 120, 40)];
        [btnGenerateGraph setTitle:@"Generate Graph" forState:UIControlStateNormal];
        [btnGenerateGraph setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btnGenerateGraph setBackgroundColor:[UIColor whiteColor]];
        [btnGenerateGraph addTarget:self action:@selector(generateGraph:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnGenerateGraph];
        
        animationViewsContainer = [[UIView alloc] initWithFrame:CGRectMake(10, 50, (super.frame.size.width - 20), (super.frame.size.height - 50))];
        
        // Initialize the illustrated graph view
        [self initializeAnimationView];
        
        // Initialize the matrix view
        matrixView = [GraphMatrixView new];
        [matrixView setFrame:animationViewsContainer.frame];
        [matrixView setBackgroundColor:[UIColor whiteColor]];
        [animationViewsContainer addSubview:matrixView];
        
        [self addSubview:animationViewsContainer];
    }
    return self;
}

- (void) generateGraph:(id)sender {
    //matrixView.boxesArray
    
    [illustrateView drawGraph:matrixView.boxesQuantity withData:matrixView.boxesArray];
    
    [UIView beginAnimations:@"animationID" context:nil];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationRepeatAutoreverses:NO];
    
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:animationViewsContainer cache:YES];
    
    int from = [animationViewsContainer.subviews indexOfObject:matrixView];
    int to = [animationViewsContainer.subviews indexOfObject:illustrateView];
    
    [animationViewsContainer exchangeSubviewAtIndex:from withSubviewAtIndex:to];
    [UIView commitAnimations];
}

- (void) generateMatrix:(id)sender {
    int quantity = txtBoxesQuantity.text.intValue;
    
    if (quantity < 2 || quantity > 10) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"The number should be between 2 and 9" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    [matrixView drawMatrix: quantity];
    
    [txtBoxesQuantity resignFirstResponder];
}


- (void) startAnimation {
    [UIView animateWithDuration:0.5 animations:^{
        UILabel *lbl = illustrateView.boxesArray[fromIndex];
        [lbl setBackgroundColor:[UIColor blueColor]];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5f animations:^{
            UILabel *lbl = illustrateView.boxesArray[fromIndex];
            [lbl setBackgroundColor:[UIColor whiteColor]];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5f animations:^{
                UILabel *lbl = illustrateView.boxesArray[fromIndex];
                [lbl setBackgroundColor:[UIColor blueColor]];
            } completion:^(BOOL finished) {
                [[GraphDeepFirstSearch SharedCodeView] moveToNextStep];
            }];
        }];
    }];
    
    
    
//    UIButton *btn = illustrateView.boxesArray[fromIndex];//illustrateView.dataBoxes[fromIndex];
//    
//    CABasicAnimation *animation  = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
//    
//    animation.fromValue = (id)[UIColor clearColor].CGColor;
//    animation.toValue = (id)[UIColor blueColor].CGColor;
//    animation.duration = 0.5f;
//    animation.autoreverses = NO;
//    animation.fillMode = kCAFillModeForwards;
//    animation.removedOnCompletion = NO;
//    animation.delegate = self;
//    
//
//    [btn.imageView.layer addAnimation:animation forKey:@"aa"];
    
}

- (void) stopAnimation {
    
}

- (void) log:(NSString *)logText {
    
}

- (void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    [[GraphDeepFirstSearch SharedCodeView] moveToNextStep];
}

- (NSMutableArray *) getGraphNodes {
    NSMutableArray __weak *res = [NSMutableArray array];
    for (int i = 0; i < matrixView.boxesQuantity; i++) {
        [res addObject:[NSNumber numberWithInt:i]];
    }
    
    return res;
}

- (NSMutableArray *) getGraphMatrix {
    NSMutableArray __weak *res = [NSMutableArray array];
    
    for (int i = 0; i < matrixView.boxesQuantity; i++) {
        NSMutableArray *row = [NSMutableArray array];
        for (int j = 0; j < matrixView.boxesQuantity; j++) {
            UIButton *btn = matrixView.boxesArray[i][j];
            [row addObject:[NSNumber numberWithInt:btn.titleLabel.text.intValue]];
        }
        [res addObject:row];
    }
    
    return res;
}
@end
