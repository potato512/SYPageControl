//
//  RootViewController.m
//  DemoPageControl
//
//  Created by zhangshaoyu on 2017/7/19.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import "RootViewController.h"
#import "ViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"pageControl";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"click" style:UIBarButtonItemStyleDone target:self action:@selector(buttonClick)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonClick
{
    ViewController *nextVC = [ViewController new];
    [self.navigationController pushViewController:nextVC animated:YES];
}

@end
