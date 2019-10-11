//
//  pingjiacell.m
//  FXDJ
//
//  Created by 李正国 on 2019/6/26.
//  Copyright © 2019 李正国. All rights reserved.
//

#import "pingjiacell.h"

@implementation pingjiacell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _xiadantime=[[UILabel alloc]init];
        _xiadantime.font=[UIFont systemFontOfSize:11];
        _xiadantime.text=@"下单时间：";
        _danhao=[[UILabel alloc]init];
        _danhao.text=@"单号:";
        _simpleordernum=[[UILabel alloc]init];
        _simpleordernum.text=@"30";
        _realordernum=[[UILabel alloc]init];
        _realordernum.text=@"xxxxxxxx";
        _realordernum.font=[UIFont systemFontOfSize:11];
       //
        _orderday=[[UILabel alloc]init];
        _orderday.font=[UIFont systemFontOfSize:11];
        _ordertime=[[UILabel alloc]init];
        _ordertime.font=[UIFont systemFontOfSize:11];
        _orderaddress=[UILabel new];
        _orderaddress.font=[UIFont systemFontOfSize:11];
        _dizhi=[[UILabel alloc]init];
        _dizhi.text=@"地址:";
        _dizhi.font=[UIFont systemFontOfSize:11];
        _wanchengshijian=[[UILabel alloc]init];
        _wanchengshijian.text=@"完成时间";
        _wanchengshijian.font=[UIFont systemFontOfSize:11];
        _orderdoneday=[[UILabel alloc]init];
        
        _orderdoneday.font=[UIFont systemFontOfSize:11];
        _orderdonetime=[[UILabel alloc]init];
        _orderdonetime.font=[UIFont systemFontOfSize:11];
        _goodsname=[[UILabel alloc]init];
        _goodsprice=[[UILabel alloc]init];
        _grayview=[[UIView alloc]init];
        _grayview.backgroundColor=[UIColor lightGrayColor];
        _pingjia=[[UITextView alloc]init];
        _pingjia.font=[UIFont systemFontOfSize:11];
        _pingjia.selectable=NO;
        _bottomview=[[UIView alloc]init];
        _bottomview.backgroundColor=[UIColor grayColor];
        [self.contentView sd_addSubviews:@[_danhao,_simpleordernum,_xiadantime,_realordernum,_orderday,_ordertime,_orderaddress,_dizhi,_wanchengshijian,_orderdoneday,_orderdonetime,_grayview,_pingjia,_bottomview]];
        [self setupbasicUi];
    }
    return self;
}
-(void)setupbasicUi{
    _danhao.sd_layout
    .heightIs(14)
    .leftSpaceToView(self.contentView, 10)
    .topSpaceToView(self.contentView, 10);
    [_danhao setSingleLineAutoResizeWithMaxWidth:150];
    _simpleordernum.sd_layout
    .heightIs(14)
    .widthIs(100)
    .leftSpaceToView(_danhao, 5)
    .topEqualToView(_danhao);
    //
    _xiadantime.sd_layout
    .heightIs(13)
    .widthIs(60)
    .rightSpaceToView(self.contentView, 5)
    .topEqualToView(_danhao);
    //[_xiadantime setBackgroundColor:[UIColor blackColor]];
   _realordernum.sd_layout
    .heightIs(13)
    .leftEqualToView(_danhao)
    .topSpaceToView(_danhao, 5);
    [_realordernum setSingleLineAutoResizeWithMaxWidth:200];
    _orderday.sd_layout
    .heightIs(13)
    .leftSpaceToView(_realordernum, 150)
    .topEqualToView(_realordernum);
    [_orderday setSingleLineAutoResizeWithMaxWidth:180];
    //
    _ordertime.sd_layout
    .heightIs(13)
    .topEqualToView(_realordernum)
    .leftSpaceToView(_orderday, 60);
    _dizhi.sd_layout
    .heightIs(13)
    .leftEqualToView(_danhao)
    .topSpaceToView(_realordernum, 5);
    [_dizhi setSingleLineAutoResizeWithMaxWidth:100];
    _orderaddress.sd_layout
    .heightIs(13)
    .leftSpaceToView(_dizhi, 5)
    .topEqualToView(_dizhi);
    [_orderaddress setSingleLineAutoResizeWithMaxWidth:180];
   _wanchengshijian.sd_layout
    .heightIs(13)
    .topEqualToView(_dizhi)
    .leftEqualToView(_xiadantime);
    
    _orderdoneday.sd_layout
    .heightIs(13)
    .leftEqualToView(_orderday)
    .topSpaceToView(_wanchengshijian, 5);
    _orderdonetime.sd_layout
    .heightIs(13)
    .leftEqualToView(_ordertime)
    .topEqualToView(_orderdoneday);
    _grayview.sd_layout
    .heightIs(1)
    .widthIs(LZGSCREENWIDTH)
    .topSpaceToView(_orderdonetime, 5);
    _pingjia.sd_layout
    .topSpaceToView(_grayview, 0)
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView);
    
    _bottomview.sd_layout.heightIs(3)
    .widthIs(LZGSCREENWIDTH)
    .topSpaceToView(self.contentView, 1);
    
    [self setupAutoHeightWithBottomView:_pingjia bottomMargin:1];
    
    /*_danhao.sd_layout
    .heightIs(14)
    .topSpaceToView(self.contentView, 5)
    .leftSpaceToView(self.contentView, 5);
    [_danhao setSingleLineAutoResizeWithMaxWidth:100];
    //
    _simpleordernum.sd_layout
    .heightIs(14)
    .topEqualToView(_danhao)
    .leftSpaceToView(_danhao, 5);
    [_simpleordernum setSingleLineAutoResizeWithMaxWidth:60];
    
    //
    _xiadanshijian.sd_layout
    .topEqualToView(_danhao)
    .heightIs(14)
    .widthIs(100)
    .leftSpaceToView(self.contentView, 200);
    _xiadanshijian.backgroundColor=[UIColor redColor];
    //
_realordernum.sd_layout
    .heightIs(13)
    .topSpaceToView(_danhao, 10)
    .leftEqualToView(_danhao);
    [_realordernum setSingleLineAutoResizeWithMaxWidth:300];
    _orderday.sd_layout.
    topEqualToView(_realordernum)
    .widthIs(100)
    .heightIs(13)
    .leftSpaceToView(_orderaddress, 200);
    //
    _ordertime.sd_layout
    .topEqualToView(_orderday)
    .heightIs(13)
    .leftSpaceToView(_orderday, 3);
    //
    _orderaddress.sd_layout
    .heightIs(13)
    .topSpaceToView(_realordernum, 5)
    .leftEqualToView(_danhao);
    [_orderaddress setSingleLineAutoResizeWithMaxWidth:300];
    //
    _wanchengshijian
    .sd_layout.topEqualToView(_orderaddress)
    .heightIs(13)
    .leftSpaceToView(_orderaddress, 50);
    //
    _goodsname.sd_layout
    .leftEqualToView(_danhao)
    .heightIs(15);
    [_goodsname setSingleLineAutoResizeWithMaxWidth:90];
    //
    _goodsprice.sd_layout
    .heightIs(14)
    .leftSpaceToView(_goodsname, 5)
    .topEqualToView(_goodsname)
    .widthIs(80);
  
    //
    _orderdoneday.sd_layout
    .heightIs(14)
    .topSpaceToView(_wanchengshijian, 5)
    .leftEqualToView(_orderday);
    [_orderdoneday setSingleLineAutoResizeWithMaxWidth:60];
    //
    _orderdonetime.sd_layout
    .heightIs(14)
    .leftEqualToView(_ordertime)
    .topEqualToView(_orderdoneday);
    //
    _grayview.sd_layout
    .topSpaceToView(_goodsname, 20)
    .widthIs(LZGSCREENWIDTH)
    .heightIs(1);
    //
    _pingjia.sd_layout
    .heightIs(20)
    .topSpaceToView(_grayview, 0);
    [self setupAutoHeightWithBottomView:_pingjia bottomMargin:0];
    _pingjia.backgroundColor=[UIColor redColor];*/
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
