//
//  StoreStates.h
//  FXDJ
//
//  Created by 李正国 on 2019/6/11.
//  Copyright © 2019 李正国. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LZGPresentLabel;
@class LZGStoreStates;
@class LZGPingJiaVc;
NS_ASSUME_NONNULL_BEGIN

@interface StoreStates : UIViewController
@property(nonatomic,strong)UIButton *meiShi;
@property(nonatomic,strong)UIButton *pingJia;
@property(nonatomic,strong)UIButton *leiJiDingDan;
@property(nonatomic,strong)LZGPresentLabel *presentlabel;
@property(nonatomic,strong)UIButton *cleanMemory;
@property(nonatomic,strong)UIImageView *storeimg;
@property(nonatomic,strong)UILabel *storename;
@property(nonatomic,strong)LZGStoreStates*storestates;
@property(nonatomic,strong)UIView *bluetopview;
@property(nonatomic,strong)UILabel *labelmeishi;
@property(nonatomic,strong)UILabel *labelpingjia;
@property(nonatomic,strong)UILabel *labelleijidingdan;
//
@property(nonatomic,strong)LZGPingJiaVc *pingjiaVc;
@end

NS_ASSUME_NONNULL_END
