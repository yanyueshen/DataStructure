//
//  ViewController.h
//  DataStructure
//
//  Created by Andrew on 13-8-20.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    Show,
    Hide
} DisplayAs;

@class MenuItem;

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UIButton *btnDemo;
@property (nonatomic) BOOL isAlgorithmOpened;
@property (weak, nonatomic) IBOutlet UIView *algorithmLayoutView;
@property (weak, nonatomic) IBOutlet UIView *leftSectionLayout;
@property (strong, nonatomic) IBOutlet UIView *leftCodeLayout;
@property (weak, nonatomic) IBOutlet UIView *animationSectionLayout;
@property (weak, nonatomic) IBOutlet UITableView *algorithmTableView;
@property (weak, nonatomic) IBOutlet UIButton *btnShowOrHideAlgorithmLayout;
@property (strong, nonatomic) NSArray *menus;
@property (strong, nonatomic) MenuItem *currentMenuItem;


@property (copy, nonatomic) NSMutableArray *algorithmListData;

- (void) initButtons;
- (void) initAlgorithmLayout;
- (void) initializeMenus;
- (void) displayAlgorithmTableViewAs:(DisplayAs)displayway;
- (void) showAlgorithmData;

- (IBAction)showOrHideAlgorithmView:(id)sender;
- (IBAction)showDemoTableData:(id)sender;


-(void) quick_sort:(int [])a left: (int)left right:(int) right;

@end
