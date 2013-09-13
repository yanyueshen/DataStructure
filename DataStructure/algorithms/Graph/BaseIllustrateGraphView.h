//
//  BaseIllustrateGraphView.h
//  DataStructure
//
//  Created by Andrew on 13-9-12.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "IllustrateDirectGraphView.h"

@interface BaseIllustrateGraphView : UIView {
    @public
    int boxesQuantity;
    NSMutableArray *boxesArray;
    NSMutableArray *dataBoxes;
}

@property (nonatomic) int boxesQuantity;
@property (nonatomic) NSMutableArray *boxesArray;
@property (nonatomic) NSMutableArray *dataBoxes;

- (id)initWithFrame:(CGRect)frame andQuantity: (int)quantity;
- (void) drawGraph: (int) quantity withData: (NSMutableArray *) boxes;

@end
