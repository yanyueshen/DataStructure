//
//  GraphAnimatonView.h
//  DataStructure
//
//  Created by Andrew on 13-9-9.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IAnimationView.h"
#import "IIllustrateGraphAnimationView.h"


@class GraphMatrixView;
@class IllustrateUndirectGraphView;
@class BaseIllustrateGraphView;

@interface GraphAnimatonView : UIView <IAnimationView> {
    @public
    UIView *animationViewsContainer;
    BaseIllustrateGraphView *illustrateView;
    GraphMatrixView *matrixView;
}

@property (nonatomic) GraphMatrixView *matrixView;
@property (nonatomic) BaseIllustrateGraphView *illustrateView;
@property (nonatomic) UITextField *txtBoxesQuantity;
@property (nonatomic) UIButton *btnGenerateMatrix;
@property (nonatomic) UIButton *btnGenerateGraph;
@property (nonatomic) UIView *animationViewsContainer;

- (id) initWithFrame:(CGRect)frame dataLength: (NSInteger) length;
- (void) generateMatrix: (id)sender;
- (void) generateGraph: (id)sender;
- (void) initializeAnimationView;
- (void) initializeGraphMatrixView;

@end
