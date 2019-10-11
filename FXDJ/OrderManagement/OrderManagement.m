//
//  OrderManagement.m
//  FXDJ
//
//  Created by 李正国 on 2019/6/11.
//  Copyright © 2019 李正国. All rights reserved.
//

#import "OrderManagement.h"
#import "OrderVc.h"
#import "LZGOrderManegementMeneTableviewCell.h"
#import "LZGAddGoods.h"

typedef NS_ENUM(NSInteger,LZGManegmentTable){
    tableviewid_choos,
    tableviewid_menu,
};
@interface OrderManagement ()<UITableViewDelegate,UITableViewDataSource,AddGoodsdelegate>
{
    NSInteger pressedbtnindex;
}
@property(nonatomic,strong)UIBarButtonItem *addnewgood;

@property(nonatomic,strong)NSArray *chooseitem;
@property(nonatomic,strong)NSMutableArray *menudata;
@property(nonatomic,strong)NSMutableArray *remaidata;
@property(nonatomic,strong)NSMutableArray *taocandata;
@property(nonatomic,strong)NSMutableArray *qingshidata;

@end

@implementation OrderManagement

-(void)setthdata:(NSMutableDictionary *)dic{
   
    if (pressedbtnindex!=-1) {
        LZGOrderManegementMeneTableviewCell *cell=[_menutableview cellForRowAtIndexPath:[NSIndexPath indexPathForRow:pressedbtnindex inSection:0]];
        NSMutableDictionary *dic1=[[_menudata objectAtIndex:pressedbtnindex]mutableCopy];
        [dic1 setObject:[dic objectForKey:@"passchan_sp_address"] forKey:@"passchan_sp_address"];
        
        [dic1 setObject:[dic objectForKey:@"passchan_sp_title"] forKey:@"passchan_sp_title"];
        [dic1 setObject:[dic objectForKey:@"passchan_sp_subtitle"] forKey:@"passchan_sp_subtitle"];
        [_menudata replaceObjectAtIndex:pressedbtnindex withObject:dic1];
        cell.goodsImg.image=[dic objectForKey:@"passchan_sp_address"];
        cell.goodsName.text=[dic objectForKey:@"passchan_sp_title"];
        cell.goodsPrice.text=[dic objectForKey:@"passchan_sp_subtitle"];
    }
    else{
        NSMutableDictionary *newdic=[[NSMutableDictionary alloc]init];
        [newdic setObject:[dic objectForKey:@"passchan_sp_address"] forKey:@"passchan_sp_address"];
        [newdic setObject:[dic objectForKey:@"passchan_sp_title"] forKey:@"passchan_sp_title"];
        [newdic setObject:[dic objectForKey:@"passchan_sp_subtitle"] forKey:@"passchan_sp_subtitle"];
        
        [_menudata addObject:newdic];
       [_menutableview reloadData];
    }
}
-(void)xiajia:(UIButton *)sender{
    [_menudata removeObjectAtIndex:sender.tag];
    [_menutableview deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:sender.tag inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
}
-(void)bianji:(UIButton *)sender{
     pressedbtnindex=sender.tag;
    LZGAddGoods *vc=[[LZGAddGoods alloc]init];
    vc.addgoodsname.text=[[_menudata objectAtIndex:pressedbtnindex]objectForKey:@"passchan_sp_title"];
    vc.realgoodscost.text=[[_menudata objectAtIndex:pressedbtnindex]objectForKey:@"passchan_sp_subtitle"];
    LZGOrderManegementMeneTableviewCell *cell=[_menutableview cellForRowAtIndexPath:[NSIndexPath indexPathForRow:pressedbtnindex inSection:0]];
    [vc.addgoodsimg setImage:[cell.goodsImg.image copy] forState:UIControlStateNormal];
    vc.delegate=self;
    UIViewController *rootvc=[UIApplication sharedApplication].keyWindow.rootViewController;
    [rootvc presentViewController:vc animated:YES completion:nil];
}
-(LZGAddGoods *)addgoodsVc{
    if (_addgoodsVc==nil) {
        _addgoodsVc=[[LZGAddGoods alloc]init];
    }
    return _addgoodsVc;
}
-(instancetype)init{
    if (self=[super init]) {
        _remaidata=[[NSMutableArray alloc]init];
        _taocandata=[[NSMutableArray alloc]init];
        _qingshidata=[[NSMutableArray alloc]init];
        _chooseitem=[NSArray arrayWithObjects:@"热卖",@"套餐",@"轻食", nil];
        _choselist=[[UITableView alloc]init];
        _choselist.tag=tableviewid_choos;
        _choselist.separatorStyle= UITableViewCellSeparatorStyleNone;
    
        _menutableview=[[UITableView alloc]init];
        _menutableview.tag=tableviewid_menu;
    
_menutableview.separatorStyle=UITableViewCellSeparatorStyleNone;
        _addnewgood=[[UIBarButtonItem  alloc]init];
        [_addnewgood setTitle:@"添加商品"];
        self.title=@"商品管理";
        self.tabBarItem.image=[UIImage imageNamed:@"goodsnormal"];
        self.tabBarItem.selectedImage=[UIImage imageNamed:@"goodsselected"];
        self.tabBarItem.title=@"订单管理";
    
        //self.navigationController.navigationBar.hidden=YES;
        //self.navigationController.navigationBar.translucent=NO;
    /*    UINavigationBar *bar=[UINavigationBar appearance];
        UIColor *color=[UIColor colorWithRed:85/255.0 green:126/255.0 blue:252/255.0 alpha:1];
        UIImage *image=[OrderManagement imageWithPureColor:color];
        [bar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];*/
      

        
    }
    return self;
}

-(void)setUpTheUi{
    OrderVc *vvc=(OrderVc*)[UIApplication sharedApplication].keyWindow.rootViewController.tabBarController.viewControllers.firstObject;
    UIView *Matopview=vvc.topView;
    _choselist.frame=CGRectMake(0, 0+Matopview.size.height, 100, LZGSCREENHEIGHT-Matopview.size.height-self.tabBarController.tabBar.size.height);
    _choselist.delegate=self;
    _choselist.dataSource=self;
    _choselist.backgroundColor=[UIColor lightGrayColor];
    _choselist.scrollEnabled=NO;
    _menutableview.frame=CGRectMake(100, 0+Matopview.size.height, LZGSCREENWIDTH-100, LZGSCREENHEIGHT-self.tabBarController.tabBar.size.height);
    _menutableview.backgroundColor=[UIColor whiteColor];
    _menutableview.delegate=self;
    _menutableview.dataSource=self;
    [self.view addSubview:_choselist];
    [self.view addSubview:_menutableview];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem=_addnewgood;
    [self setUpTheUi];
    self.navigationItem.rightBarButtonItem.target=self;
self.navigationItem.rightBarButtonItem.action=@selector(addgoods);
    [ZSProgressHUD showHUDShowText:@"数据加载中.."];
    [self performSelector:@selector(ldelayload) withObject:nil afterDelay:1];
    [self webdata1];
    [self webdata2];
    [self webdata3];
    [self.choselist selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
    //[self tableView:_choselist didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    // Do any additional setup after loading the view.
}
-(void)webdata3{
    NSString *thurl1=[NSString stringWithFormat:@"http://ios.runger.net/passchan/api/catlist"];
    AFHTTPSessionManager* manager=[AFHTTPSessionManager manager];
    NSMutableDictionary *temp1=[[NSMutableDictionary alloc]init];
    [temp1 setObject:@"123" forKey:@"passchan_sp_cat"];
    [manager POST:thurl1 parameters:temp1 progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              
              self->_qingshidata=[[responseObject objectForKey:@"data"]mutableCopy];
             
             
              
              [ self->_menutableview reloadData];
          } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              
          }];
}
-(void)webdata2{
    NSString *thurl1=[NSString stringWithFormat:@"http://ios.runger.net/passchan/api/catlist"];
    AFHTTPSessionManager* manager=[AFHTTPSessionManager manager];
    NSMutableDictionary *temp1=[[NSMutableDictionary alloc]init];
    [temp1 setObject:@"122" forKey:@"passchan_sp_cat"];
    [manager POST:thurl1 parameters:temp1 progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             
              self->_taocandata=[[responseObject objectForKey:@"data"]mutableCopy];
              
              [ self->_menutableview reloadData];
          } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    
          }];
}
-(void)webdata1{
    NSString *thurl1=[NSString stringWithFormat:@"http://ios.runger.net/passchan/api/catlist"];
    AFHTTPSessionManager* manager=[AFHTTPSessionManager manager];
    NSMutableDictionary *temp=[[NSMutableDictionary alloc]init];
    [temp setObject:@"121" forKey:@"passchan_sp_cat"];
    
   [manager POST:thurl1 parameters:temp progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             
              self->_remaidata=[[responseObject objectForKey:@"data"]mutableCopy];
              
              dispatch_async(dispatch_get_main_queue(), ^{
                  self->_menudata=self->_remaidata;
                  [self->_menutableview reloadData];
                  
              });
          } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              [ZSProgressHUD showErrorAnimatedText:@"加载失败.."];
          }];
    //
   /* NSMutableDictionary *temp1=[[NSMutableDictionary alloc]init];
    [temp1 setObject:@"122" forKey:@"passchan_sp_cat"];
    [manager POST:thurl1 parameters:temp1 progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              self->_taocandata=[[responseObject objectForKey:@"data"]mutableCopy];
               [ self->_menutableview reloadData];
          } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             
          }];
    //
    NSMutableDictionary *temp2=[[NSMutableDictionary alloc]init];
    [temp2 setObject:@"123" forKey:@"passchan_sp_cat"];
    [manager POST:thurl1 parameters:temp2 progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              self->_qingshidata=[[responseObject objectForKey:@"data"]mutableCopy];
               [ self->_menutableview reloadData];
          } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
          }];*/
  
}
-(void)ldelayload{
    [ZSProgressHUD hideAllHUDAnimated:YES];
}
-(void)addgoods{
     pressedbtnindex=-1;
    UIViewController *rootvc=[UIApplication sharedApplication].keyWindow.rootViewController;
    LZGAddGoods *newone=[[LZGAddGoods alloc]init];
    newone.delegate=self;
   
    [rootvc presentViewController:newone animated:YES completion:^{
    }];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger num=0;
    switch (tableView.tag) {
        case tableviewid_choos:
            num=3;
            break;
        case tableviewid_menu:
            num=_menudata.count;
            break;
    }
    return num;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *LZGTableviewmenu=@"LZGTableviewmenu";
    static NSString *LZGTableviewchoose=@"LZGTableviewchoose";
  UITableViewCell*  cell;
    id url;
     id str=[[_menudata objectAtIndex:[indexPath row]]objectForKey:@"passchan_sp_address"];
    if ([str isKindOfClass:[NSString class]]) {
     url=[NSURL URLWithString:str];
    }
    else if ([str isKindOfClass:[UIImage class]]){
        url=str;
    }
    
    LZGOrderManegementMeneTableviewCell *cell1;
    switch (tableView.tag) {
case tableviewid_menu:
            //商品列表
            cell1=[tableView dequeueReusableCellWithIdentifier:LZGTableviewmenu];
            if (cell1==nil) {
            cell1=[[LZGOrderManegementMeneTableviewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:LZGTableviewmenu];
                
            }
            [cell1.editbtn addTarget:self action:@selector(bianji:) forControlEvents:UIControlEventTouchUpInside];
            [cell1.cancelbtn addTarget:self action:@selector(xiajia:) forControlEvents:UIControlEventTouchUpInside];
            cell1.cancelbtn.tag=indexPath.row;
            cell1.editbtn.tag=indexPath.row;
            cell1.goodsName.text=[[_menudata objectAtIndex:indexPath.row]objectForKey:@"passchan_sp_title"];
            cell1.goodsPrice.text=[[_menudata objectAtIndex:[indexPath row]]objectForKey:@"passchan_sp_subtitle"];
            if ([url isKindOfClass:[NSURL class]]) {
                cell1.goodsImg.yy_imageURL=url;
            }
            else{
                cell1.goodsImg.image=url;
            }
            cell1.cancelbtn.tag=indexPath.row;
            cell1.editbtn.tag=indexPath.row;
    cell1.selectionStyle=UITableViewCellSelectionStyleNone;
            cell=cell1;
            break;
 case tableviewid_choos:
            //商品种类选择
            cell=[tableView dequeueReusableCellWithIdentifier:LZGTableviewchoose];
            if (cell==nil) {
                cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:LZGTableviewchoose];
        cell.textLabel.text=_chooseitem[indexPath.row];
                cell.backgroundColor=[UIColor clearColor];
            };
            break;
    }

    return cell;
}
-(void)changetableview:(NSIndexPath*)indexpath{
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{   if(tableView.tag==tableviewid_choos){
    switch (indexPath.row) {
        case 0:
           _menudata=_remaidata;
            [self.menutableview reloadData];
            break;
        case 1:
            _menudata=_taocandata;
            
            [self.menutableview reloadData];
            break;
        case 2:
           _menudata=_qingshidata;
            [self.menutableview reloadData];
            
            break;
    }}
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag==tableviewid_menu) {
        return 150;
    }
    return 50;
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
