//
//  GraphAnimatonView.h
//  DataStructure
//
//  Created by Andrew on 13-9-9.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IAnimationView.h"

@class GraphMatrixView;
@class IllustrateUndirectGraphView;

@interface GraphAnimatonView : UIView <IAnimationView>

@property (nonatomic) GraphMatrixView *matrixView;
@property (nonatomic) IllustrateUndirectGraphView *illustrateView;
@property (nonatomic) UITextField *txtBoxesQuantity;
@property (nonatomic) UIButton *btnGenerateMatrix;
@property (nonatomic) UIButton *btnGenerateGraph;
@property (nonatomic) UIView *animationViewsContainer;

- (void) generateMatrix: (id)sender;
- (void) generateGraph: (id)sender;

@end
