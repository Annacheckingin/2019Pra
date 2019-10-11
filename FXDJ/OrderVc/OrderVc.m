//
//  OrderVc.m
//  FXDJ
//
//  Created by 李正国 on 2019/6/11.
//  Copyright © 2019 李正国. All rights reserved.
//
#import "sys/utsname.h"
#import "FreshOrderCelll.h"
#import "OrderVc.h"
#import "FreshOrderView.h"
#import "IntenseView.h"
#import "CompletedView.h"
#import "IntenseOrderCell.h"
#import "OrderCompleteCell.h"
#define LZGtopbtntoleft 20
#define LZGtopbtnwidth   45
#define LZGtopbtnheight 44
extern NSString * const LZGFreshordercellidentifier;
extern NSString *const LZGIntensecellIdentifier;
extern NSString *const LZGOrderCompleteCellidentifier;
@interface OrderVc ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIView *currentview;
@property(nonatomic,strong)NSMutableArray *data_f_f;
@property(nonatomic,strong)NSMutableArray *data_f_s;
@property(nonatomic,strong)NSMutableArray *data_f_t;
@end

@implementation OrderVc

-(instancetype)init{
    if (self=[super init]) {
        _data_f_f=[[NSMutableArray alloc]init];
        self.tabBarItem.image=[UIImage imageNamed:@"ordernormal"];
        self.tabBarItem.selectedImage=[UIImage imageNamed:@"orderselected"];
        _topView=[[UIView alloc]init];
        _btn1=[[UIButton alloc]init];
        [_btn1 addTarget:self action:@selector(btn1Clicked) forControlEvents:UIControlEventTouchUpInside];
        _btn2=[[UIButton alloc]init];
        [_btn2 addTarget:self action:@selector(btn2Cicked) forControlEvents:UIControlEventTouchUpInside];
        _btn3=[[UIButton alloc]init];
        [_btn3 addTarget:self action:@selector(btn3Clicked) forControlEvents:UIControlEventTouchUpInside];
        _freshorderview=[[FreshOrderView alloc]init];
        _intenseview=[[IntenseView alloc]init];
        _completedview=[[CompletedView alloc]init];
    }
    return self;
}
-(void)btn1Clicked{
    [ZSProgressHUD showHUDShowText:@"正在加载视图.."];
    [self performSelector:@selector(delayLoad) withObject:nil afterDelay:2];
    
   // [self storethedata];
    [_currentview removeFromSuperview];
     [self.view addSubview:_freshorderview];
    self.currentview=_freshorderview;
    [ _freshorderview.listtable reloadData];
}
-(void)delayLoad{
    [self web1];
    [ZSProgressHUD hideAllHUDAnimated:YES];
}
-(void)btn2Cicked{
    /* static dispatch_once_t onceToken;
   dispatch_once(&onceToken, ^{
         [self getThestoredata];
         [self->_intenseview.intenseOrderList reloadData];
    });*/
    [_intenseview.intenseOrderList reloadData];
    [_currentview removeFromSuperview];
    [self.view addSubview:_intenseview];
    self.currentview=_intenseview;
}
-(void)btn3Clicked{
    [_currentview removeFromSuperview];
    [self.view addSubview:_completedview];
    
    self.currentview=_completedview;
    [_completedview.orderCompletelist reloadData];
   
}
-(void)storethedata{
    NSLog(@"storing");
    NSString *thepath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *docpath1=[thepath stringByAppendingPathComponent:@"fs_bendi_shuju.plist"];
    NSString *docpath2=[thepath stringByAppendingPathComponent:@"ft_bendi_shuju.plist"];
    NSFileManager *manager=[NSFileManager defaultManager];
    if (![manager fileExistsAtPath:docpath1]) {
        BOOL rrr=[manager createFileAtPath:docpath1 contents:nil attributes:nil];
        if (!rrr) {
       [ZSProgressHUD showErrorAnimatedText:@"本地资源不够，无法存储数据"];
        }
        else
        {
            NSLog(@"创建了文件");
            BOOL suc=[_data_f_s writeToFile:docpath1 atomically:YES];
            if (!suc) {
              [ZSProgressHUD showErrorAnimatedText:@"本地存储数据出错"];
            }
            else{
               
            }
        }
    }
    else{
        BOOL suc=[_data_f_s writeToFile:docpath1 atomically:YES];
        if (!suc) {
          [ZSProgressHUD showErrorAnimatedText:@"本地存储数据出错"];
        }
        else{
         
        }
    }
    /////////////////
    if (![manager fileExistsAtPath:docpath2]) {
        BOOL rrr=[manager createFileAtPath:docpath2 contents:nil attributes:nil];
        if (!rrr) {
            [ZSProgressHUD showErrorAnimatedText:@"资源不够无法本地存储数据"];
        }
        else
        {
            
            BOOL suc=[_data_f_t writeToFile:docpath2 atomically:YES];
            if (!suc) {
               [ZSProgressHUD showErrorAnimatedText:@"本地存储数据出错"];
            }
            else{
                NSLog(@"写入成功");
            }
        }
    }
    else{
        BOOL suc=[_data_f_t writeToFile:docpath2 atomically:YES];
        if (!suc) {
            [ZSProgressHUD showErrorAnimatedText:@"本地存储数据出错"];
        }
        else{
           
        }
    }
    //////
}
-(void)getThestoredata{
    NSString *thepath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *docpath1=[thepath stringByAppendingPathComponent:@"fs_bendi_shuju.plist"];
     NSString *docpath2=[thepath stringByAppendingPathComponent:@"ft_bendi_shuju.plist"];
    NSFileManager *manager=[NSFileManager defaultManager];
    if (![manager fileExistsAtPath:docpath1]) {
    
        NSDictionary *tempdic=[NSDictionary dictionaryWithObjectsAndKeys:@"天府广场", @"passchan_sp_address",@"12",@"passchan_sp_title",@"e2736198273",@"passchan_sp_subtitle",@"2019/4/6",@"passchan_sp_num",@"8:00",@"passchan_sp_field1",@"蛋炒饭",@"passchan_sp_attr",@"18.00",@"passchan_sp_price",nil];
        _data_f_s=[[NSMutableArray alloc]initWithObjects:tempdic, nil];
    }
    else{
       
        _data_f_s=[NSMutableArray arrayWithContentsOfFile:docpath1];
       
    }
    //////////
    if (![manager fileExistsAtPath:docpath2]) {
      
        NSDictionary *tempdic=[NSDictionary dictionaryWithObjectsAndKeys:@"天府广场", @"passchan_sp_address",@"12",@"passchan_sp_title",@"e2736198273",@"passchan_sp_subtitle",@"2019/4/6",@"passchan_sp_num",@"8:00",@"passchan_sp_field1",@"蛋炒饭",@"passchan_sp_attr",@"18.00",@"passchan_sp_price",nil];
        _data_f_t=[[NSMutableArray alloc]initWithObjects:tempdic, nil];
    }
    else{
    
        _data_f_t=[NSMutableArray arrayWithContentsOfFile:docpath2];
       // NSLog(@"---%@----",_data_f_t);
    }
    ////////
}
-(void)setupBasicUi{
    self.view.backgroundColor=[UIColor whiteColor];
    
    float lzgscreenwidth=self.view.bounds.size.width;
    float gap=(lzgscreenwidth-2*LZGtopbtntoleft-3*LZGtopbtnwidth)/2;
    CGPoint btn1origin=CGPointMake(LZGtopbtntoleft, 44);
    CGPoint btn2origin=CGPointMake(LZGtopbtntoleft+LZGtopbtnwidth+gap, 44);
    CGPoint btn3origin=CGPointMake(lzgscreenwidth-LZGtopbtntoleft-LZGtopbtnwidth, 44);
    _btn1.frame=CGRectMake(btn1origin.x, btn1origin.y, LZGtopbtnwidth, LZGtopbtnheight);
    [_btn1 setTitle:@"订单" forState:UIControlStateNormal];
    [_btn1 setFont:[UIFont systemFontOfSize:13]];
    _btn2.frame=CGRectMake(btn2origin.x, btn2origin.y, LZGtopbtnwidth, LZGtopbtnheight);
    [_btn2 setTitle:@"催单" forState:UIControlStateNormal];
    [_btn2 setFont:[UIFont systemFontOfSize:13]];
    _btn3.frame=CGRectMake(btn3origin.x, btn3origin.y, LZGtopbtnwidth, LZGtopbtnheight);
    [_btn3 setTitle:@"已完成" forState:UIControlStateNormal];
    [_btn3 setFont:[UIFont systemFontOfSize:13]];
    [_topView addSubview:_btn3];
    [_topView addSubview:_btn2];
    [_topView addSubview:_btn1];
    for (UIView *v in _topView.subviews) {
        v.backgroundColor=[UIColor clearColor];
    }
    _topView.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 88);
    _topView.backgroundColor=[UIColor colorWithRed:81/255.0 green:139/255.0 blue:249/255.0 alpha:1.0];
    [self.view addSubview:_topView];
    self.tabBarItem.title=@"订单";
}



