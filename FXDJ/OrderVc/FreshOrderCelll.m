//
//  FreshOrderCelll.m
//  FXDJ
//
//  Created by 李正国 on 2019/6/15.
//  Copyright © 2019 李正国. All rights reserved.
//

#import "FreshOrderCelll.h"
NSString * const LZGFreshordercellidentifier=@"LZGfreshordercellidentifier";
@implementation FreshOrderCelll
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpContent];
self.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(void)setUpContent{
    _danhao=[UILabel new];
    _danhao.text=@"单号:";
    _danhao.font=[UIFont boldSystemFontOfSize:11*LZGCELLWIDTHSCALE];

   _cellordernum=[[UILabel alloc]init];
   
    _cellordernum.font=[UIFont boldSystemFontOfSize:11*LZGCELLWIDTHSCALE];
_xiadanshijian=[UILabel new];
    _xiadanshijian.text=@"下单时间";
    _xiadanshijian.font=[UIFont systemFontOfSize:11*LZGCELLWIDTHSCALE];
    _xiadanshijian.textColor=[UIColor lightGrayColor];
    //
    _dizhi=[UILabel new];
    _dizhi.text=@"地址:";
    _dizhi.font=[UIFont systemFontOfSize:11*LZGCELLWIDTHSCALE];
    _dizhi.textColor=[UIColor lightGrayColor];
//
    _canhefei=[UILabel new];
    _canhefei.text=@"包装费用:";
    _canhefei.font=[UIFont systemFontOfSize:11*LZGCELLWIDTHSCALE];
    _canhefei.textColor=[UIColor lightGrayColor];
//
    _peisongfei=[UILabel new];
    _peisongfei.text=@"配送费:";
    _peisongfei.font=[UIFont systemFontOfSize:11*LZGCELLWIDTHSCALE];
    _peisongfei.textColor=[UIColor lightGrayColor];
//
    _zongji=[UILabel new];
    _zongji.text=@"总计算:";
    _zongji.font=[UIFont systemFontOfSize:11*LZGCELLWIDTHSCALE];
    _zongji.textColor=[UIColor lightGrayColor];
//
    _beizhu=[UILabel new];
    _beizhu.text=@"备注:";
    _beizhu.font=[UIFont systemFontOfSize:11*LZGCELLWIDTHSCALE];
    _beizhu.textColor=[UIColor lightGrayColor];
//
    _grayview=[UIView new];
    _grayview.backgroundColor=[UIColor lightGrayColor];
    
  // _LZGcellordernum=[UILabel new];
    _cellprecisenum=[UILabel new];
    
    _cellprecisenum.font=[UIFont systemFontOfSize:11*LZGCELLWIDTHSCALE];
    _cellprecisenum.textColor=[UIColor lightGrayColor];
//
    _cellorderaddress=[UILabel new];
    _cellorderaddress.font=[UIFont systemFontOfSize:11*LZGCELLWIDTHSCALE];
    _cellorderaddress.textColor=[UIColor lightGrayColor];
//
    _cellorderday=[UILabel new];
   
    _cellorderday.font=[UIFont systemFontOfSize:11*LZGCELLWIDTHSCALE];
    _cellorderday.textColor=[UIColor lightGrayColor];
    //
    _cellorderprecisetime=[UILabel new];
    
    _cellorderprecisetime.font=[UIFont systemFontOfSize:11*LZGCELLWIDTHSCALE];
    _cellorderprecisetime.textColor=[UIColor lightGrayColor];
    //
    _cellfoodimg=[UIImageView new];
    _cellfoodimg.image=[UIImage imageNamed:@"foodimg"];
    //
    _cellfoodname=[UILabel new];
   
    _cellfoodname.font=[UIFont boldSystemFontOfSize:14*LZGCELLWIDTHSCALE];
    //
    _cellfoodprice=[UILabel new];
  
    _cellfoodprice.font=[UIFont boldSystemFontOfSize:14*LZGCELLWIDTHSCALE];
    _cellfoodprice.textColor=[UIColor redColor];
    //
    _cellbowlprice=[UILabel new];
  
    _cellbowlprice.font=[UIFont systemFontOfSize:11*LZGCELLWIDTHSCALE];
    _cellbowlprice.textColor=[UIColor lightGrayColor];
    //
    _celltotalcost=[UILabel new];
    
    _celltotalcost.font=[UIFont systemFontOfSize:11*LZGCELLWIDTHSCALE];
    _celltotalcost.textColor=[UIColor lightGrayColor];
    //
    _celltranscost=[UILabel new];
 
    _celltranscost.font=[UIFont systemFontOfSize:11*LZGCELLWIDTHSCALE];
    _celltranscost.textColor=[UIColor lightGrayColor];
    //
    _cellattention=[UILabel new];
  
    _cellattention.font=[UIFont systemFontOfSize:11*LZGCELLWIDTHSCALE];
    _cellattention.textColor=[UIColor lightGrayColor];
    //
    _cellacceptorderbtn=[UIButton new];
    _cellacceptorderbtn.backgroundColor=[UIColor colorWithRed:85/255.0 green:126/255.0 blue:252/255.0 alpha:1];
    _cellacceptorderbtn.layer.cornerRadius=5;
    _cellacceptorderbtn.clipsToBounds=YES;
    [_cellacceptorderbtn setTitle:@"接受订单" forState:UIControlStateNormal];
    [self.contentView sd_addSubviews:@[_danhao,_xiadanshijian,_dizhi,_canhefei,_peisongfei,_zongji,_beizhu,_grayview,_cellordernum,_cellprecisenum,_cellorderaddress,_cellorderday,_cellorderprecisetime,_cellfoodimg,_cellfoodname,_cellfoodprice,_cellbowlprice,_celltotalcost,_celltranscost,_cellattention,_cellacceptorderbtn]];
   
  _danhao.sd_layout
.heightIs(21*LZGCELLHEIGHTSCALE)
.leftSpaceToView(self.contentView, 10*LZGCELLWIDTHSCALE)
.topSpaceToView(self.contentView, 2*LZGCELLHEIGHTSCALE);
    [_danhao setSingleLineAutoResizeWithMaxWidth:40*LZGCELLWIDTHSCALE];
  //
_cellordernum.sd_layout
    .widthIs(26*LZGCELLWIDTHSCALE)
    .heightIs(21*LZGCELLHEIGHTSCALE)
    .leftSpaceToView(_danhao, 2*LZGCELLWIDTHSCALE)
    .topSpaceToView(self.contentView, 2*LZGCELLHEIGHTSCALE);
    //
_xiadanshijian.sd_layout
    .widthIs(50*LZGCELLWIDTHSCALE)
    .heightIs(21*LZGCELLHEIGHTSCALE)
    .leftSpaceToView(_danhao, 280*LZGCELLWIDTHSCALE)
   .topSpaceToView(self.contentView, 2*LZGCELLHEIGHTSCALE);
    //具体的单号
_cellprecisenum.sd_layout.heightIs(11*LZGCELLHEIGHTSCALE)
    .widthIs(100*LZGCELLWIDTHSCALE)
    .topSpaceToView(_danhao, 1*LZGCELLHEIGHTSCALE)
    .leftEqualToView(_danhao);
    
       //下单日期
    _cellorderday.sd_layout
    .leftSpaceToView(_cellprecisenum, 120*LZGCELLWIDTHSCALE)
    .widthIs(55*LZGCELLWIDTHSCALE)
    .heightIs(11*LZGCELLHEIGHTSCALE)
    .topEqualToView(_cellprecisenum);
   
    //下单具体时间
    _cellorderprecisetime.sd_layout
    .widthIs(50*LZGCELLWIDTHSCALE)
    .heightIs(11*LZGCELLHEIGHTSCALE)
    .topEqualToView(_cellprecisenum)
    .leftSpaceToView(_cellorderday, 45*LZGCELLWIDTHSCALE);
  
    //地址label
    _dizhi.sd_layout.
topSpaceToView(_cellprecisenum,2*LZGCELLHEIGHTSCALE)
    .heightIs(11*LZGCELLHEIGHTSCALE)
    .leftEqualToView(_cellprecisenum)
    .widthIs(30*LZGCELLWIDTHSCALE);
   
//具体的地址
    _cellorderaddress.sd_layout
    .leftSpaceToView(_dizhi, 2*LZGCELLWIDTHSCALE)
    .topEqualToView(_dizhi)
    .heightIs(11*LZGCELLHEIGHTSCALE);
    [_cellorderaddress setSingleLineAutoResizeWithMaxWidth:LZGSCREENWIDTH-10*LZGCELLWIDTHSCALE];
    //分割的灰色线条
_grayview.sd_layout.topSpaceToView(_dizhi,8*LZGCELLHEIGHTSCALE)
    .widthIs(LZGSCREENWIDTH)
    .heightIs(1*LZGCELLHEIGHTSCALE);
    //物品图片
    _cellfoodimg.sd_layout
    .topSpaceToView(_grayview, 12*LZGCELLHEIGHTSCALE)
    .leftEqualToView(_danhao)
    .widthIs(100)
    .heightIs(100);
    //物品的名称
    _cellfoodname.sd_layout
    .leftSpaceToView(_cellfoodimg, 15*LZGCELLWIDTHSCALE)
    .topSpaceToView(_grayview, 50*LZGCELLHEIGHTSCALE)
    .heightIs(21*LZGCELLHEIGHTSCALE);
    [_cellfoodname setSingleLineAutoResizeWithMaxWidth:180];
    //物品价格
_cellfoodprice.sd_layout
    .topSpaceToView(_cellfoodname, 0*LZGCELLHEIGHTSCALE)
    .leftEqualToView(_cellfoodname)
    .heightIs(15*LZGCELLHEIGHTSCALE);
    //包装费用label
_canhefei.sd_layout.topSpaceToView(_cellfoodimg,35/**LZGCELLHEIGHTSCALE*/)
    .leftEqualToView(_danhao)
    .heightIs(11*LZGCELLHEIGHTSCALE);
    [_canhefei setSingleLineAutoResizeWithMaxWidth:50*LZGCELLWIDTHSCALE];
    //具体的包装费用
    _cellbowlprice.sd_layout
    .heightIs(11*LZGCELLHEIGHTSCALE)
    .leftEqualToView(_cellorderprecisetime)
    .topEqualToView(_canhefei);
    //配送费label
    _peisongfei.sd_layout
    .heightIs(11*LZGCELLHEIGHTSCALE)
    .topSpaceToView(_canhefei, 8/**LZGCELLHEIGHTSCALE*/)
    .leftEqualToView(_danhao);
    [_peisongfei setSingleLineAutoResizeWithMaxWidth:50*LZGCELLWIDTHSCALE];
    //具体的配送费
    _celltranscost.sd_layout
    .heightIs(11*LZGCELLHEIGHTSCALE)
    .leftEqualToView(_cellbowlprice)
    .topEqualToView(_peisongfei);
    //总计label
    _zongji.sd_layout
   
    .heightIs(11*LZGCELLHEIGHTSCALE)
    .leftEqualToView(_danhao)
    .topSpaceToView(_peisongfei, 8/**LZGCELLHEIGHTSCALE*/);
    [_zongji setSingleLineAutoResizeWithMaxWidth:50];
    //具体的总计
    _celltotalcost.sd_layout
    .heightIs(11*LZGCELLHEIGHTSCALE)
    .leftEqualToView(_celltranscost)
    .topEqualToView(_zongji);
    //备注label
    _beizhu.sd_layout
    .heightIs(11*LZGCELLHEIGHTSCALE)
    .topSpaceToView(_zongji, 15/**LZGCELLHEIGHTSCALE*/)
    .leftEqualToView(_canhefei);
    [_beizhu setSingleLineAutoResizeWithMaxWidth:50*LZGCELLWIDTHSCALE];
    //具体的备注
    _cellattention.sd_layout
    .heightIs(11*LZGCELLHEIGHTSCALE)
    .topEqualToView(_beizhu)
    .leftSpaceToView(_beizhu, 2*LZGCELLWIDTHSCALE);
    [_cellattention setSingleLineAutoResizeWithMaxWidth:250*LZGCELLWIDTHSCALE];
   //接受安钮
    _cellacceptorderbtn.sd_layout
    .heightIs(25*LZGCELLHEIGHTSCALE)
    .topSpaceToView(_beizhu, 10)
   .leftSpaceToView(_beizhu, 10)
    .rightSpaceToView(_celltotalcost, 10);
    [self setupAutoHeightWithBottomView:_cellacceptorderbtn bottomMargin:5*LZGCELLHEIGHTSCALE];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
