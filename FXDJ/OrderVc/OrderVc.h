//
//  OrderVc.h
//  FXDJ
//
//  Created by 李正国 on 2019/6/11.
//  Copyright © 2019 李正国. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,LZGOrderTableviewtype){
    LZGFreshOrderTableview=1,
    LZGIntenseOrderTableview,
    LZGCompleteOrderTableview
 };
NS_ASSUME_NONNULL_BEGIN
@class FreshOrderView;
@class IntenseView;
@class CompletedView;
@interface OrderVc : UIViewController
@property(nonatomic,strong)UIView *topView;
@property(nonatomic,strong)UIButton *btn1;
@property(nonatomic,strong)UIButton *btn2;
@property(nonatomic,strong)UIButton *btn3;
@property(nonatomic,strong)FreshOrderView *freshorderview;
@property(nonatomic,strong)IntenseView *intenseview;
@property(nonatomic,strong)CompletedView *completedview;
@end

NS_ASSUME_NONNULL_END
