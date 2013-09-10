//
//  MenuButton.m
//  DataStructure
//
//  Created by Andrew on 13-9-3.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import "MenuButton.h"

@implementation MenuButton
@synthesize subMenus;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
+ (id)buttonWithType:(UIButtonType)buttonType
{
    return [super buttonWithType:buttonType];
}

@end
