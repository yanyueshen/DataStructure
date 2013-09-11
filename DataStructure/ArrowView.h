//
//  ArrowView.h
//  DataStructure
//
//  Created by Andrew on 13-9-10.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArrowView : UIView

@property (nonatomic) float angle;

- (id) initWithAngle: (float) frameAngle andPosition: (CGPoint) position;

@end
