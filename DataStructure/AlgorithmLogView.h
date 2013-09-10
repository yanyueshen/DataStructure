//
//  AlgorithmLogView.h
//  DataStructure
//
//  Created by Andrew on 13-8-30.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlgorithmLogView : UIView

@property (nonatomic) UITextView *logTextView;
@property (nonatomic) UIButton *btnClear;

- (void) Log: (NSString *)logText;
- (void) clearLog: (id)sender;

@end
