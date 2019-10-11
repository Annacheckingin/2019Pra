//
//  IntenseOrderCell.m
//  FXDJ
//
//  Created by 李正国 on 2019/6/14.
//  Copyright © 2019 李正国. All rights reserved.
//

#import "IntenseOrderCell.h"
NSString *const LZGIntensecellIdentifier=@"LZGIntensecellIdentifier";
@implementation IntenseOrderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor=[UIColor whiteColor];
    _sendOrder.layer.cornerRadius=5;
    _sendOrder.clipsToBounds=YES;
    // Initialization code
    self.layer.cornerRadius=1;
    self.clipsToBounds=YES;
self.selectionStyle=UITableViewCellSelectionStyleNone;
    //单号label
    _danHao.sd_layout
    .topSpaceToView(self.contentView, 2*LZGCELLHEIGHTSCALE)
    .leftSpaceToView(self.contentView, 5*LZGCELLWIDTHSCALE);
    [_danHao setSingleLineAutoResizeWithMaxWidth:50*LZGCELLWIDTHSCALE];
    //简单的单号
    _orderNum.sd_layout
    .topEqualToView(_danHao)
    .leftSpaceToView(self.contentView, 40*LZGCELLWIDTHSCALE);
    [_orderNum setSingleLineAutoResizeWithMaxWidth:50*LZGCELLWIDTHSCALE];
    //付款时间
    _fuKuanShiJian.sd_layout
    .topEqualToView(_danHao)
    .leftSpaceToView(_orderNum, 250*LZGCELLWIDTHSCALE);
    [_fuKuanShiJian setSingleLineAutoResizeWithMaxWidth:50*LZGCELLWIDTHSCALE];
    //具体的单号
    _preciseOrderNum.sd_layout
    .leftEqualToView(_danHao);
    [_preciseOrderNum setSingleLineAutoResizeWithMaxWidth:150*LZGCELLWIDTHSCALE];
    //付款日子
    _payDay.sd_layout
    .topEqualToView(_preciseOrderNum)
    .leftSpaceToView(_preciseOrderNum, 100*LZGCELLWIDTHSCALE);
    [_payDay setSingleLineAutoResizeWithMaxWidth:100*LZGCELLWIDTHSCALE];
    //付款的具体时间
    _payTime.sd_layout
    .topEqualToView(_preciseOrderNum)
    .leftSpaceToView(_payDay, 70*LZGCELLWIDTHSCALE);
    //地址label
    _diZhi.sd_layout
    .leftEqualToView(_preciseOrderNum);
    [_diZhi setSingleLineAutoResizeWithMaxWidth:50*LZGCELLWIDTHSCALE];
    //具体的地址
    _preciseAddress.sd_layout
    .topEqualToView(_diZhi)
    .leftSpaceToView(_diZhi, 2*LZGCELLWIDTHSCALE);
    //催单时间label
    _cuiDanShiJian.sd_layout
    .rightEqualToView(_payDay)
    .topEqualToView(_diZhi);
    [_cuiDanShiJian setSingleLineAutoResizeWithMaxWidth:100*LZGCELLWIDTHSCALE];
    //具体的催单时间
    _urgeOrderTime.sd_layout
    .heightIs(11*LZGCELLHEIGHTSCALE)
    .leftEqualToView(_payTime)
    .topEqualToView(_cuiDanShiJian);
    //物体名字
    _foodName.sd_layout
    .heightIs(14*LZGCELLHEIGHTSCALE)
    .leftEqualToView(_diZhi);
    [_foodName setSingleLineAutoResizeWithMaxWidth:150*LZGCELLWIDTHSCALE];
    //物品价格
    _foodCost.sd_layout
    .heightIs(15*LZGCELLHEIGHTSCALE)
    .topEqualToView(_foodName)
    .leftSpaceToView(_foodName,1*LZGCELLWIDTHSCALE);
    //派送按钮
    _sendOrder.sd_layout
    .centerXEqualToView(self.contentView);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
