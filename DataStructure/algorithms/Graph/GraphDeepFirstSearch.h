//
//  GraphDeepFirstSearch.h
//  DataStructure
//
//  Created by Andrew on 13-9-12.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IAnimationView.h"
#import "IIllustrateGraphAnimationView.h"
#import "BasicAlgorithmView.h"

typedef int VertexType;
typedef int EdgeType;
#define MAXVEX 100
#define INFINITY 65535

typedef struct {
    VertexType vexs[MAXVEX];
    EdgeType arc[MAXVEX][MAXVEX];
    int numVertexes, numEdges;
} MGraph;

@interface GraphDeepFirstSearch : BasicAlgorithmView {
    int visited[MAXVEX];
    
    int _nodes[MAXVEX];
    int _matrix[MAXVEX][MAXVEX];
}

+ (GraphDeepFirstSearch *) SharedCodeView;

@property (nonatomic) MGraph mGraph;

- (void) initializeCodeData;
- (void) insertionSort;
- (void) moveToNextStep;

- (void) DFSTraveres: (MGraph ) graph;
- (void) DFS: (MGraph) graph index: (int) i;

@end
