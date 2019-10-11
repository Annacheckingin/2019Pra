//
//  FreshOrderView.h
//  FXDJ
//
//  Created by 李正国 on 2019/6/12.
//  Copyright © 2019 李正国. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderVc.h"
NS_ASSUME_NONNULL_BEGIN

@interface FreshOrderView : UIView
@property(nonatomic,strong)UIButton *acceptall;
@property(nonatomic,strong)UITableView *listtable;
@property(nonatomic,strong)NSMutableDictionary *dataoflisttable;
@end

NS_ASSUME_NONNULL_END
