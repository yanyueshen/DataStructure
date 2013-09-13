//
//  IllustrateDirectGraphView.h
//  DataStructure
//
//  Created by Andrew on 13-9-12.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseIllustrateGraphView.h"

@interface IllustrateDirectGraphView : BaseIllustrateGraphView

- (void) drawArrowHead: (CGContextRef) context startPoint: (CGPoint) startPoint endPoint:(CGPoint) endPoint;

@end
