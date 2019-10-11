//
//  MainViewController.m
//  FXDJ
//
//  Created by 李正国 on 2019/6/11.
//  Copyright © 2019 李正国. All rights reserved.
//

#import "LZGMainViewController.h"
#import "OrderVc.h"
#import "OrderManagement.h"
#import "StoreStates.h"
@interface LZGMainViewController ()
@property(nonatomic,strong)NSArray *vcarray;
@end

@implementation LZGMainViewController
-(instancetype)init{
    if (self=[super init]) {
        _lzgtabBarControler=[[UITabBarController alloc]init];
}
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:_lzgtabBarControler.view];
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
