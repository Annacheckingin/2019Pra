//
//  LZGPingJiaVc.m
//  FXDJ
//
//  Created by 李正国 on 2019/6/26.
//  Copyright © 2019 李正国. All rights reserved.
//

#import "LZGPingJiaVc.h"
#import "pingjiacell.h"
@interface LZGPingJiaVc ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation LZGPingJiaVc
-(instancetype)init{
    if (self=[super init]) {
        _datadic=[[NSMutableArray alloc]init];
        _fanhui=[UIButton new];
        [_fanhui setTitle:@"返回" forState:UIControlStateNormal];
        [_fanhui addTarget:self action:@selector(LZGfanhui) forControlEvents:UIControlEventTouchUpInside];
        _pingjiatableview=[[UITableView alloc]init];
        _pingjiatableview.delegate=self;
        _pingjiatableview.dataSource=self;
        _pingjiatableview.allowsSelection=NO;
_pingjiatableview.separatorStyle=UITableViewCellSeparatorStyleNone;
        _topview=[[UIView alloc]init];
_topview.backgroundColor=[UIColor colorWithRed:81/255.0 green:139/255.0 blue:249/255.0 alpha:1.0];
    }
    [self.view sd_addSubviews:@[_pingjiatableview,_topview,_fanhui]];
    //
    _topview.sd_layout
    .topSpaceToView(self.view, 0)
    .leftSpaceToView(self.view, 0)
    .widthIs(LZGSCREENWIDTH)
    .heightIs(88);
    //
    _fanhui.sd_layout
    .widthIs(80)
    .heightIs(20)
    .rightSpaceToView(self.view, 10)
    .topSpaceToView(self.view, 60);
    //
    CGFloat dibushipei;
    if (LZGSCREENHEIGHT==667) {
        dibushipei=0;
    }
    else{dibushipei=34;}
    _pingjiatableview.sd_layout
    .widthIs(LZGSCREENWIDTH)
    .leftSpaceToView(self.view, 0)
    .topSpaceToView(_topview, 0)
    .bottomSpaceToView(self.view, dibushipei);
    return self;
}
-(void)LZGfanhui{
    UIViewController *rootvc=[UIApplication sharedApplication].keyWindow.rootViewController;
    [rootvc dismissViewControllerAnimated:YES completion:nil];
}
-(void)getwebdata{
    NSString *thurl1=[NSString stringWithFormat:@"http://ios.runger.net/passchan/api/catlist"];
    AFHTTPSessionManager* manager=[AFHTTPSessionManager manager];
    NSMutableDictionary *temp=[[NSMutableDictionary alloc]init];
    [temp setObject:@"222" forKey:@"passchan_sp_cat"];
    [manager POST:thurl1 parameters:temp progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              self->_datadic=[[responseObject objectForKey:@"data"]mutableCopy];
              dispatch_async(dispatch_get_main_queue(), ^{[self->_pingjiatableview reloadData];});
          } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              [ZSProgressHUD showErrorAnimatedText:@"加载失败..."];
          }];
}
-(void)viewWillAppear:(BOOL)animated{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self getwebdata];
    // Do any additional setup after loading the view.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _datadic.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self cellHeightForIndexPath:indexPath cellContentViewWidth:LZGSCREENWIDTH tableView:tableView];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    pingjiacell *cell=[tableView dequeueReusableCellWithIdentifier:@"pingjiacell"];
    if (cell==nil) {
        cell=[[pingjiacell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"pingjiacell"];
    }
    cell.simpleordernum.text=[[_datadic objectAtIndex:[indexPath row]]objectForKey:@"passchan_sp_title"];
    cell.realordernum.text=[[_datadic objectAtIndex:[indexPath row]]objectForKey:@"passchan_sp_subtitle"];
    cell.orderday.text=[[_datadic objectAtIndex:[indexPath row]]objectForKey:@"passchan_sp_attr"];
    cell.ordertime.text=[[_datadic objectAtIndex:[indexPath row]]objectForKey:@"passchan_sp_price"];
    cell.orderaddress.text=[[_datadic objectAtIndex:[indexPath row]]objectForKey:@"passchan_sp_address"];
    cell.orderdoneday.text=[[_datadic objectAtIndex:[indexPath row]]objectForKey:@"passchan_sp_attr"];
    cell.orderdonetime.text=[[_datadic objectAtIndex:[indexPath row]]objectForKey:@"passchan_sp_num"];
    cell.pingjia.text=[[_datadic objectAtIndex:[indexPath row]]objectForKey:@"passchan_sp_field1"];
    cell.backgroundColor=[UIColor clearColor];
    return cell;
}


@end
