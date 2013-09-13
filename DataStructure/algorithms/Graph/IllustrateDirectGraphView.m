//
//  IllustrateDirectGraphView.m
//  DataStructure
//
//  Created by Andrew on 13-9-12.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import "IllustrateDirectGraphView.h"
#import "ArrowView.h"
#import <QuartzCore/QuartzCore.h>


@implementation IllustrateDirectGraphView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


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
                    
                    NSLog(@"drawing edge %d to %d", i, j);
                    
                    CGContextMoveToPoint(context, btnI.layer.position.x, btnI.layer.position.y);
                    CGContextAddLineToPoint(context, btnJ.layer.position.x, btnJ.layer.position.y);
                    //
                    float ix = btnI.layer.position.x;
                    float iy = btnI.layer.position.y;
                    float jx = btnJ.layer.position.x;
                    float jy = btnJ.layer.position.y;
                    
                    float arrowEndX = (btnI.layer.position.x - btnJ.layer.position.x) / 2;
                    float arrowEndY = (btnI.layer.position.y - btnJ.layer.position.y) / 2;
                    
                    float angle = 0;
                    if (jx == ix) {
                        angle = 0;
                    } else {
                        angle = atan2f(jy - iy, jx - ix) - M_PI / 2;
                    }
                    
                    
                    float offsetLength = 35;
                    float distance = sqrtf((jx - ix) * (jx - ix) + (jy - iy) * (jy - iy));
                    
                    // calculate the endpoint coordinate
                    if (jx >= ix) {
                        arrowEndX = ix + absf((jx - ix) * (offsetLength / distance));
                        if (jy >= iy) {
                            // Fourth quadrant
                            arrowEndY = iy + absf((jy - iy) * (offsetLength / distance));
                        } else {
                            // First quadrant
                            arrowEndY = iy - absf((jy - iy) * (offsetLength / distance));
                        }
                    } else {
                        arrowEndX = ix - absf((jx - ix) * (offsetLength / distance));
                        if (jy >= iy) {
                            // Third quadrant
                            arrowEndY = iy + absf((jy - iy) * (offsetLength / distance));
                        } else {
                            // Second quadrant
                            arrowEndY = iy - absf((jy - iy) * (offsetLength / distance));
                        }
                    }
                    
                    ArrowView *arrow = [[ArrowView alloc] initWithAngle:angle andPosition:CGPointMake(arrowEndX, arrowEndY)];
                    [self addSubview:arrow];
                    
                    
                }
                
            }
        }
    }
    
    CGContextStrokePath(context);
    CGContextFillPath(context);
    
}

- (void) drawArrowHead: (CGContextRef) context startPoint: (CGPoint) startPoint endPoint:(CGPoint) endPoint {
    double length = 6;
    double realtiveValue = 1;
    double radius = 6;
    
    float startX = startPoint.x;
    float startY = startPoint.y;
    float endX = endPoint.x;
    float endY = endPoint.y;
    
    double distance = 5;//sqrt((startX - endX) * (startX - endX) + (startY - endY) * (startY - endY));
    if (distance < 0) {
        distance = distance * -1;
    }
    
    if (distance == 0) {
        return;
    }
    
    startX = (float)(radius / distance * (endX - startX)) + startX;
    startY = (float)(radius / distance * (endY - startY)) + startY;
    
    endX = (float)(radius / distance * (startX - endX)) + endX;
    endY = (float)(radius / distance * (startY - endY)) + endY;
    
    double xa = endX + length * ((startX - endX)
                                 + (startY - endY) / realtiveValue) / distance;
    double ya = endY + length * ((startY - endY)
                                 - (startX - endX) / realtiveValue) / distance;
    double xb = endX + length * ((startX - endX)
                                 - (startY - endY) / realtiveValue) / distance;
    double yb = endY + length * ((startY - endY)
                                 + (startX - endX) / realtiveValue) / distance;
    
    CGContextSetLineWidth(context, 1);
    [[UIColor blackColor] set];
    
    CGContextMoveToPoint(context, startX, startY);
    CGContextAddLineToPoint(context, xa, ya);
    CGContextMoveToPoint(context, xa, ya);
    CGContextAddLineToPoint(context, xb, yb);
    CGContextMoveToPoint(context, xb, yb);
    CGContextAddLineToPoint(context, startX, startY);
}

float absf(float value) {
    if (value < 0) {
        value = value * -1;
    }
    
    return value;
}

@end
