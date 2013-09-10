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
    
    CGContextSetLineWidth(context, 2);
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

@end
