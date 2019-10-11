//
//  IntenseView.m
//  FXDJ
//
//  Created by 李正国 on 2019/6/12.
//  Copyright © 2019 李正国. All rights reserved.
//

#import "IntenseView.h"
@implementation IntenseView
-(instancetype)init{
    
    if (self=[super init]) {
        _intenseOrderList=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
_intenseOrderList.separatorStyle=UITableViewCellSeparatorStyleNone;
        _intenseOrderList.tag=LZGIntenseOrderTableview;
    }
    return self;
}
-(void)layoutSubviews{
  //  _intenseOrderList.frame=CGRectMake(0, 0, self.bounds.size.width*LZGCELLWIDTHSCALE, self.bounds.size.height*LZGCELLHEIGHTSCALE);
   // _intenseOrderList.backgroundColor=[UIColor greenColor];
    //
    //self.backgroundColor=[UIColor redColor];
    _intenseOrderList.frame=self.bounds;
    [self addSubview:_intenseOrderList];
    
    
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
