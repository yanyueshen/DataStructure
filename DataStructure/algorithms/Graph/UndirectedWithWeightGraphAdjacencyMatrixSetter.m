//
//  DirectedGraphAdjacencyMatrixSetter.m
//  DataStructure
//
//  Created by Andrew on 13-9-16.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import "UndirectedWithWeightGraphAdjacencyMatrixSetter.h"

@implementation UndirectedWithWeightGraphAdjacencyMatrixSetter

@synthesize boxButton;

-(void) setItemWithValue:(UIButton *)button inArray:(NSMutableArray *)boxesArray {
    int x = 0, y = 0;
    for (; x < boxesArray.count; x++) {
        NSMutableArray *array = boxesArray[x];
        y = [array indexOfObject:button];
        if (y != NSNotFound) {
            break;
        }
    }
    
    if (x == y) {
        return;
    }
    
    boxButton = button;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Please input Weight" message:@"Please input Weight" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [alert show];
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == alertView.firstOtherButtonIndex) {
        UITextField *field = [alertView textFieldAtIndex:0];
        
        [boxButton setTitle:field.text forState:UIControlStateNormal];
    }
}

- (BOOL) alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView {
    UITextField *field = [alertView textFieldAtIndex:0];
    NSString *value = [NSString stringWithFormat:@"%d", field.text.intValue];
    
    if ([field.text isEqualToString:value]) {
        return YES;
    } else {
        return NO;
    }
}
@end
