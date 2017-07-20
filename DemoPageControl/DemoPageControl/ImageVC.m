//
//  ImageVC.m
//  DemoPageControl
//
//  Created by zhangshaoyu on 2017/7/20.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import "ImageVC.h"
#import "ImageView.h"

@interface ImageVC ()

@property (nonatomic, strong) ImageView *imageView;
@property (nonatomic, strong) UIView *pageView;

@end

@implementation ImageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"图片浏览";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"reload" style:UIBarButtonItemStyleDone target:self action:@selector(reloadClick)];
    
    [self setUI];
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

- (void)dealloc
{
    NSLog(@"%@ 被释放了~", [self class]);
}

- (void)reloadClick
{
    self.imageView.pageControl.pageScale(1.2).showPageIndex(YES).pageIndexColor([UIColor lightGrayColor]).currentPageIndexColor([UIColor redColor]).pageAlignment(SYPageControlAlignmentCenter).pageType(SYPageControlTypeImage).pageImage([UIImage imageNamed:@"b"]).currentPageImage([UIImage imageNamed:@"b-h"]).pageWidth(20.0).pageHeight(20.0);
}

- (void)setUI
{
    self.imageView = [[ImageView alloc] initWithFrame:CGRectMake(10.0, 10.0, (self.view.frame.size.width - 10.0 * 2), 200.0)];
    [self.view addSubview:self.imageView];
    self.imageView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.2];
    self.imageView.images = @[@"01", @"02", @"03", @"04", @"05", @"06"];
    
    
    self.pageView = [[UIView alloc] initWithFrame:CGRectMake(10.0, 230.0, 200.0, 30.0)];
    [self.view addSubview:self.pageView];
    self.pageView.backgroundColor = [UIColor greenColor];
    SYPageControl *pageControl = [[SYPageControl alloc] initWithFrame:self.pageView.bounds];
    [self.pageView addSubview:pageControl];
//    pageControl.backgroundColor = [UIColor clearColor];
    pageControl.numberOfPages = 10;
}

@end
