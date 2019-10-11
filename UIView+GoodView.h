//
//  GoodView.h
//  PrecisionExperiment
//
//  Created by goodsrc_jzw on 16/3/17.
//  Copyright © 2016年 Mask. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UIView (GoodView)

@property (nonatomic,assign) CGFloat left;
@property (nonatomic,assign) CGFloat top;
@property (nonatomic,assign) CGFloat right;
@property (nonatomic,assign) CGFloat bottom;
@property (nonatomic,assign) CGFloat width;
@property (nonatomic,assign) CGFloat height;
@property (nonatomic,assign) CGFloat centerX;
@property (nonatomic,assign) CGFloat centerY;

/**
 添加阴影
 
 @param offset  偏移量
 @param radius  圆角
 @param color   颜色
 @param opacity 透明度
 */
- (void)dropShadowWithOffset:(CGSize)offset radius:(CGFloat)radius color:(UIColor *)color opacity:(CGFloat)opacity;

@end

