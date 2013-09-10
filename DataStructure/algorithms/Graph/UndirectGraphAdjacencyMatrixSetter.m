//
//  UndirectGraphAdjacencyMatrixSetter.m
//  Graph
//
//  Created by Andrew on 13-9-6.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import "UndirectGraphAdjacencyMatrixSetter.h"
#import <UIKit/UIKit.h>

@implementation UndirectGraphAdjacencyMatrixSetter

- (void) setItemWithValue:(NSString *)value atX:(int)x atY:(int)y inArray:(NSMutableArray *)boxexArray {
    if (x == y) {
        return;
    }
    
    UIButton *btn = boxexArray[x][y];
    UIButton *btn1 = boxexArray[y][x];
    
    [btn setTitle:value forState:UIControlStateNormal];
    [btn1 setTitle:value forState:UIControlStateNormal];
}

@end
