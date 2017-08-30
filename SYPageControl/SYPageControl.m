//
//  SYPageControl.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 2017/7/18.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import "SYPageControl.h"

@interface SYPageControl ()

@property (nonatomic, strong) NSMutableArray *pageNormals;
@property (nonatomic, strong) NSMutableArray *pageSelecteds;

@property (nonatomic, strong) NSMutableArray *labelNormals;
@property (nonatomic, strong) NSMutableArray *labelSelecteds;

@end

@implementation SYPageControl

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        
        self.clipsToBounds = YES;
        self.layer.masksToBounds = YES;
        
        _numberOfPages = 0;
        _currentPage = 0;
        
        _hidesForSinglePage = NO;
        
        _pageIndicatorColor = [UIColor lightGrayColor];
        _currentPageIndicatorColor = [UIColor blackColor];
        
        _pageControlType = SYPageControlTypeSquare;
        _pageControlAlignment = SYPageControlAlignmentDefault;
        
        _transformScale = 1.0;
        
        _showPageNumber = NO;
        _pageNumberColor = [UIColor lightGrayColor];
        _currentPageNumberColor = [UIColor blackColor];
        _pageNumberFont = [UIFont systemFontOfSize:6.0];
        _currentPageNumberFont = [UIFont systemFontOfSize:6.0];
        
        _pageMargin = 6.0;
        _pageSizeHeight = 6.0;
        _pageSizeWidth = 6.0;
        _shouldAutoresizingImage = NO;
        
//        [self setNeedsDisplay];
        [self setNeedsLayout];
    }
    
    return self;
}

// setNeedsDisplay
//- (void)drawRect:(CGRect)rect
//{
//    [self reloadUIView];
//}

// setNeedsLayout
- (void)layoutSubviews
{
    [self reloadUIView];
}

// 初始化页签视图
- (void)initializeUIView
{
    if ((self.pageNormals.count == 0 && 0 < _numberOfPages) || self.pageNormals.count != _numberOfPages)
    {
        // 清空数组
        [self.pageNormals removeAllObjects];
        [self.pageSelecteds removeAllObjects];
        [self.labelNormals removeAllObjects];
        [self.labelSelecteds removeAllObjects];
        // 清空子视图
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[UIImageView class]] || [obj isKindOfClass:[UILabel class]])
            {
                [obj removeFromSuperview];
            }
        }];
        
        for (int i = 0; i < _numberOfPages; i++)
        {
            UIImageView *imageViewNormal = [[UIImageView alloc] init];
            [self addSubview:imageViewNormal];
            imageViewNormal.clipsToBounds = YES;
            imageViewNormal.layer.masksToBounds = YES;
            
            [self.pageNormals addObject:imageViewNormal];
            
            UIImageView *imageViewSelected = [[UIImageView alloc] init];
            [self addSubview:imageViewSelected];
            imageViewSelected.clipsToBounds = YES;
            imageViewSelected.layer.masksToBounds = YES;
            imageViewSelected.hidden = YES;
            
            [self.pageSelecteds addObject:imageViewSelected];
            
            
            UILabel *labelNormal = [UILabel new];
            [imageViewNormal addSubview:labelNormal];
            labelNormal.backgroundColor = [UIColor clearColor];
            labelNormal.textAlignment = NSTextAlignmentCenter;
            labelNormal.adjustsFontSizeToFitWidth = YES;
            labelNormal.hidden = YES;
            
            [self.labelNormals addObject:labelNormal];
            
            UILabel *labelSelected = [UILabel new];
            [imageViewSelected addSubview:labelSelected];
            labelSelected.backgroundColor = [UIColor clearColor];
            labelSelected.textAlignment = NSTextAlignmentCenter;
            labelSelected.adjustsFontSizeToFitWidth = YES;
            labelSelected.hidden = YES;
            
            [self.labelSelecteds addObject:labelSelected];
        }
    }
}

