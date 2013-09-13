//
//  GraphDeepFirstSearch.m
//  DataStructure
//
//  Created by Andrew on 13-9-12.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import "GraphDeepFirstSearch.h"
#import "CodeAnimation.h"
#import "DataAnimation.h"

@implementation GraphDeepFirstSearch

@synthesize mGraph;

static GraphDeepFirstSearch *_graphDeepFirstSearch;

+ (GraphDeepFirstSearch *) SharedCodeView {
    return _graphDeepFirstSearch;
}

- (id) initWithFrame:(CGRect)frame animationView:(id<IAnimationView>)AnimationView {
    self = [super initWithFrame:frame animationView:AnimationView];
    
    _graphDeepFirstSearch = self;
    
    return self;
}

- (void) initializeCodeData {
    self.codeData = @[@"typedef int Boolean",
                      @"Boolean visited[MAX]",
                      @"",
                      @"void DFSTraverse(MGraph G) {",
                      @"    int i;",
                      @"    for( i = 0; i < G.numVertexes; i++) {",
                      @"        visited[i] = TRUE;",
                      @"    }",
                      @"    for(i = 0; i < G.numVertexes; i++) {",
                      @"        if(!visited[i]) {",
                      @"            DFS(G, i)",
                      @"        }",
                      @"    }",
                      @"}",
                      @"",
                      @"void DFS(MGraph G, int i) {",
                      @"    int j;",
                      @"    visited[i] = TRUE;",
                      @"    printf(\"%c\%, G.vexs[i]);",
                      @"    for(j = 0; j < G.numVertexes; j++) {",
                      @"        if(G.arc[i][j] == 1 && !visited[j]) {",
                      @"            DFS(G, j);",
                      @"        }",
                      @"    }",
                      @"}"
                      ];
    [super initializeCodeData];
}

- (void) aligorithm {
    NSMutableArray *nodes = [animationView getGraphNodes];
    NSMutableArray *matrix = [animationView getGraphMatrix];
    
    if (nodes == nil || nodes.count == 0 || matrix == nil || matrix.count == 0) {
        return;
    }
    
    for (int i = 0; i < nodes.count; i++) {
        NSNumber *number = nodes[i];
        mGraph.vexs[i] = number.intValue;
    }
    
    for (int i = 0; i < matrix.count; i++) {
        NSMutableArray *row = [matrix objectAtIndex:i];
        for (int j = 0; j < row.count; j++) {
            NSNumber *number = matrix[i][j];
            mGraph.arc[i][j] = number.intValue;
        }
    }
    
    mGraph.numVertexes = nodes.count;
    
    [self DFSTraveres:mGraph];
}

- (void) DFSTraveres:(MGraph)graph {
    [self addAnimationData:4 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
    int i;
    
    [self addAnimationData:5 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
    for (i = 0; i < graph.numVertexes; i++) {
        [self addAnimationData:6 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
        visited[i] = 0;
    }
    [self addAnimationData:7 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
    
    [self addAnimationData:8 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
    for (i = 0; i < graph.numVertexes; i++) {
        [self addAnimationData:9 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
        if (!visited[i]) {
            [self addAnimationData:10 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
            [self DFS:graph index:i];
        }
        [self addAnimationData:11 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
    }
    [self addAnimationData:12 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
    [self addAnimationData:13 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
}

- (void) DFS:(MGraph)graph index:(int)i {
    [self addAnimationData:16 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
    int j;
    
    [self addAnimationData:17 needAnimation:YES fromColumn:i toColumn:i step:Step0];
    visited[i] = 1;
    NSLog(@"current node id is:%d", graph.vexs[i]);
    
    [self addAnimationData:18 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
    [self addAnimationData:19 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
    for (j = 0; j < graph.numVertexes; j++) {
        
        [self addAnimationData:20 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
        if (graph.arc[i][j] == 1 && !visited[j]) {
            [self addAnimationData:21 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
            [self DFS:graph index:j];
            [self addAnimationData:22 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
        }
    }
    [self addAnimationData:23 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
    [self addAnimationData:24 needAnimation:NO fromColumn:-1 toColumn:-1 step:Step0];
}

- (void) runCode {
    [self aligorithm];
    
    [super runCode];
}

- (void) fireAnimationViewAction:(CodeAnimation *)codeAnimation {
    [animationView setFromIndex:codeAnimation.dataAnimation.start];
    [animationView setToIndex:codeAnimation.dataAnimation.end];
    [animationView log:[NSString stringWithFormat:@"move from %d to %d", codeAnimation.dataAnimation.start, codeAnimation.dataAnimation.end]];
    
    [animationView startAnimation];
}

@end
