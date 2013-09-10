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


@implementation GraphVertexSetterFactory

+ (id<IGraphVertexSetter>) generateGraphVertexSetter:(GraphVertexSetterType)setterType {
    id res;
    
    switch (setterType) {
        case UndirectGraphAdjacencyMatrix:
            res = [UndirectGraphAdjacencyMatrixSetter new];
            break;
            
        default:
            break;
    }
    
    return res;
}

@end
