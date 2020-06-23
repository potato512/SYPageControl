//
//  ViewController.m
//  DemoPageControl
//
//  Created by zhangshaoyu on 2017/7/18.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import "ViewController.h"
#import "SYPageControl.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"pageControl";
    
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
    SYPageControl *pageControl = (SYPageControl *)[self.view viewWithTag:10000];
    pageControl.pages(11).page(10).pageScale(1.2).showPageIndex(YES).pageIndexColor([UIColor lightGrayColor]).currentPageIndexColor([UIColor redColor]).pageAlignment(SYPageControlAlignmentEqual).pageType(SYPageControlTypeImage).pageImage([UIImage imageNamed:@"b"]).currentPageImage([UIImage imageNamed:@"b-h"]);
}

- (void)setUI
{
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(10.0, 10.0, (self.view.frame.size.width - 10.0 * 2), 30.0)];
    [self.view addSubview:pageControl];
    pageControl.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.2];
    pageControl.numberOfPages = 10;
    pageControl.currentPage = 2;
    pageControl.pageIndicatorTintColor = [UIColor greenColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    
    UIView *currentView = pageControl;
    
    SYPageControl *pageControl2 = [[SYPageControl alloc] initWithFrame:CGRectMake(10.0, (currentView.frame.origin.y + currentView.frame.size.height + 10.0), (self.view.frame.size.width - 10.0 * 2), 30.0)];
    [self.view addSubview:pageControl2];
    pageControl2.tag = 10000;
    pageControl2.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.1];
    pageControl2.numberOfPages = 10;
    pageControl2.currentPage = 2;
    pageControl2.pageControlType = SYPageControlTypeCircle;
    pageControl2.pageSizeWidth = 15.0;
    pageControl2.pageSizeHeight = 15.0;
    pageControl2.pageIndicatorColor = [UIColor yellowColor];
    pageControl2.currentPageIndicatorColor = [UIColor redColor];
    pageControl2.transformScale = 1.5;
    pageControl2.showPageNumber = YES;
    pageControl2.pageNumberColor = [UIColor blackColor];
    pageControl2.pageNumberFont = [UIFont systemFontOfSize:8.0];
    pageControl2.currentPageNumberColor = [UIColor yellowColor];
    pageControl2.currentPageNumberFont = [UIFont boldSystemFontOfSize:9.0];
    
    currentView = pageControl2;

    SYPageControl *pageControl3 = [[SYPageControl alloc] initWithFrame:CGRectMake(10.0, (currentView.frame.origin.y + currentView.frame.size.height + 10.0), (self.view.frame.size.width - 10.0 * 2), 5.0)];
    [self.view addSubview:pageControl3];
    pageControl3.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.1];
    pageControl3.numberOfPages = 10;
    pageControl3.currentPage = 2;
    pageControl3.pageControlType = SYPageControlTypeLine;
    pageControl3.pageMargin = 3.0;
    pageControl3.pageIndicatorColor = [UIColor orangeColor];
    pageControl3.currentPageIndicatorColor = [UIColor blackColor];
    
    currentView = pageControl3;

    SYPageControl *pageControl4 = [[SYPageControl alloc] initWithFrame:CGRectMake(10.0, (currentView.frame.origin.y + currentView.frame.size.height + 10.0), (self.view.frame.size.width - 10.0 * 2), 30.0)];
    [self.view addSubview:pageControl4];
    pageControl4.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    pageControl4.numberOfPages = 10;
    pageControl4.currentPage = 2;
    pageControl4.pageControlType = SYPageControlTypeImage;
    pageControl4.pageMargin = 5.0;
    pageControl4.pageSizeWidth = 20.0;
    pageControl4.pageSizeHeight = 20.0;
    pageControl4.shouldAutoresizingImage = YES;
    pageControl4.pageIndicatorImage = [UIImage imageNamed:@"a"];
    pageControl4.currentPageIndicatorImage = [UIImage imageNamed:@"a-h"];
    pageControl4.transformScale = 1.2;

    currentView = pageControl4;
    
    SYPageControl *pageControl5 = [[SYPageControl alloc] initWithFrame:CGRectMake(10.0, (currentView.frame.origin.y + currentView.frame.size.height + 10.0), (self.view.frame.size.width - 10.0 * 2), 30.0)];
    [self.view addSubview:pageControl5];
    pageControl5.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.1];
    pageControl5.numberOfPages = 10;
    pageControl5.currentPage = 2;
    pageControl5.pageIndicatorColor = [UIColor greenColor];
    pageControl5.currentPageIndicatorColor = [UIColor purpleColor];
    pageControl5.pageSizeWidth = 10.0;
    pageControl5.pageSizeHeight = 10.0;
    pageControl5.transformScale = 1.5;
    
    currentView = pageControl5;
    
    SYPageControl *pageControl6 = [[SYPageControl alloc] initWithFrame:CGRectMake(10.0, (currentView.frame.origin.y + currentView.frame.size.height + 10.0), (self.view.frame.size.width - 10.0 * 2), 30.0)];
    [self.view addSubview:pageControl6];
    pageControl6.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    pageControl6.numberOfPages = 10;
    pageControl6.currentPage = 2;
    pageControl6.pageControlType = SYPageControlTypeImage;
    pageControl6.pageIndicatorImage = [UIImage imageNamed:@"pageNumber_normal"];
    pageControl6.currentPageIndicatorImage = [UIImage imageNamed:@"pageNumber_selected"];
    pageControl6.transformScale = 2.0;
    pageControl6.pageSizeWidth = pageControl6.pageSizeHeight = 12.0;
    pageControl6.showPageNumber = YES;
    
    currentView = pageControl6;
    
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
    
    currentView = pageControl10;
    
    SYPageControl *pageControl11 = [[SYPageControl alloc] initWithFrame:CGRectMake(10.0, (currentView.frame.origin.y + currentView.frame.size.height + 10.0), (self.view.frame.size.width - 10.0 * 2), 30.0)];
    [self.view addSubview:pageControl11];
    pageControl11.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.1];
    pageControl11.numberOfPages = 1;
    pageControl11.currentPage = 0;
    pageControl11.hidesForSinglePage = YES;
    
    currentView = pageControl11;
    
    SYPageControl *pageControl12 = [[SYPageControl alloc] initWithFrame:CGRectMake(10.0, (currentView.frame.origin.y + currentView.frame.size.height + 10.0), (self.view.frame.size.width - 10.0 * 2), 30.0)];
    [self.view addSubview:pageControl12];
    pageControl12.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.1];
    pageControl12.pages(15).page(10).pageScale(1.5).showPageIndex(YES).pageIndexColor([UIColor blackColor]).currentPageIndexColor([UIColor whiteColor]).pageAlignment(SYPageControlAlignmentEqual).pageType(SYPageControlTypeSquare).pageColor([UIColor whiteColor]).currentPageColor([UIColor blackColor]).pageHeight(15.0).pageWidth(30.0);
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
