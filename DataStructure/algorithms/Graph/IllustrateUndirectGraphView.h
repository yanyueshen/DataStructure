//
//  IllustrateGraphView.h
//  DataStructure
//
//  Created by Andrew on 13-9-9.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IllustrateUndirectGraphView : UIView

@property (nonatomic) int boxesQuantity;
@property (nonatomic) NSMutableArray *boxesArray;
@property (nonatomic) NSMutableArray *dataBoxes;

- (id)initWithFrame:(CGRect)frame andQuantity: (int)quantity;
- (void) drawGraph: (int) quantity withData: (NSMutableArray *) boxes;

@end
