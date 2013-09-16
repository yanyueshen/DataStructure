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

- (void) setItemWithValue:(UIButton *)button inArray:(NSMutableArray *)boxesArray {
    int x = 0, y = 0;
    for (; x < boxesArray.count; x++) {
        NSMutableArray *array = boxesArray[x];
        y = [array indexOfObject:button];
        if (y != NSNotFound) {
            break;
        }
    }
    
    if (x == y) {
        return;
    }
    
    UIButton *btn = boxesArray[x][y];
    UIButton *btn1 = boxesArray[y][x];
    
    NSString *value = @"";
    if ([btn.titleLabel.text isEqualToString:@"1"]) {
        value = @"0";
    } else {
        value = @"1";
    }
   
    
    [btn setTitle:value forState:UIControlStateNormal];
    [btn1 setTitle:value forState:UIControlStateNormal];
}

@end
