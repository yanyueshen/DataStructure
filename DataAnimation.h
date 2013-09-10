//
//  DataAnimation.h
//  DataStructure
//
//  Created by Andrew on 13-8-21.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    Step0,
    Step1,
    Step2
} DataAnimationStep;

@interface DataAnimation : NSObject

@property (nonatomic) NSInteger start;
@property (nonatomic) NSInteger end;
@property (nonatomic) CGFloat duration;
@property (nonatomic) DataAnimationStep step;

@end
