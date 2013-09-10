//
//  GraphMatrixView.h
//  DataStructure
//
//  Created by Andrew on 13-9-9.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IGraphVertexSetter.h"

@class GraphAnimatonView;

@interface GraphMatrixView : UIView {
}

@property (nonatomic) int boxesQuantity;
@property (nonatomic) NSMutableArray *boxesArray;
//@property (nonatomic) GraphAnimatonView *parentView;
//@property (nonatomic) 

- (void) drawMatrix: (int) quantity;

@end
