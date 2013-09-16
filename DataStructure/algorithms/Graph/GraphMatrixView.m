//
//  GraphMatrixView.m
//  DataStructure
//
//  Created by Andrew on 13-9-9.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import "GraphMatrixView.h"
#import "GraphVertexSetterFactory.h"
#import "ArrowView.h"

@implementation GraphMatrixView

@synthesize boxesQuantity;
@synthesize boxesArray;
@synthesize vertexSetter;

- (id)initWithFrame:(CGRect)frame andSetter: (id<IGraphVertexSetter>) setter
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        vertexSetter = setter;
//        ArrowView *arrow = [[ArrowView alloc] initWithAngle:100 andPosition:CGPointMake(100, 100)];
//        [self addSubview:arrow];
    }
    return self;
}


- (void) drawMatrix: (int) quantity {
    boxesQuantity = quantity;
    
    boxesArray = [NSMutableArray array];
    int top = 100;
    int width = 50;
    int height = 50;
    int spaceWidth = 20;
    int spaceHeight = 20;
    
    int left = (self.frame.size.width - (width * boxesQuantity + (spaceWidth * (boxesQuantity - 1)))) / 2;
    
    for (int i = 0; i < boxesQuantity; i++) {
        NSMutableArray *row = [NSMutableArray array];
        for (int s = 0; s < boxesQuantity; s++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [btn setTitle:@"0" forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn setBackgroundColor:[UIColor whiteColor]];
            btn.frame = CGRectMake(s * (width + spaceWidth) + left, i * (height + spaceHeight) + top, width, height);
            [btn addTarget:self action:@selector(vertexChanged:) forControlEvents:UIControlEventTouchUpInside];
            
            [row addObject:btn];
            
            [self addSubview:btn];
        }
        [boxesArray addObject:row];
    }
}


- (void) vertexChanged: (id)sender {
    UIButton *btn = (UIButton *)sender;
    [vertexSetter setItemWithValue:btn inArray:boxesArray];
}

@end
