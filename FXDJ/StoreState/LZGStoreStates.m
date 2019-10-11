//
//  LZGStoreStates.m
//  FXDJ
//
//  Created by 李正国 on 2019/6/25.
//  Copyright © 2019 李正国. All rights reserved.
//

#import "LZGStoreStates.h"

@implementation LZGStoreStates
-(instancetype)init{
    if (self=[super init]) {
        _LStates=[[UILabel alloc]init];
        _LStates.textColor=[UIColor whiteColor];
        _Lchooseview=[[UIImageView alloc]init];
    }
    [self sd_addSubviews:@[_LStates,_Lchooseview]];
    return self;
}
-(void)layoutSubviews{
    self.backgroundColor=[UIColor colorWithRed:81/255.0 green:139/255.0 blue:249/255.0 alpha:1.0];
    _LStates.sd_layout
    .leftSpaceToView(self, 10*LZGCELLWIDTHSCALE)
    .topSpaceToView(self, 0)
    .bottomSpaceToView(self, 0);
    _Lchooseview.sd_layout
    .leftSpaceToView(_LStates, 2*LZGCELLWIDTHSCALE)
    .rightSpaceToView(self, 0);
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