// 设置页签视图属性
- (void)resetUIView
{
    __block CGFloat originX = (self.frame.size.width - _pageMargin * (_numberOfPages - 1) - self.pageSizeWidth * _numberOfPages) / 2;
    
    if (_pageControlType == SYPageControlTypeLine)
    {
        // 线条样式时，高度最大为2.0
        self.pageSizeHeight = (2.0 <= self.pageSizeHeight ? 2.0 : self.pageSizeHeight);
    }
    CGFloat originY = (self.frame.size.height - self.pageSizeHeight) / 2;
    
    if (_pageControlAlignment == SYPageControlAlignmentLeft)
    {
        originX = _pageMargin;
    }
    else if (_pageControlAlignment == SYPageControlAlignmentRight)
    {
        originX = self.frame.size.width - (self.pageSizeWidth * _numberOfPages + _pageMargin * _numberOfPages);
    }
    else if (_pageControlAlignment == SYPageControlAlignmentEqual)
    {
        _pageMargin = (self.frame.size.width - self.pageSizeWidth * _numberOfPages) / (_numberOfPages + 1);
        originX = _pageMargin;
    }
    else if (_pageControlAlignment == SYPageControlAlignmentBottom)
    {
        if (_pageControlType == SYPageControlTypeLine)
        {
            originY = (self.frame.size.height - self.pageSizeHeight);
        }
    }
    
    [self.pageNormals enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIImageView *imageViewNormal = (UIImageView *)obj;
        imageViewNormal.backgroundColor = _pageIndicatorColor;
        imageViewNormal.hidden = NO;
        
        UIImageView *imageViewSelected = self.pageSelecteds[idx];
        imageViewSelected.backgroundColor = _currentPageIndicatorColor;
        imageViewSelected.hidden = YES;
        
        // 页码位置大小
        imageViewNormal.frame = CGRectMake(originX, originY, self.pageSizeWidth, self.pageSizeHeight);
        imageViewSelected.frame = imageViewNormal.frame;
        originX += (self.pageSizeWidth + _pageMargin);
        
        // 页码显示样式
        if (_pageControlType == SYPageControlTypeCircle)
        {
            imageViewNormal.layer.cornerRadius = self.pageSizeHeight / 2;
            imageViewSelected.layer.cornerRadius = self.pageSizeHeight / 2;
        }
        else if (_pageControlType == SYPageControlTypeLine)
        {
            // 线条样式时，不显示序号
            _showPageNumber = NO;
        }
        else if (_pageControlType == SYPageControlTypeImage)
        {
            imageViewNormal.backgroundColor = [UIColor clearColor];
            imageViewSelected.backgroundColor = [UIColor clearColor];
            
            imageViewNormal.image = _pageIndicatorImage;
            imageViewSelected.image = _currentPageIndicatorImage;
        }
        
        // 高亮页码显示，非高亮隐藏
        if (idx == _currentPage)
        {
            imageViewNormal.hidden = YES;
            imageViewSelected.hidden = NO;
        }
        
        // 显示序号
        if (_showPageNumber)
        {
            UILabel *labelNormal = self.labelNormals[idx];;
            labelNormal.hidden = NO;
            labelNormal.textColor = _pageNumberColor;
            labelNormal.font = _pageNumberFont;
            
            UILabel *labelSelected = self.labelSelecteds[idx];
            labelSelected.hidden = YES;
            labelSelected.textColor = _currentPageNumberColor;
            labelSelected.font = _currentPageNumberFont;
            
            labelNormal.text = [NSString stringWithFormat:@"%@", @(idx + 1)];
            labelSelected.text = [NSString stringWithFormat:@"%@", @(idx + 1)];
            
            labelNormal.frame = imageViewNormal.bounds;
            labelSelected.frame = imageViewSelected.bounds;
            
            if (idx == _currentPage)
            {
                labelNormal.hidden = YES;
                labelSelected.hidden = NO;
            }
        }
        
        // 高亮放大显示
        imageViewSelected.transform = CGAffineTransformScale(imageViewSelected.transform, _transformScale, _transformScale);
    }];
}

// 重置视图属性
- (void)reloadUIView
{
    if (_hidesForSinglePage && 1 == _numberOfPages)
    {
        // 单页时，隐藏
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.hidden = YES;
        }];
        return;
    }
    
    // 初始化页签视图
    [self initializeUIView];
    
    // 设置页签视图属性
    [self resetUIView];
}

#pragma mark - getter

- (NSMutableArray *)pageNormals
{
    if (_pageNormals == nil)
    {
        _pageNormals = [NSMutableArray array];
    }
    return _pageNormals;
}

