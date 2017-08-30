//
//  SquareVC.m
//  DemoPageControl
//
//  Created by zhangshaoyu on 2017/8/30.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import "SquareVC.h"
#import "SYPageControl.h"

@interface SquareVC ()

@end

@implementation SquareVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

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
//    SYPageControl *pageControl = (SYPageControl *)[self.view viewWithTag:10000];
//    pageControl.pages(11).page(10).pageScale(1.2).showPageIndex(YES).pageIndexColor([UIColor lightGrayColor]).currentPageIndexColor([UIColor redColor]).pageAlignment(SYPageControlAlignmentEqual).pageType(SYPageControlTypeImage).pageImage([UIImage imageNamed:@"b"]).currentPageImage([UIImage imageNamed:@"b-h"]);
}

- (void)setUI
{
    SYPageControl *pageControl = [[SYPageControl alloc] initWithFrame:CGRectMake(10.0, 10.0, (self.view.frame.size.width - 10.0 * 2), 30.0)];
    [self.view addSubview:pageControl];
    pageControl.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.1];
    pageControl.numberOfPages = 10;
    pageControl.currentPage = 2;
    pageControl.pageIndicatorColor = [UIColor greenColor];
    pageControl.currentPageIndicatorColor = [UIColor purpleColor];
    pageControl.pageSizeWidth = 10.0;
    pageControl.pageSizeHeight = 10.0;
    pageControl.transformScale = 1.5;
    
    UIView *currentView = pageControl;
    
    SYPageControl *pageControl7 = [[SYPageControl alloc] initWithFrame:CGRectMake(10.0, (currentView.frame.origin.y + currentView.frame.size.height + 10.0), (self.view.frame.size.width - 10.0 * 2), 30.0)];
    [self.view addSubview:pageControl7];
    pageControl7.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.1];
    pageControl7.numberOfPages = 10;
    pageControl7.currentPage = 2;
    pageControl7.pageControlAlignment = SYPageControlAlignmentLeft;
    
    currentView = pageControl7;
    
    SYPageControl *pageControl8 = [[SYPageControl alloc] initWithFrame:CGRectMake(10.0, (currentView.frame.origin.y + currentView.frame.size.height + 10.0), (self.view.frame.size.width - 10.0 * 2), 30.0)];
    [self.view addSubview:pageControl8];
    pageControl8.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.1];
    pageControl8.numberOfPages = 10;
    pageControl8.currentPage = 2;
    pageControl8.currentPageIndicatorColor = [UIColor cyanColor];
    pageControl8.pageControlAlignment = SYPageControlAlignmentEqual;
    
    currentView = pageControl8;
    
    SYPageControl *pageControl9 = [[SYPageControl alloc] initWithFrame:CGRectMake(10.0, (currentView.frame.origin.y + currentView.frame.size.height + 10.0), (self.view.frame.size.width - 10.0 * 2), 30.0)];
    [self.view addSubview:pageControl9];
    pageControl9.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.1];
    pageControl9.numberOfPages = 10;
    pageControl9.currentPage = 2;
    pageControl9.pageIndicatorColor = [UIColor greenColor];
    pageControl9.currentPageIndicatorColor = [UIColor purpleColor];
    pageControl9.pageSizeWidth = 10.0;
    pageControl9.pageSizeHeight = 10.0;
    pageControl9.transformScale = 1.5;
    pageControl9.pageControlAlignment = SYPageControlAlignmentRight;
    
    currentView = pageControl9;
    
    SYPageControl *pageControl10 = [[SYPageControl alloc] initWithFrame:CGRectMake(10.0, (currentView.frame.origin.y + currentView.frame.size.height + 10.0), (self.view.frame.size.width - 10.0 * 2), 30.0)];
    [self.view addSubview:pageControl10];
    pageControl10.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.1];
    pageControl10.numberOfPages = 10;
    pageControl10.currentPage = 2;
    pageControl10.pageIndicatorColor = [UIColor orangeColor];
    pageControl10.currentPageIndicatorColor = [UIColor blueColor];
    pageControl10.pageControlAlignment = SYPageControlAlignmentDefault;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    UIView *view = touch.view;
    CGPoint point = [touch locationInView:view];
    if (point.x < view.frame.size.width / 2)
    {
        // --
        [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[UIPageControl class]])
            {
                UIPageControl *pageControl = (UIPageControl *)obj;
                pageControl.currentPage--;
            }
            else if ([obj isKindOfClass:[SYPageControl class]])
            {
                SYPageControl *pageControl = (SYPageControl *)obj;
                pageControl.currentPage--;
            }
        }];
    }
    else if (point.x >= view.frame.size.width / 2)
    {
        // ++
        [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[UIPageControl class]])
            {
                UIPageControl *pageControl = (UIPageControl *)obj;
                pageControl.currentPage++;
            }
            else if ([obj isKindOfClass:[SYPageControl class]])
            {
                SYPageControl *pageControl = (SYPageControl *)obj;
                pageControl.currentPage++;
            }
        }];
    }
}


@end
