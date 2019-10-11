//
//  OrderManagement.h
//  FXDJ
//
//  Created by 李正国 on 2019/6/11.
//  Copyright © 2019 李正国. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class LZGAddGoods;
@interface OrderManagement : UIViewController
@property(nonatomic,strong)UITableView *menutableview;
@property(nonatomic,strong)UITableView *choselist;
@property(nonatomic,retain)LZGAddGoods *addgoodsVc;
//+(UIImage *)imageWithPureColor:(UIColor*)color;
@end

NS_ASSUME_NONNULL_END