//一键接受
-(void)acceptallorder{
    [_data_f_s addObjectsFromArray:_data_f_f];
    [_data_f_f removeAllObjects];
    [self.freshorderview.listtable reloadData];
}
-(void)cellbtnclicked:(UIButton *)sender{
     NSIndexPath *indexpath=[NSIndexPath indexPathForRow:1 inSection:sender.tag];
    id item=[_data_f_f objectAtIndex:indexpath.section];
    [_data_f_s addObject:item];
    [_data_f_f removeObjectAtIndex:indexpath.section];
    [self.freshorderview.listtable deleteSections:[NSIndexSet indexSetWithIndex:sender.tag] withRowAnimation:UITableViewRowAnimationFade];
}
-(void)sendrightnow:(UIButton*)btn{
    [_data_f_t addObject:[_data_f_s objectAtIndex:btn.tag]];
    [_data_f_s removeObjectAtIndex:[btn tag]];
    if (_data_f_t.count==31) {
        [_data_f_t removeObjectAtIndex:0];
    }
    [_intenseview.intenseOrderList deleteSections:[NSIndexSet indexSetWithIndex:btn.tag] withRowAnimation:UITableViewRowAnimationFade];
    [_intenseview.intenseOrderList reloadData];
}
-(void)V1setupAcceptBtnAndTableview{
    CGFloat barheight=self.tabBarController.tabBar.height*LZGCELLHEIGHTSCALE;
   _freshorderview.frame=CGRectMake(0, 0+self.topView.frame.size.height, self.view.frame.size.width, self.view.bounds.size.height-barheight);
//_freshorderview.sd_layout.topSpaceToView(self.view, 88*LZGCELLHEIGHTSCALE);
    [_freshorderview.acceptall addTarget:self action:@selector(acceptallorder) forControlEvents:UIControlEventTouchUpInside];
    _freshorderview.listtable.delegate=self;
    _freshorderview.listtable.dataSource=self;
    [_freshorderview.listtable registerClass:[FreshOrderCelll class] forCellReuseIdentifier:LZGFreshordercellidentifier];
    _freshorderview.backgroundColor=[UIColor colorWithRed:223 green:223 blue:223 alpha:1.0];
}
    
