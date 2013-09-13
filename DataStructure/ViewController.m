//
//  ViewController.m
//  DataStructure
//
//  Created by Andrew on 13-8-20.
//  Copyright (c) 2013年 Andrew. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ViewController.h"
#import "Algorithms/Demo/Hanoi.h"
#import "HanoiAnimationView.h"
#import "BubbleSortView.h"
#import "BubbleSortAnimationView.h"
#import "InsertionSort.h"
#import "InsertionSortAnimationView.h"
#import "MenuItem.h"
#import "MenuButton.h"
#import "GraphAnimatonView.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize btnDemo;
@synthesize isAlgorithmOpened;
@synthesize algorithmListData;
@synthesize menus;
@synthesize currentMenuItem;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   
    _leftCodeLayout = [[UIView alloc] initWithFrame:CGRectMake(0, 44, _leftSectionLayout.frame.size.width, _leftSectionLayout.frame.size.height)];
    [_leftCodeLayout setBackgroundColor:[UIColor whiteColor]];
    
    [_leftSectionLayout insertSubview:_leftCodeLayout atIndex:0];
    
    int data[] = {30, 12, 34, 2, 5};

    [self quick_sort:data left:0 right:4];
    
for(int i = 0;i <= 4; i++) {
    NSLog(@"Sorted Data data[%d] = %d", i, data[i]);//[[a objectAtIndex:i] intValue]);
}

    self.isAlgorithmOpened = YES;
    [self initializeMenus];
    [self initAlgorithmLayout];
}

