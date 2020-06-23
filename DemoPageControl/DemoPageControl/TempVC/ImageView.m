//
//  ImageView.m
//  DemoPageControl
//
//  Created by zhangshaoyu on 2017/7/20.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import "ImageView.h"

@interface ImageView () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollview;

@end

@implementation ImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        self.clipsToBounds = YES;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        self.scrollview.frame = self.bounds;
        [self addSubview:self.scrollview];
        
        [self addSubview:self.pageControl];
    }
    return self;
}

- (UIScrollView *)scrollview
{
    if (_scrollview == nil)
    {
        _scrollview = [[UIScrollView alloc] init];
        _scrollview.backgroundColor = [UIColor clearColor];
        _scrollview.pagingEnabled = YES;
        _scrollview.showsHorizontalScrollIndicator = NO;
        _scrollview.delegate = self;
    }
    return _scrollview;
}

- (SYPageControl *)pageControl
{
    if (_pageControl == nil)
    {
        _pageControl = [[SYPageControl alloc] initWithFrame:CGRectMake(10.0, (self.frame.size.height - 10.0 - 30.0), (self.frame.size.width - 10.0 * 2), 30.0)];
        _pageControl.backgroundColor = [UIColor clearColor];
        _pageControl.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    }
    return _pageControl;
}

- (void)setImages:(NSArray *)images
{
    _images = images;
    for (int i = 0; i < _images.count; i++)
    {
        UIImageView *imageview = [[UIImageView alloc] init];
        [self.scrollview addSubview:imageview];
        imageview.backgroundColor = [UIColor clearColor];
        imageview.contentMode = UIViewContentModeScaleAspectFit;
        imageview.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        NSString *name = _images[i];
        imageview.image = [UIImage imageNamed:name];
        
        imageview.frame = CGRectMake((i * self.frame.size.width), 0.0, self.frame.size.width, self.frame.size.height);
    }
    self.scrollview.contentSize = CGSizeMake((self.frame.size.width * _images.count), self.frame.size.height);
    self.pageControl.numberOfPages = _images.count;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x / scrollView.frame.size.width;
    self.pageControl.currentPage = page;
}

@end
