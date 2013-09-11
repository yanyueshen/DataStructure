//
//  ArrowView.m
//  DataStructure
//
//  Created by Andrew on 13-9-10.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import "ArrowView.h"
#import <QuartzCore/QuartzCore.h>

@implementation ArrowView

@synthesize angle;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

- (id) initWithAngle:(float)frameAngle andPosition:(CGPoint)position {
    self = [super initWithFrame:CGRectMake(0, 0, 10, 10)];
    if (self) {
        NSLog(@"angle is: %f", angle);
        self.angle = frameAngle;
        self.layer.position = position;
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGPoint topPoint = CGPointMake(self.frame.size.width / 2, 0);
    CGPoint leftBottom = CGPointMake(0, self.frame.size.height);
    CGPoint rightBottom = CGPointMake(self.frame.size.width, self.frame.size.height);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(context);    
    CGContextMoveToPoint(context, topPoint.x, topPoint.y);
    CGContextAddLineToPoint(context, leftBottom.x, leftBottom.y);
    CGContextAddLineToPoint(context, topPoint.x, leftBottom.y - 2);
    CGContextAddLineToPoint(context, rightBottom.x, rightBottom.y);
//    CGContextAddLineToPoint(context, topPoint.x, topPoint.y);
    CGContextClosePath(context);
    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    
    
    CGContextFillPath(context);

    //UIGraphicsGetCurrentContext();
    
    self.transform = CGAffineTransformMakeRotation(angle);
    
}


@end
