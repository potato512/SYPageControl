//
//  RootViewController.m
//  DemoPageControl
//
//  Created by zhangshaoyu on 2017/7/19.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import "RootViewController.h"
#import "ViewController.h"
#import "ImageVC.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"pageControl";
    
    UIBarButtonItem *pageItem = [[UIBarButtonItem alloc] initWithTitle:@"page" style:UIBarButtonItemStyleDone target:self action:@selector(pageClick)];
    UIBarButtonItem *imageItem = [[UIBarButtonItem alloc] initWithTitle:@"image" style:UIBarButtonItemStyleDone target:self action:@selector(imageClick)];
    self.navigationItem.rightBarButtonItems = @[pageItem, imageItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pageClick
{
    ViewController *nextVC = [ViewController new];
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (void)imageClick
{
    ImageVC *nextVC = [ImageVC new];
    [self.navigationController pushViewController:nextVC animated:YES];
}

@end
