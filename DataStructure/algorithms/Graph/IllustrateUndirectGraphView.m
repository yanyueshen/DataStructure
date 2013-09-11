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

@synthesize boxesQuantity;
@synthesize boxesArray;
@synthesize dataBoxes;

- (id)initWithFrame:(CGRect)frame andQuantity: (int)quantity
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        boxesQuantity = quantity;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{

    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextClearRect(context, self.frame);
//    [self setBackgroundColor:[UIColor whiteColor]];
    
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
                    
//                    NSLog(@"arrow left: %f and top %f", arrowEndX, arrowEndY);
                    ArrowView *arrow = [[ArrowView alloc] initWithAngle:angle andPosition:CGPointMake(arrowEndX, arrowEndY)];
                    [self addSubview:arrow];
                    
                    
                }

            }
        }
    }
    
    CGContextStrokePath(context);
    CGContextFillPath(context);
    
}

float absf(float value) {
    if (value < 0) {
        value = value * -1;
    }
    
    return value;
}

- (void) drawGraph: (int) quantity withData: (NSMutableArray *) boxes {
    dataBoxes = boxes;
    
    if (boxesArray == nil) {
        boxesArray = [NSMutableArray array];
    } else {
        [boxesArray removeAllObjects];
    }
    
    boxesQuantity = quantity;
    int pointCount = boxesQuantity;        // pointCount is how many points will be in the graph view
    
    // To make sure the pointCount is even.
    if (boxesQuantity % 2 == 1) {
        pointCount ++;
    }
    
    int radius = pointCount / 4 * 70;  // The length of the boxes is 50 and the space is 20.
    int top = 100;
    int left = 100;
    int width = 50;
    int height = 50;
    
    float step = 2 * M_PI / boxesQuantity;
    
    
    for (int i = 0; i < boxesQuantity; i++) {
        
        float x = 0, y = 0;
        
        x = radius * cosf(2 * M_PI - i * step - M_PI / 2) + left + radius;
        y = radius * sinf(2 * M_PI - i * step - M_PI / 2) + top + radius;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.backgroundColor = [UIColor whiteColor];
        [btn setTitle:[NSString stringWithFormat:@"V%d", i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setFrame:CGRectMake(x - width / 2, y - height / 2, width, height)];
        NSLog(@"btn's position (%f, %f)", btn.layer.position.x, btn.layer.position.y);
        [boxesArray addObject:btn];
        [self addSubview:btn];
        
    }
    
    [self setNeedsDisplay];
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
    
//    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1);
    [[UIColor blackColor] set];
    
    CGContextMoveToPoint(context, startX, startY);
    CGContextAddLineToPoint(context, xa, ya);
    CGContextMoveToPoint(context, xa, ya);
    CGContextAddLineToPoint(context, xb, yb);
    CGContextMoveToPoint(context, xb, yb);
    CGContextAddLineToPoint(context, startX, startY);
    
    //CGContextDrawPath(context, kCGPathFill);
//    CGContextStrokePath(context);
//    CGContextFillPath(context);
//    CGContextRelease(context);
}

@end
