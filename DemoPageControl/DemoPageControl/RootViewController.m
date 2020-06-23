//
//  RootViewController.m
//  DemoPageControl
//
//  Created by zhangshaoyu on 2017/7/19.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import "RootViewController.h"
//
#import "ViewController.h"
//
#import "TempViewController.h"
//
#import "CirclePointVC.h"
#import "NumberVC.h"
#import "SquareVC.h"
#import "ImageVC.h"
#import "LineVC.h"

@interface RootViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *array;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"pageControl";
    
    UIBarButtonItem *pageItem = [[UIBarButtonItem alloc] initWithTitle:@"page" style:UIBarButtonItemStyleDone target:self action:@selector(pageClick)];
    UIBarButtonItem *imageItem = [[UIBarButtonItem alloc] initWithTitle:@"image" style:UIBarButtonItemStyleDone target:self action:@selector(imageClick)];
    self.navigationItem.rightBarButtonItems = @[pageItem, imageItem];
    
    
    self.array = @[[CirclePointVC class], [NumberVC class], [SquareVC class], [ImageVC class], [LineVC class]];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.tableFooterView = [UIView new];
    tableView.delegate = self;
    tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
}

- (void)pageClick
{
    ViewController *nextVC = [ViewController new];
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (void)imageClick
{
    TempViewController *nextVC = [TempViewController new];
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    Class class = self.array[indexPath.row];
    NSString *title = NSStringFromClass(class);
    cell.textLabel.text = title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Class class = self.array[indexPath.row];
    
    UIViewController *nextVC = [class new];
    nextVC.title = NSStringFromClass(class);
    [self.navigationController pushViewController:nextVC animated:YES];
}

@end