-(void)V2setupAcceptBtnAndTableview{
    CGFloat barheight=self.tabBarController.tabBar.height*LZGCELLHEIGHTSCALE;
_intenseview.frame=CGRectMake(0,0+self.topView.frame.size.height, self.view.bounds.size.width, self.view.bounds.size.height-barheight);
    _intenseview.intenseOrderList.delegate=self;
    _intenseview.intenseOrderList.dataSource=self;
    [_intenseview.intenseOrderList registerNib:[UINib nibWithNibName:@"IntenseOrderCell" bundle:nil] forCellReuseIdentifier:LZGIntensecellIdentifier];
}
-(void)V3setupAcceptBtnAndTableview{
    CGFloat barheight=self.tabBarController.tabBar.height*LZGCELLHEIGHTSCALE;
    _completedview.frame=CGRectMake(0, 88, self.view.bounds.size.width, self.view.bounds.size.height-barheight);
    _completedview.orderCompletelist.delegate=self;
    _completedview.orderCompletelist.dataSource=self;
    [_completedview.orderCompletelist registerNib:[UINib nibWithNibName:@"IntenseOrderCell" bundle:nil] forCellReuseIdentifier:LZGIntensecellIdentifier];
_completedview.orderCompletelist.separatorStyle=UITableViewCellSeparatorStyleNone;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupBasicUi];
    [self V1setupAcceptBtnAndTableview];
    [self V2setupAcceptBtnAndTableview];
    [self V3setupAcceptBtnAndTableview];
    
    [self btn1Clicked];
    [self getThestoredata];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat height = 50.0;
    switch (tableView.tag) {
        case LZGFreshOrderTableview:
                height=[self cellHeightForIndexPath:indexPath cellContentViewWidth:LZGSCREENWIDTH tableView:tableView];
            break;
        case LZGIntenseOrderTableview:
           height= 180;
            break;
        case LZGCompleteOrderTableview:
            height= 110;
    }
    return height;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSUInteger nums=0;
    switch (tableView.tag) {
        case LZGFreshOrderTableview:
            nums=_data_f_f.count;
            break;
         case LZGIntenseOrderTableview:
            nums=_data_f_s.count;
            break;
        case LZGCompleteOrderTableview:
            nums=_data_f_t.count;
    }
    return nums;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view1;
    switch (tableView.tag)
    {
        
    case LZGFreshOrderTableview:
            view1=[UIView new];
            view1.backgroundColor=[UIColor lightGrayColor];
            break;
    case LZGIntenseOrderTableview:
            view1=[UIView new];
            view1.backgroundColor=[UIColor lightGrayColor];
            break;
            case LZGCompleteOrderTableview:
            view1=[UIView new];
            view1.backgroundColor=[UIColor lightGrayColor];
    }
    return view1;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    CGFloat height;
    switch (tableView.tag) {
        case LZGFreshOrderTableview:
        case LZGIntenseOrderTableview:
            height=10;
            break;
            default:
            height=10;
            break;
    }
    return height;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if (tableView.tag==LZGFreshOrderTableview) {
        FreshOrderCelll*cell=[tableView dequeueReusableCellWithIdentifier:LZGFreshordercellidentifier];
        if (cell==nil) {
            cell=[[FreshOrderCelll alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:LZGFreshordercellidentifier];
        }
        //单号
        cell.cellordernum.text=[[_data_f_f objectAtIndex:[indexPath section]] objectForKey:@"passchan_sp_title"];
        cell.cellprecisenum.text=[[_data_f_f objectAtIndex:[indexPath section]] objectForKey:@"passchan_sp_subtitle"];
        cell.cellorderaddress.text=[[_data_f_f objectAtIndex:[indexPath section]] objectForKey:@"passchan_sp_address"];
        cell.cellorderday.text=[[_data_f_f objectAtIndex:[indexPath section]] objectForKey:@"passchan_sp_num"];
        cell.cellorderprecisetime.text=[[_data_f_f objectAtIndex:[indexPath section]] objectForKey:@"passchan_sp_field1"];
        cell.cellbowlprice.text=[[_data_f_f objectAtIndex:[indexPath section]] objectForKey:@"passchan_sp_field4"];
        cell.cellattention.text=[[_data_f_f objectAtIndex:[indexPath section]] objectForKey:@"passchan_sp_username"];
        cell.celltranscost.text=@"0.00";
        cell.cellfoodname.text=[[_data_f_f objectAtIndex:[indexPath section]] objectForKey:@"passchan_sp_attr"];
        cell.cellfoodprice.text=[[_data_f_f objectAtIndex:[indexPath section]] objectForKey:@"passchan_sp_price"];        cell.celltotalcost.text=[NSString stringWithFormat:@"%.2lf",cell.cellbowlprice.text.floatValue+cell.cellfoodprice.text.floatValue+cell.celltranscost.text.floatValue];
        NSString *urlstr=[[_data_f_f objectAtIndex:[indexPath section]] objectForKey:@"passchan_sp_nickname"];
        NSURL *url=[NSURL URLWithString:urlstr];
        cell.cellfoodimg.yy_imageURL=url;
        [cell.cellacceptorderbtn addTarget:self action:@selector(cellbtnclicked:) forControlEvents:UIControlEventTouchUpInside];
        cell.cellacceptorderbtn.tag=indexPath.section;
        return cell;
    }
    else if (tableView.tag==LZGIntenseOrderTableview){
        IntenseOrderCell *cell=[tableView dequeueReusableCellWithIdentifier:LZGIntensecellIdentifier];
        if (cell==nil) {
            cell=[[IntenseOrderCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:LZGIntensecellIdentifier];
        }
        cell.orderNum.text=[[_data_f_s objectAtIndex:[indexPath section]]objectForKey:@"passchan_sp_title"];
        cell.preciseOrderNum.text=[[_data_f_s objectAtIndex:[indexPath section]]objectForKey:@"passchan_sp_subtitle"];
        cell.payDay.text=[[_data_f_s objectAtIndex:[indexPath section]]objectForKey:@"passchan_sp_num"];
        cell.payTime.text=[[_data_f_s objectAtIndex:[indexPath section]]objectForKey:@"passchan_sp_field1"];
        cell.preciseAddress.text=[[_data_f_s objectAtIndex:[indexPath section]]objectForKey:@"passchan_sp_address"];
        cell.urgeOrderTime.text=[NSString stringWithFormat:@"%.2lf", cell.payTime.text.doubleValue+2.00];
        cell.foodName.text=[[_data_f_s objectAtIndex:[indexPath section]]objectForKey:@"passchan_sp_attr"];
        cell.foodCost.text=[[_data_f_s objectAtIndex:[indexPath section]]objectForKey:@"passchan_sp_price"];
        cell.backgroundColor=[UIColor clearColor];
        CGRect cellframewidth=cell.frame;
        cellframewidth.size.width=LZGSCREENWIDTH;
        cell.frame=cellframewidth;
        cell.tag=indexPath.section;
        [cell.sendOrder addTarget:self action:@selector(sendrightnow:) forControlEvents:UIControlEventTouchUpInside];
       // for (UIView *v in cell.contentView.subviews) {
       //     v.backgroundColor=[UIColor greenColor];
       // }
        return cell;
    }
    IntenseOrderCell *cell=[tableView dequeueReusableCellWithIdentifier:LZGIntensecellIdentifier];
    [cell.sendOrder removeFromSuperview];
    cell.sendOrder=nil;
    cell.orderNum.text=[[_data_f_t objectAtIndex:[indexPath section]]objectForKey:@"passchan_sp_title"];
    cell.preciseOrderNum.text=[[_data_f_t objectAtIndex:[indexPath section]]objectForKey:@"passchan_sp_subtitle"];
    cell.payDay.text=[[_data_f_t objectAtIndex:[indexPath section]]objectForKey:@"passchan_sp_num"];
    cell.payTime.text=[[_data_f_t objectAtIndex:[indexPath section]]objectForKey:@"passchan_sp_field1"];
    cell.preciseAddress.text=[[_data_f_t objectAtIndex:[indexPath section]]objectForKey:@"passchan_sp_address"];
    cell.urgeOrderTime.text=[NSString stringWithFormat:@"%.2lf", cell.payTime.text.doubleValue+2.00];
    cell.foodName.text=[[_data_f_t objectAtIndex:[indexPath section]]objectForKey:@"passchan_sp_attr"];
    cell.foodCost.text=[[_data_f_t objectAtIndex:[indexPath section]]objectForKey:@"passchan_sp_price"];
    [cell setupAutoHeightWithBottomView:cell.foodName bottomMargin:5*LZGCELLHEIGHTSCALE];
   /* if (cell==nil) {
        cell=[[NSBundle mainBundle] loadNibNamed:@"FreshOrderCelll" owner:self options:nil].lastObject;
    }*/
   // NSLog(@"%lf",cell.frame.size.width
    
        return cell;
}

-(void)web1{
    NSString *thurl1=[NSString stringWithFormat:@"http://ios.runger.net/passchan/api/catlist"];
    AFHTTPSessionManager* manager=[AFHTTPSessionManager manager];
    NSMutableDictionary *temp=[[NSMutableDictionary alloc]init];
    [temp setObject:@"11" forKey:@"passchan_sp_cat"];
    [manager POST:thurl1 parameters:temp progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             // NSLog(@"%@",responseObject);
              self->_data_f_f=[[responseObject objectForKey:@"data"]mutableCopy];
              [self->_freshorderview.listtable reloadData];
          } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              [ZSProgressHUD showErrorAnimatedText:@"加载失败..."];
          }];
  

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
