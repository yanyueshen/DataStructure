//
//  GraphVertexSetterFactory.h
//  Graph
//
//  Created by Andrew on 13-9-6.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IGraphVertexSetter.h"

typedef enum {
    UndirectedGraphAdjacencyMatrix,
    UndirectedWithWeightGraphAdjacencyMatrix
} GraphVertexSetterType;


@interface GraphVertexSetterFactory : NSObject

+ (id<IGraphVertexSetter>) generateGraphVertexSetter: (GraphVertexSetterType) setterType;

@end
