//
//  IllustrateGraphView.m
//  DataStructure
//
//  Created by Andrew on 13-9-9.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import "IllustrateUndirectGraphView.h"
#import <QuartzCore/QuartzCore.h>
#import <Foundation/Foundation.h>
#import "ArrowView.h"

@implementation IllustrateUndirectGraphView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 1);
    [[UIColor blackColor] set];    
    if (dataBoxes != nil) {
        for (int i = 0; i < dataBoxes.count; i++) {
            UIButton *btnI = (UIButton *)boxesArray[i];
            for (int j = i + 1; j < dataBoxes.count; j++) {
                UIButton *btnMatrix = (UIButton *)dataBoxes[i][j];
                if (btnMatrix != nil && btnMatrix.titleLabel.text.intValue == 1) {
                    UIButton *btnJ = boxesArray[j];
                                        
                    CGContextMoveToPoint(context, btnI.layer.position.x, btnI.layer.position.y);
                    CGContextAddLineToPoint(context, btnJ.layer.position.x, btnJ.layer.position.y);                    
                }

            }
        }
    }
    
    CGContextStrokePath(context);
    CGContextFillPath(context);
    
}

@end
