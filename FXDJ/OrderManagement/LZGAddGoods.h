//
//  LZGAddGoods.h
//  FXDJ
//
//  Created by 李正国 on 2019/6/26.
//  Copyright © 2019 李正国. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol AddGoodsdelegate <NSObject>
@optional
-(void)setthdata:(NSMutableDictionary *)dic;

@end
@interface LZGAddGoods : UIViewController
@property(nonatomic,strong)UIView *topview;
@property(nonatomic,strong)UITextField *addgoodsname;
@property(nonatomic,strong)UIButton *addgoodsimg;
@property(nonatomic,strong)UILabel *addgoodstype;
@property(nonatomic,strong)UILabel *addtranscost;
@property(nonatomic,strong)UILabel *morentranscost;
@property(nonatomic,strong)UILabel *labelgoodscost;
@property(nonatomic,strong)UITextField *realgoodscost;
@property(nonatomic,strong)UILabel *goodsintroduce;
@property(nonatomic,strong)UITextView *realintroduce;
@property(nonatomic,strong)UIButton *queren;
@property(nonatomic,strong)UIButton *typechose;
@property(nonatomic,strong)UIButton *quxiao;
@property(nonatomic,weak)id <AddGoodsdelegate>delegate;
@end

NS_ASSUME_NONNULL_END
