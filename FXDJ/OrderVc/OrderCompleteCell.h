//
//  OrderComplete.h
//  FXDJ
//
//  Created by 李正国 on 2019/6/14.
//  Copyright © 2019 李正国. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OrderCompleteCell : UITableViewCell
@property(nonatomic,weak)IBOutlet UILabel *danHao;
@property(nonatomic,weak) IBOutlet UILabel *orderNum;
@property(nonatomic,weak) IBOutlet UILabel *orderPreciseNum;
@property(nonatomic,weak)IBOutlet UILabel *diZhi;
@property(nonatomic,weak)IBOutlet UILabel *orderPreciseAddress;
@property(nonatomic ,weak)IBOutlet UILabel *fuKuanShiJian;
@property(nonatomic,weak)IBOutlet UILabel *orderday;
@property(nonatomic ,weak)IBOutlet UILabel *orderPrecisetime;
@property(nonatomic,weak)IBOutlet UILabel *cuiDanShijian;
@property(nonatomic,weak)IBOutlet UILabel *currentOrderTime;
@property(nonatomic,weak)IBOutlet UILabel *orderName;
//@property(nonatomic,weak) IBOutlet UIImageView *LZGcashsymbol;
@property(nonatomic,weak) IBOutlet UILabel *orderCost;
@end

NS_ASSUME_NONNULL_END
