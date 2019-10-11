//
//  FreshOrderCelll.h
//  FXDJ
//
//  Created by 李正国 on 2019/6/15.
//  Copyright © 2019 李正国. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FreshOrderCelll : UITableViewCell
//固定不变的视图
@property(nonatomic,strong)UILabel *danhao;
@property(nonatomic,strong)UILabel *xiadanshijian;
@property(nonatomic,strong)UILabel *dizhi;
@property(nonatomic,strong)UILabel *canhefei;
@property(nonatomic,strong)UILabel *peisongfei;
@property(nonatomic,strong)UILabel *zongji;
@property(nonatomic,strong)UILabel *beizhu;
@property(nonatomic,strong)UIView *grayview;
/*数据请求视图*/
//简单的单号
@property(nonatomic,strong) UILabel *cellordernum;
//具体的单号
@property(nonatomic,strong) UILabel *cellprecisenum;
//地址
@property(nonatomic,strong) UILabel *cellorderaddress;
//下单天号
@property(nonatomic,strong) UILabel *cellorderday;
//下单的具体时间
@property(nonatomic,strong) UILabel *cellorderprecisetime;
//货物图片
@property(nonatomic,strong) UIImageView *cellfoodimg;
//货物名字
@property(nonatomic,strong) UILabel *cellfoodname;
//货物价格
@property(nonatomic,strong) UILabel *cellfoodprice;
//总计消耗
@property(nonatomic,strong) UILabel *celltotalcost;
//包装费
@property(nonatomic,strong) UILabel *cellbowlprice;
//配送费你
@property(nonatomic,strong) UILabel *celltranscost;
//备注
@property(nonatomic,strong) UILabel *cellattention;
//点击接受
@property(nonatomic,strong) UIButton *cellacceptorderbtn;
@end

NS_ASSUME_NONNULL_END