-(void) quick_sort:(int [])a left: (int)left right:(int) right
{
    int i = left + 1, j = right;
    int  key = a[left];// [[a objectAtIndex:left] intValue];
    
    if (left >= right)
    {
        return;
    }
    
    while (1) {
        while (a[j] > key)
            j--;
        while (a[i] < key&&i<j)
            i++;
        if(i >= j)
            break;

        int temp = a[i];
        a[i] = a[j];
        a[j] = temp;
        
        //swap(&a[i],&a[j]);
        if(a[i]==key)
            j--;
        else
            i++;
    }
    
    int temp = a[left];
    a[left] = a[j];
    a[j] = temp;
    
    //    swap(&a[left],&a[j]);
    
    if(left  < i - 1)
       [self quick_sort:a left:left right: i - 1];
    if(j + 1 < right)
       [self quick_sort:a left: j + 1 right: right];
        //quick_sort(a, j + 1 , right);
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initializeMenus {
   // CFUUIDRef uuidObject = CFUUIDCreate(kCFAllocatorDefault);
    
    // Demo Menus
    MenuItem *demo = [MenuItem new];
    demo.DisplayName = @"Demo";
    demo.AlgorithmClassName = @"0";
    
    MenuItem *hanoi = [MenuItem new];
    hanoi.DisplayName = @"Hanoi";
    hanoi.AlgorithmClassName = @"Hanoi";
    hanoi.IllustrateAnimationClassName = @"HanoiAnimationView";
    
    MenuItem *bubble = [MenuItem new];
    bubble.DisplayName = @"Bubble Sort";
    bubble.AlgorithmClassName = @"BubbleSortView";
    bubble.IllustrateAnimationClassName = @"BubbleSortAnimationView";
    
    demo.Children = [NSArray arrayWithObjects:hanoi, bubble, nil];
    
    //////////////////////////////   Sort Menus ///////////////////////////////////////
    MenuItem *sort = [MenuItem new];
    sort.AlgorithmClassName = @"Sort";
    sort.AlgorithmClassName = @"1";
    
    MenuItem *bubbleSort = [MenuItem new];
    bubbleSort.DisplayName = @"Bubble Sort";
    bubbleSort.AlgorithmClassName = @"BubbleSortView";
    bubbleSort.IllustrateAnimationClassName = @"BubbleSortAnimationView";
    
    MenuItem *insertion = [MenuItem new];
    insertion.DisplayName = @"Insertion Sort";
    insertion.AlgorithmClassName = @"InsertionSort";
    insertion.IllustrateAnimationClassName = @"InsertionSortAnimationView";
    
    MenuItem *quick = [MenuItem new];
    quick.DisplayName = @"Quick Sort";
    quick.AlgorithmClassName = @"QuickSortView";
    quick.IllustrateAnimationClassName = @"QuickSortAnimationView";
    
    sort.Children = [NSArray arrayWithObjects:bubbleSort, insertion, quick, nil];
    
    //////////////////////////////   Graph Menus ///////////////////////////////////////
    MenuItem *graph = [MenuItem new];
    graph.AlgorithmClassName  = @"graph";
    graph.AlgorithmClassName  = @"2";
    
    MenuItem *undirectDeepFirst = [MenuItem new];
    undirectDeepFirst.DisplayName = @"Deep first (Undirected)";
    undirectDeepFirst.AlgorithmClassName = @"GraphDeepFirstSearch";
    undirectDeepFirst.IllustrateAnimationClassName = @"UndirectGraphDeepFirstAnimationView";
    
    graph.Children = [NSArray arrayWithObjects:undirectDeepFirst, nil];
    
    menus = [NSArray arrayWithObjects:demo, sort, graph, nil];
    
    float top = 12;
    float height = 64;
    
    for (int i = 0; i < menus.count; i++) {
        MenuItem *menu = [menus objectAtIndex:i];
        UIButton *btn = (MenuButton *)[UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.tag = menu.AlgorithmClassName.intValue;
        
//        [btn setBackgroundColor:[UIColor whiteColor]];
        [btn setFrame:CGRectMake(12, height * i + top, 64, height)];
        [btn setTitle:menu.DisplayName forState:UIControlStateApplication];
//        [btn setTintColor:[UIColor blackColor]];
        
        
        [btn addTarget:self action:@selector(showDemoTableData:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
    }
}

-(void) initButtons {
    if(btnDemo == nil)
    {
        btnDemo = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnDemo setBackgroundColor:[UIColor whiteColor]];
        [btnDemo setFrame:CGRectMake(12, 12, 64, 64)];
        [btnDemo setTitle:@"Demo" forState:UIControlStateApplication];
        
        [btnDemo addTarget:self action:@selector(showDemoTableData:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btnDemo];
    }
    
    [btnDemo setUserInteractionEnabled:YES];
    
    
}

-(void) initAlgorithmLayout {
    _leftSectionLayout.layer.shadowOffset = CGSizeMake(-1.0f, 1.0f);
    _leftSectionLayout.layer.shadowRadius = 5.0f;
    _leftSectionLayout.layer.shadowOpacity = 0.6f;
    _leftSectionLayout.layer.shadowPath = [[UIBezierPath bezierPathWithRect:_algorithmLayoutView.bounds] CGPath];
}

- (void) displayAlgorithmTableViewAs:(DisplayAs)displayway {
    CGFloat offY = displayway == Show ? 0 : -705;
    [UIView animateWithDuration:0.5f animations:^{
        //[_algorithmLayoutView setFrame:CGRectOffset(_algorithmLayoutView.frame, 0, offY)];
        [_algorithmLayoutView setFrame:CGRectMake(_algorithmLayoutView.frame.origin.x, offY, _algorithmLayoutView.frame.size.width, _algorithmLayoutView.frame.size.height)];
    } completion:^(BOOL finished) {
        if (displayway == Show) {
            isAlgorithmOpened = YES;
        } else {
            isAlgorithmOpened = NO;
        }
    }];
}

- (void) showAlgorithmData {
    [_algorithmTableView reloadData];
    [self displayAlgorithmTableViewAs:Show];
}

#pragma mark -- UI components events
- (IBAction)showOrHideAlgorithmView:(id)sender {
    if (isAlgorithmOpened == YES) {
        [self displayAlgorithmTableViewAs:Hide];
    }
    else {
        [self displayAlgorithmTableViewAs:Show];
    }
}

- (IBAction)showDemoTableData:(id)sender {
    
    if (algorithmListData == nil) {
        algorithmListData = [NSMutableArray array];
    } else {
        [algorithmListData removeAllObjects];
    }
    
    UIButton *btn = (UIButton *)sender;
    NSString *tagStr = [[NSNumber numberWithInt:btn.tag] stringValue];
    for (int i = 0; i < menus.count; i++) {
        if ([((MenuItem *)[menus objectAtIndex:i]).AlgorithmClassName isEqualToString:tagStr]) {
            currentMenuItem = [menus objectAtIndex:i];
            break;
        }
    }
    
    if (currentMenuItem != nil && currentMenuItem.Children != nil) {
        [algorithmListData addObjectsFromArray:currentMenuItem.Children];
    }
    
    //algorithmListData = @[@"Hanio", @"Pop Sorting", @"Item 3"];
    [self showAlgorithmData];
}


#pragma mark -- table delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.algorithmListData count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if(cell== nil){
        cell    = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    MenuItem *item = self.algorithmListData[indexPath.row];
    cell.textLabel.text = item.DisplayName;
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuItem *menu = [currentMenuItem.Children objectAtIndex:indexPath.row];
    id animationView = [[NSClassFromString(menu.IllustrateAnimationClassName) alloc] initWithFrame:CGRectMake(0, 0, _animationSectionLayout.frame.size.width, _animationSectionLayout.frame.size.height) dataLength:5];
    id codeView = [[NSClassFromString(menu.AlgorithmClassName) alloc] initWithFrame:CGRectMake(0, 0, _leftCodeLayout.frame.size.width, _leftCodeLayout.frame.size.height) animationView:animationView];
    [_leftCodeLayout addSubview:codeView];
    [_animationSectionLayout addSubview:animationView];
    
//    GraphAnimatonView *graph = [[GraphAnimatonView alloc] initWithFrame:CGRectMake(0, 0, _animationSectionLayout.frame.size.width, _animationSectionLayout.frame.size.height)];
//    [_animationSectionLayout addSubview:graph];
    
    [self displayAlgorithmTableViewAs:Hide];
}
@end
