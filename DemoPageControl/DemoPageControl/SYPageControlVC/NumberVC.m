//
//  NumberVC.m
//  DemoPageControl
//
//  Created by zhangshaoyu on 2017/8/30.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import "NumberVC.h"
#import "SYPageControl.h"

@interface NumberVC ()

@end

@implementation NumberVC

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
    pageControl.tag = 10000;
    pageControl.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.1];
    pageControl.numberOfPages = 10;
    pageControl.currentPage = 2;
    pageControl.pageControlType = SYPageControlTypeCircle;
    pageControl.pageSizeWidth = 15.0;
    pageControl.pageSizeHeight = 15.0;
    pageControl.pageIndicatorColor = [UIColor yellowColor];
    pageControl.currentPageIndicatorColor = [UIColor redColor];
    pageControl.transformScale = 1.5;
    pageControl.showPageNumber = YES;
    pageControl.pageNumberColor = [UIColor blackColor];
    pageControl.pageNumberFont = [UIFont systemFontOfSize:8.0];
    pageControl.currentPageNumberColor = [UIColor yellowColor];
    pageControl.currentPageNumberFont = [UIFont boldSystemFontOfSize:9.0];
    
    UIView *currentView = pageControl;
    
    SYPageControl *pageControl6 = [[SYPageControl alloc] initWithFrame:CGRectMake(10.0, (currentView.frame.origin.y + currentView.frame.size.height + 10.0), (self.view.frame.size.width - 10.0 * 2), 30.0)];
    [self.view addSubview:pageControl6];
    pageControl6.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    pageControl6.numberOfPages = 10;
    pageControl6.currentPage = 2;
    pageControl6.pageControlType = SYPageControlTypeImage;
    pageControl6.pageControlAlignment = SYPageControlAlignmentEqual;
    pageControl6.pageSizeWidth = 15.0;
    pageControl6.pageSizeHeight = 15.0;
    pageControl6.pageIndicatorImage = [UIImage imageNamed:@"pageNumber_normal"];
    pageControl6.currentPageIndicatorImage = [UIImage imageNamed:@"pageNumber_selected"];
//    pageControl6.transformScale = 2.0;
    pageControl6.showPageNumber = YES;
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
