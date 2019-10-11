//
//  pingjiacell.h
//  FXDJ
//
//  Created by 李正国 on 2019/6/26.
//  Copyright © 2019 李正国. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface pingjiacell : UITableViewCell
@property(nonatomic,strong)UILabel *danhao;
@property(nonatomic,strong)UILabel *simpleordernum;
@property(nonatomic,strong)UILabel *realordernum;
@property(nonatomic,strong)UILabel *xiadantime;
@property(nonatomic,strong)UILabel *orderday;
@property(nonatomic,strong)UILabel *ordertime;
@property(nonatomic,strong)UILabel *orderaddress;
@property(nonatomic,strong)UILabel *dizhi;
@property(nonatomic,strong)UILabel *wanchengshijian;
@property(nonatomic,strong)UILabel *orderdoneday;
@property(nonatomic,strong)UILabel *orderdonetime;
@property(nonatomic,strong)UILabel *goodsname;
@property(nonatomic,strong)UILabel *goodsprice;
@property(nonatomic,strong)UIView *grayview;
@property(nonatomic,strong)UITextView *pingjia;
@property(nonatomic,strong)UIView *bottomview;
@end

NS_ASSUME_NONNULL_END
