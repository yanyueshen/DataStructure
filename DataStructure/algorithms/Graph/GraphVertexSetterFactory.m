//
//  GraphVertexSetterFactory.m
//  Graph
//
//  Created by Andrew on 13-9-6.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import "GraphVertexSetterFactory.h"
#import "IGraphVertexSetter.h"
#import "UndirectGraphAdjacencyMatrixSetter.h"
#import "UndirectedWithWeightGraphAdjacencyMatrixSetter.h"

@implementation GraphVertexSetterFactory

+ (id<IGraphVertexSetter>) generateGraphVertexSetter:(GraphVertexSetterType)setterType {
    id res = nil;
    
    switch (setterType) {
        case UndirectedGraphAdjacencyMatrix:
            res = [UndirectGraphAdjacencyMatrixSetter new];
            break;
        case UndirectedWithWeightGraphAdjacencyMatrix:
            res = [UndirectedWithWeightGraphAdjacencyMatrixSetter new];
            break;
        default:
            break;
    }
    
    return res;
}

@end
