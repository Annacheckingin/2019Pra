
//
//  LZGOrderManegementMeneTableviewCell.m
//  FXDJ
//
//  Created by 李正国 on 2019/6/25.
//  Copyright © 2019 李正国. All rights reserved.
//

#import "LZGOrderManegementMeneTableviewCell.h"

@implementation LZGOrderManegementMeneTableviewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _grayview=[UIView new];
        _grayview.backgroundColor=[UIColor lightGrayColor];

        _cancelbtn=[UIButton new];
        [_cancelbtn setTitle:@"下架" forState:UIControlStateNormal];
        _cancelbtn.font=[UIFont systemFontOfSize:11];
        _cancelbtn.layer.borderWidth=1;
        _cancelbtn.layer.borderColor=[UIColor blackColor].CGColor;
        _cancelbtn.layer.cornerRadius=2;
        _cancelbtn.clipsToBounds=YES;
        [_cancelbtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
       
        _editbtn=[UIButton new];
        [_editbtn setTitle:@"编辑" forState:UIControlStateNormal];
      //  _editbtn.backgroundColor=[UIColor orangeColor];
        _editbtn.font=[UIFont systemFontOfSize:11];
        _editbtn.layer.borderColor=[UIColor blackColor].CGColor;
        _editbtn.layer.borderWidth=1;
        _editbtn.layer.cornerRadius=2;
        _editbtn.clipsToBounds=YES;
        [_editbtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
       
        _goodsImg=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"foodimg"]];
        _goodsName=[UILabel new];
        _goodsName.text=@"虾滑套饭";
        _goodsName.font=[UIFont systemFontOfSize:13];
        _goodsPrice=[UILabel new];
        _goodsPrice.text=@"18:00";
        _goodsPrice.font=[UIFont systemFontOfSize:11];
        [self.contentView sd_addSubviews:@[_cancelbtn,_editbtn,_goodsPrice,_goodsName,_goodsImg,_grayview]];
        _goodsImg.sd_layout
        .widthIs(70)
        .heightIs(70)
        .topSpaceToView(self.contentView, 10*LZGCELLHEIGHTSCALE)
        .leftSpaceToView(self.contentView, 10*LZGCELLWIDTHSCALE);
        //商品名字
        _goodsName.sd_layout
        .widthIs(20)
        .heightIs(11)
        .topSpaceToView(self.contentView, 25*LZGCELLHEIGHTSCALE)
        .leftSpaceToView(_goodsImg, 30*LZGCELLWIDTHSCALE);
        [_goodsName setSingleLineAutoResizeWithMaxWidth:100*LZGCELLWIDTHSCALE];
        //商品价格
        _goodsPrice.sd_layout
        .heightIs(11)
        .widthIs(20)
        .leftEqualToView(_goodsName)
        .topSpaceToView(_goodsName, 5*LZGCELLHEIGHTSCALE);
        [_goodsPrice setSingleLineAutoResizeWithMaxWidth:50*LZGCELLWIDTHSCALE];
        //编辑按钮
        _editbtn.sd_layout
        .widthIs(50)
        .heightIs(15)
        .bottomSpaceToView(self.contentView, 10*LZGCELLHEIGHTSCALE)
        .leftSpaceToView(self.contentView, 150*LZGCELLWIDTHSCALE);
        //下架按钮
        _cancelbtn.sd_layout
        .widthIs(50)
        .heightIs(15)
        .topEqualToView(_editbtn)
        .leftSpaceToView(_editbtn, 5*LZGCELLWIDTHSCALE);
        //cell的分割线
_grayview.sd_layout
.widthIs(LZGSCREENWIDTH)
        .heightIs(1)
.bottomSpaceToView(self.contentView, 0);
    }
   
    return self;
}
-(void)layoutSubviews{
   
   
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
