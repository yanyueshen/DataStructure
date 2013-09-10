//
//  MenuItem.h
//  DataStructure
//
//  Created by Andrew on 13-9-3.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuItem : NSObject

@property (nonatomic) NSString *Id;
@property (nonatomic) NSArray *Children;
@property (nonatomic) NSString *DisplayName;
@property (nonatomic) NSString *AlgorithmClassName;
@property (nonatomic) NSString *IllustrateAnimationClassName;

@end
