//
//  InsertionSortAnimationView.h
//  DataStructure
//
//  Created by Andrew on 13-8-24.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasicSortAnimationView.h"

@interface InsertionSortAnimationView : BasicSortAnimationView

@property (nonatomic) NSMutableArray *positionArray;
@property (nonatomic) NSMutableArray *movedBoxesIndexes;

@property (nonatomic) CGPoint orignalCompareBoxPosition;
@property (nonatomic) CGPoint previousBoxPosition;

@property (weak, nonatomic) UIButton *compareButton;
@property (weak, nonatomic) UIButton *previousButton;

@end
