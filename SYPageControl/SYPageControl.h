//
//  SYPageControl.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 2017/7/18.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 页码对齐方式，默认SYPageControlAlignmentDefault
typedef NS_ENUM(NSInteger, SYPageControlAlignment)
{
    SYPageControlAlignmentDefault = 0,
    
    SYPageControlAlignmentLeft = 1,
    
    SYPageControlAlignmentRight = 2,
    
    SYPageControlAlignmentCenter = SYPageControlAlignmentDefault,
    
    SYPageControlAlignmentEqual = 4,
    
    /// SYPageControlTypeLine时有效
    SYPageControlAlignmentBottom = 5,
};

/// 页码样式，默认SYPageControlTypeSquare
typedef NS_ENUM(NSInteger, SYPageControlType)
{
    SYPageControlTypeSquare = 0,
    
    SYPageControlTypeCircle = 1,
    
    SYPageControlTypeLine = 2,
    
    SYPageControlTypeImage = 3,
};

@interface SYPageControl : UIView

- (instancetype)initWithFrame:(CGRect)frame;

/// 页码数量，默认0
@property (nonatomic, assign) NSInteger numberOfPages;
/// 当前页码，默认0，取值范围是0~numberOfPages-1
@property (nonatomic, assign) NSInteger currentPage;

/// 只有一页时是否隐藏页码，默认NO
@property (nonatomic, assign) BOOL hidesForSinglePage;

/// 页码非高亮颜色，默认灰色
@property(nonatomic, strong) UIColor *pageIndicatorColor;
/// 页码高亮时颜色，默认黑色
@property(nonatomic, strong) UIColor *currentPageIndicatorColor;

/// 页码非高亮图标，默认无
@property(nonatomic, strong) UIImage *pageIndicatorImage;
/// 页码高亮时图标，默认无
@property(nonatomic, strong) UIImage *currentPageIndicatorImage;

/// 页码样式，默认SYPageControlTypeSquare
@property(nonatomic, assign) SYPageControlType pageControlType;
/// 页码对齐方式，默认SYPageControlAlignmentDefault
@property(nonatomic, assign) SYPageControlAlignment pageControlAlignment;

/// 页码高亮时放大倍数，默认1.0，取值范围1.0~2.0
@property(nonatomic, assign) CGFloat transformScale;

/// 页码序号是否显示，默认NO
@property(nonatomic, assign) BOOL showPageNumber;
/// 页码序号非高亮时颜色，默认灰色
@property(nonatomic, strong) UIColor *pageNumberColor;
/// 页码序号高亮时颜色，默认黑色
@property(nonatomic, strong) UIColor *currentPageNumberColor;
/// 页码序号非高亮时字体大小，默认6.0
@property(nonatomic, strong) UIFont *pageNumberFont;
/// 页码序号高亮时字体大小，默认6.0
@property(nonatomic, strong) UIFont *currentPageNumberFont;

/// 页码间距，默认6.0
@property(nonatomic, assign) CGFloat pageMargin;
/// 页码大小-高，默认6.0
@property(nonatomic, assign) CGFloat pageSizeHeight;
/// 页码大小-宽，默认6.0
@property(nonatomic, assign) CGFloat pageSizeWidth;
/// 适配图标大小，默认NO
@property (nonatomic, assign) BOOL shouldAutoresizingImage;


#pragma mark - 链式属性

/// 页码数量
- (SYPageControl *(^)(NSInteger pages))pages;

/// 页码当前页
- (SYPageControl *(^)(NSInteger page))page;

/// 页码单个时是否隐藏
- (SYPageControl *(^)(BOOL hidden))hidesPageWhileSingle;

/// 页码非高亮颜色
- (SYPageControl *(^)(UIColor *color))pageColor;

/// 页码高亮颜色
- (SYPageControl *(^)(UIColor *color))currentPageColor;

/// 页码非高亮图标
- (SYPageControl *(^)(UIImage *image))pageImage;

/// 页码高亮图标
- (SYPageControl *(^)(UIImage *image))currentPageImage;

/// 页码显示样式
- (SYPageControl *(^)(SYPageControlType type))pageType;

/// 页码对齐方式
- (SYPageControl *(^)(SYPageControlAlignment alignment))pageAlignment;

/// 页码高亮时放大
- (SYPageControl *(^)(CGFloat scale))pageScale;

/// 页码序号是否显示
- (SYPageControl *(^)(BOOL show))showPageIndex;

/// 页码序号非高亮时颜色
- (SYPageControl *(^)(UIColor *color))pageIndexColor;

/// 页码序号高亮时颜色
- (SYPageControl *(^)(UIColor *color))currentPageIndexColor;

/// 页码序号非高亮时字体大小
- (SYPageControl *(^)(UIFont *font))pageIndexFont;

/// 页码高亮时字体大小
- (SYPageControl *(^)(UIFont *font))currentPageIndexFont;

/// 页码间距
- (SYPageControl *(^)(CGFloat margin))pageMarginX;

/// 页码高
- (SYPageControl *(^)(CGFloat height))pageHeight;

/// 页码宽
- (SYPageControl *(^)(CGFloat width))pageWidth;

/// 页码是否适配图标大小
- (SYPageControl *(^)(BOOL autoresizing))autoresizingImage;


@end
