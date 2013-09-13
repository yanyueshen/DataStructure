//
//  BaseIllustrateGraphView.m
//  DataStructure
//
//  Created by Andrew on 13-9-12.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import "BaseIllustrateGraphView.h"
#import <QuartzCore/QuartzCore.h>

@implementation BaseIllustrateGraphView

@synthesize boxesQuantity;
@synthesize boxesArray;
@synthesize dataBoxes;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame andQuantity: (int)quantity
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        boxesQuantity = quantity;
    }
    return self;
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

        
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(x - width / 2, y - height / 2, width, height)];
        lbl.backgroundColor = [UIColor whiteColor];
        lbl.layer.borderColor = [UIColor blackColor].CGColor;
        lbl.layer.borderWidth = 1;
        lbl.layer.cornerRadius = 5;
        
        lbl.text = [NSString stringWithFormat:@"V%d", i];
        lbl.textAlignment = NSTextAlignmentCenter;
        lbl.baselineAdjustment = UIBaselineAdjustmentAlignCenters;

        [boxesArray addObject:lbl];
        [self addSubview:lbl];
        
    }
    
    [self setNeedsDisplay];
}


@end
