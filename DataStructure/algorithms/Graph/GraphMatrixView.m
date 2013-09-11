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

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        ArrowView *arrow = [[ArrowView alloc] initWithAngle:100 andPosition:CGPointMake(100, 100)];
//        [self addSubview:arrow];
    }
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
    
    int x = 0, y = 0;
    for (; x < boxesQuantity; x++) {
        NSMutableArray *array = boxesArray[x];
        y = [array indexOfObject:btn];
        if (y != NSNotFound) {
            break;
        }
    }
    
    id<IGraphVertexSetter> vertexSetter = [GraphVertexSetterFactory generateGraphVertexSetter:UndirectGraphAdjacencyMatrix];
    
    if (x == y) {
        // Can't assign data to the main diagonal
        return;
    }
    
    
    if ([btn.titleLabel.text isEqualToString:@"1"]) {
        [vertexSetter setItemWithValue:@"0" atX:x atY:y inArray:boxesArray];
    } else {
        [vertexSetter setItemWithValue:@"1" atX:x atY:y inArray:boxesArray];
    }
}

@end
