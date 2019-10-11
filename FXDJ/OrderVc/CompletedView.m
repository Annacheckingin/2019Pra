//
//  CompletedView.m
//  FXDJ
//
//  Created by 李正国 on 2019/6/12.
//  Copyright © 2019 李正国. All rights reserved.
//

#import "CompletedView.h"

@implementation CompletedView
-(instancetype)init{
    if (self=[super init]) {
        _orderCompletelist=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
_orderCompletelist.separatorStyle=UITableViewCellSelectionStyleNone;
    _orderCompletelist.tag=LZGCompleteOrderTableview;
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)layoutSubviews{
    _orderCompletelist.frame=CGRectMake(0, 0,self.bounds.size.width, self.bounds.size.height);
    _orderCompletelist.backgroundColor=[UIColor clearColor];
        [self addSubview:_orderCompletelist];
}

@end
