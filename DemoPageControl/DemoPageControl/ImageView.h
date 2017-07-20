//
//  ImageView.h
//  DemoPageControl
//
//  Created by zhangshaoyu on 2017/7/20.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYPageControl.h"

@interface ImageView : UIView

@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) SYPageControl *pageControl;

@end
