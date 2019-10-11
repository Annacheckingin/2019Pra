//
//  LZGOrderManegementMeneTableviewCell.h
//  FXDJ
//
//  Created by 李正国 on 2019/6/25.
//  Copyright © 2019 李正国. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZGOrderManegementMeneTableviewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *goodsImg;
@property(nonatomic,strong)UILabel *goodsName;
@property(nonatomic,strong)UILabel *goodsPrice;
@property(nonatomic,strong)UIButton *editbtn;
@property(nonatomic,strong)UIButton *cancelbtn;
@property(nonatomic,strong)UIView *grayview;
@end

NS_ASSUME_NONNULL_END