- (NSMutableArray *)pageSelecteds
{
    if (_pageSelecteds == nil)
    {
        _pageSelecteds = [NSMutableArray array];
    }
    return _pageSelecteds;
}

- (NSMutableArray *)labelNormals
{
    if (_labelNormals == nil)
    {
        _labelNormals = [NSMutableArray array];
    }
    return _labelNormals;
}

- (NSMutableArray *)labelSelecteds
{
    if (_labelSelecteds == nil)
    {
        _labelSelecteds = [NSMutableArray array];
    }
    return _labelSelecteds;
}



- (CGFloat)pageSizeWidth
{
    if (_pageControlType == SYPageControlTypeLine)
    {
        // 线条形
        if (_pageSizeWidth < _pageSizeHeight)
        {
            _pageSizeWidth = (self.frame.size.width - _pageMargin * (_numberOfPages - 1)) / _numberOfPages;
        }
    }
    else if (_pageControlType == SYPageControlTypeImage && _shouldAutoresizingImage)
    {
        // 图片形
        if (_pageSizeWidth < _pageIndicatorImage.size.width)
        {
            _pageSizeWidth = _pageIndicatorImage.size.width;
        }
    }
    
    if (self.frame.size.width < (_pageMargin * (_numberOfPages - 1) + _pageSizeWidth * _numberOfPages))
    {
        // 页签宽和超过父视图时重置
        _pageSizeWidth = (self.frame.size.width - _pageMargin * (_numberOfPages - 1)) / _numberOfPages;
    }

    return _pageSizeWidth;
}

- (CGFloat)pageSizeHeight
{
    if (_pageControlType == SYPageControlTypeImage && _shouldAutoresizingImage)
    {
        // 图片形
        if (_pageSizeHeight < _pageIndicatorImage.size.height)
        {
            _pageSizeHeight = _pageIndicatorImage.size.height;
        }
    }
    
    if (self.frame.size.height < _pageSizeHeight)
    {
        // 页签高超过父视图时重置
        _pageSizeHeight = self.frame.size.height;
    }
    
    return _pageSizeHeight;
}

#pragma mark - setter

- (void)setNumberOfPages:(NSInteger)numberOfPages
{
    _numberOfPages = numberOfPages;
    [self setNeedsLayout];
}

- (void)setCurrentPage:(NSInteger)currentPage
{
    _currentPage = currentPage;
    if (_currentPage <= 0)
    {
        _currentPage = 0;
    }
    else if (_currentPage >= _numberOfPages)
    {
        _currentPage = _numberOfPages - 1;
    }
    
    [self setNeedsLayout];

    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.transform = CGAffineTransformIdentity;
    }];
}

- (void)setHidesForSinglePage:(BOOL)hidesForSinglePage
{
    _hidesForSinglePage = hidesForSinglePage;
    [self setNeedsLayout];
}

- (void)setPageControlType:(SYPageControlType)pageControlType
{
    _pageControlType = pageControlType;
    [self setNeedsLayout];
}

- (void)setPageControlAlignment:(SYPageControlAlignment)pageControlAlignment
{
    _pageControlAlignment = pageControlAlignment;
    [self setNeedsLayout];
}

- (void)setTransformScale:(CGFloat)transformScale
{
    _transformScale = transformScale;
    if (_transformScale < 1.0)
    {
        _transformScale = 1.0;
    }
    else if (_transformScale > 2.0)
    {
        _transformScale = 2.0;
    }
    [self setNeedsLayout];
}

- (void)setShowPageNumber:(BOOL)showPageNumber
{
    _showPageNumber = showPageNumber;
    [self setNeedsLayout];
}

- (void)setPageNumberColor:(UIColor *)pageNumberColor
{
    _pageNumberColor = pageNumberColor;
    [self setNeedsLayout];
}

- (void)setPageNumberFont:(UIFont *)pageNumberFont
{
    _pageNumberFont = pageNumberFont;
    [self setNeedsLayout];
}

- (void)setCurrentPageNumberColor:(UIColor *)currentPageNumberColor
{
    _currentPageNumberColor = currentPageNumberColor;
    [self setNeedsLayout];
}

- (void)setCurrentPageNumberFont:(UIFont *)currentPageNumberFont
{
    _currentPageNumberFont = currentPageNumberFont;
    [self setNeedsLayout];
}

