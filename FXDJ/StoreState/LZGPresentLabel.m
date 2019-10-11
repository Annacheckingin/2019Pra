//
//  LZGPresentLabel.m
//  FXDJ
//
//  Created by 李正国 on 2019/6/25.
//  Copyright © 2019 李正国. All rights reserved.
//

#import "LZGPresentLabel.h"

@implementation LZGPresentLabel
-(instancetype)init{
    if (self=[super init]) {
        _jinyingshuju=[UILabel new];
        _jinyingshuju.text=@"经营数据";
        _jinriyingyeE=[UILabel new];
         _jinriyingyeE.text=@"今日营业额";
        _jinriyingyeE_value=[UILabel new];
        _jinriyingyeE_value.text=@"6520.1";
        _jinriyingyeE_value.font=[UIFont systemFontOfSize:11];
            _jinridingdan=[UILabel new];
        _jinriyingyeE.font=[UIFont systemFontOfSize:11];
        _jinridingdan.text=@"今日订单";
        _jinridingdan.font=[UIFont systemFontOfSize:11];
        _jinridingdan_value=[UILabel new];
        _jinridingdan_value.font=[UIFont systemFontOfSize:11];
        _jinridingdan_value.text=@"132";
        _kedanjia=[UILabel new];
        _kedanjia.text=@"客单价";
        _kedanjia.font=[UIFont systemFontOfSize:11];
        _kedanjia_value=[UILabel new];
        _kedanjia_value.text=@"54.4";
        _kedanjia_value.font=[UIFont systemFontOfSize:11];
        _zuori=[UILabel new];
        _zuori.text=@"昨日";
        _zuori.font=[UIFont systemFontOfSize:11];
        _zuori_value=[UILabel new];
        _zuori_value.text=@"6543.15";
        _zuori_value.font=[UIFont systemFontOfSize:11];
        _zuoridingdan=[UILabel new];
        _zuoridingdan.text=@"昨日订单";
        _zuoridingdan.font=[UIFont systemFontOfSize:11];
        _zuoridingdan_value=[UILabel new];
        _zuoridingdan_value.text=@"120";
        _zuoridingdan_value.font=[UIFont systemFontOfSize:11];
        _zuori_t=[UILabel new];
        _zuori_t.text=@"昨日";
        _zuori_t.font=[UIFont systemFontOfSize:11];
        _zuori_t_value=[UILabel new];
        _zuori_t_value.text=@"52";
        _zuori_t_value.font=[UIFont systemFontOfSize:11];
         [self sd_addSubviews:@[_jinyingshuju,_jinriyingyeE,_jinriyingyeE_value,_jinridingdan,_jinridingdan_value,_kedanjia,_kedanjia_value,_zuori,_zuori_value,_zuoridingdan,_zuoridingdan_value,_zuori_t,_zuori_t_value]];
   
        
    }
    return self;
}
-(void)layoutSubviews{
    _jinyingshuju.frame=CGRectMake(20, 10, 80, 20);
    _jinriyingyeE.frame=CGRectMake(30, 50, 80, 13);
_jinridingdan.frame=CGRectMake(_jinriyingyeE.frame.origin.x+_jinriyingyeE.frame.size.width+50, _jinriyingyeE.frame.origin.y, 80, 13);
    _kedanjia.frame=CGRectMake(_jinridingdan.frame.origin.x+_jinridingdan.frame.size.width+50, _jinridingdan.frame.origin.y, 80, 13);
    _jinriyingyeE_value.frame=CGRectMake(_jinriyingyeE.frame.origin.x+20, _jinriyingyeE.frame.origin.y+_jinriyingyeE.frame.size.height+5, 80, 13);
    _jinridingdan_value.frame=CGRectMake(_jinridingdan.frame.origin.x+20, _jinridingdan.frame.origin.y+_jinridingdan.frame.size.height+5, 80, 13);
    _kedanjia_value.frame=CGRectMake(_kedanjia.frame.origin.x+10, _kedanjia.frame.origin.y+_kedanjia.frame.size.height+5, 80, 13);
    _zuori.frame=CGRectMake(_jinriyingyeE.frame.origin.x, _jinriyingyeE_value.frame.origin.y+_jinriyingyeE_value.frame.size.height+50, 25, 13);
    _zuori_value.frame=CGRectMake(_zuori.frame.origin.x+_zuori.frame.size.width, _zuori.frame.origin.y, 50, 13);
    _zuoridingdan.frame=CGRectMake(_jinridingdan.frame.origin.x-20, _zuori.frame.origin.y, 45, 13);
    _zuoridingdan_value.frame=CGRectMake(_zuoridingdan.frame.origin.x+_zuoridingdan.frame.size.width+1, _zuoridingdan.frame.origin.y, 80, 13);
    _zuori_t.frame=CGRectMake(_kedanjia.frame.origin.x-10, _zuoridingdan.frame.origin.y, 25, 13);
    _zuori_t_value.frame=CGRectMake(_zuori_t.frame.origin.x+_zuori.frame.size.width+1, _zuori_t.frame.origin.y, 80, 13);
}
-(void)updateLayout{
  
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
