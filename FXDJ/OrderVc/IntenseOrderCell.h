//
//  IntenseOrderCell.h
//  FXDJ
//
//  Created by 李正国 on 2019/6/14.
//  Copyright © 2019 李正国. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IntenseOrderCell : UITableViewCell
@property(nonatomic,weak) IBOutlet UILabel* danHao;
@property(nonatomic,weak) IBOutlet UILabel *orderNum;
@property(nonatomic,weak)IBOutlet UILabel *fuKuanShiJian;
@property(nonatomic,weak)IBOutlet UILabel *preciseOrderNum;
@property(nonatomic,weak)IBOutlet UILabel *payDay;
@property(nonatomic,weak)IBOutlet UILabel *payTime;
@property(nonatomic,weak)IBOutlet UILabel *diZhi;
@property(nonatomic,weak)IBOutlet UILabel *preciseAddress;
@property(nonatomic,weak)IBOutlet UILabel *cuiDanShiJian;

@property(nonatomic,weak)IBOutlet UILabel *urgeOrderTime;
@property(nonatomic,weak)IBOutlet UILabel *foodName;
@property(nonatomic,weak)IBOutlet UILabel *foodCost;
@property(nonatomic,weak)IBOutlet UIButton *sendOrder;
@end

NS_ASSUME_NONNULL_END