- (void)setPageIndicatorImage:(UIImage *)pageIndicatorImage
{
    _pageIndicatorImage = pageIndicatorImage;
    [self setNeedsLayout];
}

- (void)setCurrentPageIndicatorImage:(UIImage *)currentPageIndicatorImage
{
    _currentPageIndicatorImage = currentPageIndicatorImage;
    [self setNeedsLayout];
}

#pragma mark - 链式属性

/// 页码数量
- (SYPageControl *(^)(NSInteger pages))pages
{
    return ^(NSInteger pages) {
        self.numberOfPages = pages;
        return self;
    };
}

/// 页码当前页
- (SYPageControl *(^)(NSInteger page))page
{
    return ^(NSInteger page) {
        self.currentPage = page;
        return self;
    };
}

/// 页码单个时是否隐藏
- (SYPageControl *(^)(BOOL hidden))hidesPageWhileSingle
{
    return ^(BOOL hidden) {
        self.hidesForSinglePage = hidden;
        return self;
    };
}

/// 页码非高亮颜色
- (SYPageControl *(^)(UIColor *color))pageColor
{
    return ^(UIColor *color) {
        self.pageIndicatorColor = color;
        return self;
    };
}

/// 页码高亮颜色
- (SYPageControl *(^)(UIColor *color))currentPageColor
{
    return ^(UIColor *color) {
        self.currentPageIndicatorColor = color;
        return self;
    };
}

/// 页码非高亮图标
- (SYPageControl *(^)(UIImage *image))pageImage
{
    return ^(UIImage *image) {
        self.pageIndicatorImage = image;
        return self;
    };
}

/// 页码高亮图标
- (SYPageControl *(^)(UIImage *image))currentPageImage
{
    return ^(UIImage *image) {
        self.currentPageIndicatorImage = image;
        return self;
    };
}

/// 页码显示样式
- (SYPageControl *(^)(SYPageControlType type))pageType
{
    return ^(SYPageControlType type) {
        self.pageControlType = type;
        return self;
    };
}

/// 页码对齐方式
- (SYPageControl *(^)(SYPageControlAlignment alignment))pageAlignment
{
    return ^(SYPageControlAlignment alignment) {
        self.pageControlAlignment = alignment;
        return self;
    };
}

/// 页码高亮时放大
- (SYPageControl *(^)(CGFloat scale))pageScale
{
    return ^(CGFloat scale) {
        self.transformScale = scale;
        return self;
    };
}

/// 页码序号是否显示
- (SYPageControl *(^)(BOOL show))showPageIndex
{
    return ^(BOOL show) {
        self.showPageNumber = show;
        return self;
    };
}

/// 页码序号非高亮时颜色
- (SYPageControl *(^)(UIColor *color))pageIndexColor
{
    return ^(UIColor *color) {
        self.pageNumberColor = color;
        return self;
    };
}

/// 页码序号高亮时颜色
- (SYPageControl *(^)(UIColor *color))currentPageIndexColor
{
    return ^(UIColor *color) {
        self.currentPageNumberColor = color;
        return self;
    };
}

/// 页码序号非高亮时字体大小
- (SYPageControl *(^)(UIFont *font))pageIndexFont
{
    return ^(UIFont *font) {
        self.pageNumberFont = font;
        return self;
    };
}

/// 页码高亮时字体大小
- (SYPageControl *(^)(UIFont *font))currentPageIndexFont
{
    return ^(UIFont *font) {
        self.currentPageNumberFont = font;
        return self;
    };
}

/// 页码间距
- (SYPageControl *(^)(CGFloat margin))pageMarginX
{
    return ^(CGFloat margin) {
        self.pageMargin = margin;
        return self;
    };
}

/// 页码高
- (SYPageControl *(^)(CGFloat height))pageHeight
{
    return ^(CGFloat height) {
        self.pageSizeHeight = height;
        return self;
    };
}

/// 页码宽
- (SYPageControl *(^)(CGFloat width))pageWidth
{
    return ^(CGFloat width) {
        self.pageSizeWidth = width;
        return self;
    };
}

/// 页码是否适配图标大小
- (SYPageControl *(^)(BOOL autoresizing))autoresizingImage
{
    return ^(BOOL autoresizing) {
        self.shouldAutoresizingImage = autoresizing;
        return self;
    };
}

@end
