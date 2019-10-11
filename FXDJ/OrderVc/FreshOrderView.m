//
//  FreshOrderView.m
//  FXDJ
//
//  Created by 李正国 on 2019/6/12.
//  Copyright © 2019 李正国. All rights reserved.
//
#import "sys/utsname.h"
#import "FreshOrderView.h"
#import "FreshOrderCelll.h"

extern NSString * const LZGFreshordercellidentifier;
@implementation FreshOrderView

-(instancetype)init{
    if (self=[super init]) {
        _acceptall=[[UIButton alloc]init];
        _listtable=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _listtable.tag=LZGFreshOrderTableview;
    }
    return self;
}




-(void)layoutSubviews{
    [super layoutSubviews];
   OrderVc *vvc=[UIApplication sharedApplication].keyWindow.rootViewController.tabBarController.viewControllers.firstObject;
    UIView *topview=vvc.topView;
    
   // _acceptall.frame=CGRectMake(LZGacceptbtnoriginX, LZGwhitegapheight, LZGacceptallbtnwidth, LZGacceptallbtnheight);
    _acceptall.backgroundColor=[UIColor colorWithRed:85/255.0 green:126/255.0 blue:252/255.0 alpha:1];
    [_acceptall setTitle:@"一键接受" forState:UIControlStateNormal];
    _acceptall.layer.cornerRadius=5;
    _acceptall.clipsToBounds=YES;
   
    CGFloat topviewheight=topview.height; _acceptall.frame=CGRectMake(250,topviewheight*LZGCELLHEIGHTSCALE+LZGwhitegapheight,LZGacceptallbtnwidth,LZGacceptallbtnheight);
    [self addSubview:_acceptall];
_listtable.frame=CGRectMake(0,topviewheight+LZGwhitegapheight*2+LZGacceptallbtnheight,self.frame.size.width*LZGCELLWIDTHSCALE,self.frame.size.height-vvc.tabBarController.tabBar.height-(topviewheight+LZGwhitegapheight*2+LZGacceptallbtnheight));
    _listtable.backgroundColor=[UIColor whiteColor]; _listtable.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self addSubview:_listtable];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
