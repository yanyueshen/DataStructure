//
//  IGraphSetter.h
//  Graph
//
//  Created by Andrew on 13-9-6.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIButton;

@protocol IGraphVertexSetter

- (void) setItemWithValue:(UIButton *)button inArray:(NSMutableArray *)boxesArray;

@end
