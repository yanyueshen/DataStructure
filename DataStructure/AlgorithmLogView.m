//
//  AlgorithmLogView.m
//  DataStructure
//  This view is for outputting log information. It will be a part of the algorithm view.
//  
//
//  Created by Andrew on 13-8-30.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import "AlgorithmLogView.h"

@implementation AlgorithmLogView
@synthesize logTextView;
@synthesize btnClear;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *topBar = [[UIImageView alloc] init];
        [topBar setBackgroundColor:[UIColor darkGrayColor]];
        [topBar setFrame:CGRectMake(0, 0, self.frame.size.width, 50)];
        [self addSubview:topBar];
        
        btnClear = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnClear setFrame:CGRectMake(self.frame.size.width - 160, 5, 150, 40)];
        [btnClear setBackgroundColor:[UIColor whiteColor]];
        [btnClear setTitle:@"Clear" forState:UIControlStateNormal];
        [btnClear setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btnClear setEnabled:YES];
        [topBar addSubview:btnClear];
        [btnClear addTarget:self action:@selector(clearLog:) forControlEvents:UIControlEventTouchUpInside];
        
        logTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 50, self.frame.size.width, self.frame.size.height)];
        logTextView.font = [UIFont fontWithName:@"Arial" size:12.0];
        [logTextView setEditable:NO];
        
        [self addSubview:logTextView];
    }
    return self;
}

- (void) Log:(NSString *)logText {
    [logTextView setText:[NSString stringWithFormat:@"%@\n%@", logTextView.text, logText]];
}

- (void) clearLog: (id)sender {
    NSLog(@"clear code");
    logTextView.text = @"";
}
@end
