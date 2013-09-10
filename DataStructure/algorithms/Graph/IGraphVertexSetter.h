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

- (void) setItemWithValue:(NSString *)value atX:(int)x atY:(int)y inArray:(NSMutableArray *)boxexArray;

@end
