//
//  StoreStates.m
//  FXDJ
//
//  Created by 李正国 on 2019/6/11.
//  Copyright © 2019 李正国. All rights reserved.
//
#import "LZGlog.h"
#import "StoreStates.h"
#import "LZGPresentLabel.h"
#import "LZGStoreStates.h"
#import "LZGPingJiaVc.h"

@interface StoreStates ()

@end

@implementation StoreStates
-(LZGPingJiaVc *)pingjiaVc{
    if (_pingjiaVc==nil) {
        _pingjiaVc=[[LZGPingJiaVc alloc]init];
    }
    
    return _pingjiaVc;
}
-(instancetype)init{
    if (self=[super init]) {
        self.tabBarItem.image=[UIImage imageNamed:@"storenormal"];
        self.tabBarItem.selectedImage=[UIImage imageNamed:@"storeselected"];
        self.tabBarItem.title=@"门店状态";
        
        _meiShi=[UIButton new];
        [_meiShi setImage:[UIImage imageNamed:@"meishiimg"] forState:UIControlStateNormal];
        [_meiShi addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
        _pingJia=[UIButton new];
        [_pingJia addTarget:self action:@selector(pushoutpingjiaVc) forControlEvents:UIControlEventTouchUpInside];
        [_pingJia setImage:[UIImage imageNamed:@"pingjiaimg"] forState:UIControlStateNormal];
        _leiJiDingDan=[UIButton new];
        [_leiJiDingDan addTarget:self action:@selector(dingdan) forControlEvents:UIControlEventTouchUpInside];
        [_leiJiDingDan setImage:[UIImage imageNamed:@"leijipingjiaimg"] forState:UIControlStateNormal];
        _presentlabel=[[LZGPresentLabel alloc]init];
        _presentlabel.layer.cornerRadius=10;
        _presentlabel.clipsToBounds=YES;
        _cleanMemory=[UIButton new];
        
        _cleanMemory.titleLabel.font=[UIFont systemFontOfSize:11];
        _cleanMemory.backgroundColor=[UIColor whiteColor];
        _cleanMemory.layer.cornerRadius=10;
        _cleanMemory.clipsToBounds=YES;
        _storeimg=[UIImageView new];
        _storename=[UILabel new];
        _storename.text=@"响锅美食";
        _storestates=[LZGStoreStates new];
       //上方的蓝色底视图
        _bluetopview=[UIView  new];
        UIColor *topcolor=[UIColor colorWithRed:81/255.0 green:139/255.0 blue:249/255.0 alpha:1.0];
        _bluetopview.backgroundColor=topcolor;
        _labelmeishi=[UILabel new];
        _labelmeishi.font=[UIFont systemFontOfSize:14];
        _labelpingjia=[UILabel new];
        _labelpingjia.font=[UIFont systemFontOfSize:14];
        _labelleijidingdan=[UILabel new];
        _labelleijidingdan.font=[UIFont systemFontOfSize:14];
        [self.view sd_addSubviews:@[_bluetopview,_storestates,_storeimg,_storename,_meiShi,_pingJia,_leiJiDingDan,_presentlabel,_cleanMemory,_labelmeishi,_labelpingjia,_labelleijidingdan]];
        _bluetopview.sd_layout
        .widthIs(LZGSCREENWIDTH)
        .heightIs(88)
        .topSpaceToView(self.view, 0);
        //铺面图片
        _storeimg.sd_layout
        .widthIs(120)
        .heightIs(120)
        .topSpaceToView(self.view, 44)
        .leftSpaceToView(self.view, 44);
        _storeimg.image=[UIImage imageNamed:@"storeimg"];
        //铺面名字
        _storename.sd_layout
        .heightIs(15)
        .topSpaceToView(self.view, 65)
        .leftSpaceToView(_storeimg, 5*LZGCELLWIDTHSCALE);
        _storename.textColor=[UIColor whiteColor];
        [_storename setSingleLineAutoResizeWithMaxWidth:150];
        //美食的按钮
        _meiShi.sd_layout
        .widthIs(80)
        .heightIs(80)
        .topSpaceToView(_storeimg, 50*LZGCELLHEIGHTSCALE)
        .leftSpaceToView(self.view, 15*LZGCELLHEIGHTSCALE);
        _meiShi.backgroundColor=[UIColor clearColor];
     //
        _pingJia.sd_layout
        .widthIs(80)
        .heightIs(80)
        .topEqualToView(_meiShi)
       .centerXEqualToView(self.view);
       
        //
        _leiJiDingDan.sd_layout
        .heightIs(80)
        .widthIs(80)
         .topEqualToView(_meiShi)
        .rightSpaceToView(self.view, 15*LZGCELLWIDTHSCALE);
        //
        _labelmeishi.sd_layout
        
        .heightIs(15)
        .topSpaceToView(_meiShi, 10*LZGCELLHEIGHTSCALE)
        .centerXEqualToView(_meiShi);
        [_labelmeishi setText:@"退出登录"];
        [_labelmeishi setSingleLineAutoResizeWithMaxWidth:100];
        //
        _labelpingjia.sd_layout
        .heightIs(15)
        .widthIs(30)
        .topEqualToView(_labelmeishi)
        .centerXEqualToView(_pingJia);
        [_labelpingjia setText:@"评价"];
    
        //
        _labelleijidingdan.sd_layout
        .widthIs(60)
        .heightIs(15)
       .topEqualToView(_labelmeishi)
        .centerXEqualToView(_leiJiDingDan);
        [_labelleijidingdan setText:@"累计订单"];
        //
        _presentlabel.sd_layout
        
        .heightIs(200)
        .topSpaceToView(_labelmeishi, 40*LZGCELLHEIGHTSCALE)
       .leftSpaceToView(self.view, 20)
        .rightSpaceToView(self.view, 20)
        .centerXEqualToView(self.view);
        _presentlabel.backgroundColor=[UIColor whiteColor];
         _cleanMemory.sd_layout
        .heightIs(40)
        .topSpaceToView(_presentlabel, 10)
        .leftEqualToView(_presentlabel)
        .rightEqualToView(_presentlabel);
        _cleanMemory.selected=YES;
        [_cleanMemory setTitle:@"清理内存" forState:UIControlStateNormal];
        [_cleanMemory setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
         [_cleanMemory setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [_cleanMemory addTarget:self action:@selector(LZgclean) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
-(void)logout{
    LZGlog *logvc=[[LZGlog alloc]init];
    [ [UIApplication sharedApplication].keyWindow.rootViewController presentViewController:logvc animated:YES completion:nil];
    [ZSProgressHUD showSuccessfulAnimatedText:@"已成功退出！"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [ZSProgressHUD hideAllHUDAnimated:YES];
    });
}
-(void)LZgclean{
    [ZSProgressHUD showDpromptText:@"正在清理"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [ZSProgressHUD showSuccessfulAnimatedText:@"清理成功"];
    });
}
-(void)dingdan{
    [ZSProgressHUD showDpromptText:[NSString stringWithFormat:@"累计订单一共是%ld单！",self.pingjiaVc.datadic.count]];
}
-(void)pushoutpingjiaVc{
    UIViewController *rootvc=[UIApplication sharedApplication].keyWindow.rootViewController;
    [rootvc presentViewController:self.pingjiaVc animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor lightGrayColor];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
