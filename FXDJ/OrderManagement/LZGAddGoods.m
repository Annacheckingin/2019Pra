//
//  LZGAddGoods.m
//  FXDJ
//
//  Created by 李正国 on 2019/6/26.
//  Copyright © 2019 李正国. All rights reserved.
//

#import "LZGAddGoods.h"
#import "OrderManagement.h"
//UINavigationControllerDelegate,UIImagePickerControllerDelegate
@interface LZGAddGoods ()<UITextFieldDelegate,UITextViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(nonatomic,strong)UIImagePickerController *imgpicker;
@end

@implementation LZGAddGoods

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}
-(BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    CGFloat thegap=self.view.frame.size.height- textView.frame.origin.y-textView.frame.size.height;
    
    CGFloat ismove=thegap-260;
    if (ismove<0) {
        CGRect theoldframe=self.view.frame;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        theoldframe.origin.y+=ismove;
        self.view.frame=theoldframe;
        [UIView commitAnimations];
    }
    return YES;
}
-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
    
    CGPoint theoldorigin=CGPointMake(0, 0);
    CGRect theoldrect=self.view.frame;
    theoldrect.origin=theoldorigin;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    self.view.frame=theoldrect;
    [UIView commitAnimations];
    return YES;
}
-(instancetype)init{
    if (self=[super init]) {
       
        _quxiao=[UIButton new];
        [_quxiao setTitle:@"取消" forState:UIControlStateNormal];
        [_quxiao addTarget:self action:@selector(quxiaohoutui) forControlEvents:UIControlEventTouchUpInside];
        _topview=[UIView new];
        _topview.backgroundColor=[UIColor colorWithRed:81/255.0 green:139/255.0 blue:249/255.0 alpha:1.0];
        _addgoodsname=[[UITextField alloc]init];
        _addgoodsname.delegate=self;
        _addgoodsname.backgroundColor=[UIColor lightGrayColor];
        _addgoodsname.placeholder=@"请输入商品名称";
        _addgoodsname.font=[UIFont systemFontOfSize:14];
        _addgoodsname.layer.cornerRadius=7;
        _addgoodsname.clipsToBounds=YES;
        _addgoodsimg=[[UIButton alloc]init];
       [_addgoodsimg setImage:[UIImage imageNamed:@"addgoodsimg"] forState:UIControlStateNormal];
        [_addgoodsimg addTarget:self action:@selector(tijiaotupian) forControlEvents:UIControlEventTouchUpInside];
        _addgoodstype=[[UILabel alloc]init];
        _addgoodstype.text=@"商品类型";
        _addtranscost=[[UILabel alloc]init];
        _addtranscost.text=@"运费";
        _morentranscost=[[UILabel alloc]init];
        _morentranscost.text=@"统一运费0.00";
        _labelgoodscost=[[UILabel alloc]init];
        _labelgoodscost.text=@"价格";
        _realgoodscost=[[UITextField alloc]init];
        _realgoodscost.delegate=self;
        _realgoodscost.placeholder=@"请输入商品价格";
        _goodsintroduce=[[UILabel alloc]init];
        _goodsintroduce.text=@"商品图文介绍";
        _realintroduce=[[UITextView alloc]init];
        _realintroduce.delegate=self;
        _realintroduce.backgroundColor=[UIColor lightGrayColor];
        _realintroduce.delegate=self;
        _realintroduce.layer.cornerRadius=10;
        _realintroduce.clipsToBounds=YES;
        _queren=[[UIButton alloc]init];
        [_queren setTitle:@"确认提交" forState:UIControlStateNormal];
        [_queren setBackgroundColor:[UIColor colorWithRed:81/255.0 green:139/255.0 blue:249/255.0 alpha:1.0]];
        [_queren setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _queren.layer.cornerRadius=10;
        _queren.clipsToBounds=YES;
        [_queren addTarget:self action:@selector(LZGqueren) forControlEvents:UIControlEventTouchUpInside];
        _typechose=[UIButton new];
        [_typechose setTitle:@"套餐" forState:UIControlStateNormal];
        [_typechose setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.view sd_addSubviews:@[_topview,_quxiao,_addgoodsname,_addgoodsimg,_addgoodstype,_addtranscost,_morentranscost,_labelgoodscost,_realgoodscost,_goodsintroduce,_realintroduce,_queren,_typechose]];
        [self setupUi];
    }
    return self;
}
-(void)tijiaotupian{
    //自定义消息框
    // 1.判断相册是否可以打开
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) return;
    // 2. 创建图片选择控制器
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    /**
     typedef NS_ENUM(NSInteger, UIImagePickerControllerSourceType) {
     UIImagePickerControllerSourceTypePhotoLibrary, // 相册
     UIImagePickerControllerSourceTypeCamera, // 用相机拍摄获取
     UIImagePickerControllerSourceTypeSavedPhotosAlbum // 相簿
     }
     */
    // 3. 设置打开照片相册类型(显示所有相簿)
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    // ipc.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    // 照相机
    // ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    // 4.设置代理
    ipc.delegate = self;
    // 5.modal出这个控制器
    [self presentViewController:ipc animated:YES completion:nil];
}

#pragma mark -- UIImagePickerControllerDelegate--
// 获取图片后的操作
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey, id> *)info
{
    // 销毁控制器
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    // 设置图片
    [_addgoodsimg setImage:[info objectForKey:UIImagePickerControllerOriginalImage] forState:UIControlStateNormal];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:^{}];
}
-(void)LZGqueren{
    NSMutableDictionary *dic=[NSMutableDictionary dictionaryWithObjectsAndKeys:[self.addgoodsname.text copy],@"passchan_sp_title",[self.realgoodscost.text copy],@"passchan_sp_subtitle",
self.addgoodsimg.imageView.image,@"passchan_sp_address",nil];
   
    [self.delegate setthdata:dic];
    [self quxiaohoutui];

}
-(void)quxiaohoutui{
    UIViewController *rootvc=[UIApplication sharedApplication].keyWindow.rootViewController;
    [rootvc dismissViewControllerAnimated:YES completion:^{
    }];
    //OrderManagement *vc1=(OrderManagement *)vc;
}
-(void)setupUi{
   _topview.sd_layout
    .widthIs(LZGSCREENWIDTH)
    .heightIs(88);
    //
    _addgoodsname.sd_layout
    .heightIs(30)
    .topSpaceToView(_topview, 5)
    .leftSpaceToView(self.view, 10)
    .rightSpaceToView(self.view, 10);
    //
    _quxiao.sd_layout
    .widthIs(80)
    .heightIs(20)
    .rightSpaceToView(self.view, 10)
    .topSpaceToView(self, 60);
    //
    _addgoodsimg.sd_layout
    .widthIs(80)
    .heightIs(80)
    .topSpaceToView(_addgoodsname, 20)
    .leftSpaceToView(self.view, 20);
    //
    _addgoodstype.sd_layout
    .heightIs(14)
    .topSpaceToView(_addgoodsimg, 50)
    .leftEqualToView(_addgoodsimg);
    [_addgoodstype setSingleLineAutoResizeWithMaxWidth:100];
    _typechose.sd_layout
    .widthIs(50)
    .heightIs(14)
    .topEqualToView(_addgoodstype)
    .rightSpaceToView(self.view, 60);
    //
    _addtranscost.sd_layout
    .widthIs(50)
    .heightIs(14)
    .topSpaceToView(_addgoodstype, 50)
    .leftEqualToView(_addgoodstype);
    //
    _morentranscost.sd_layout
    .heightIs(14)
    .topEqualToView(_addtranscost)
    .centerXEqualToView(_typechose);
    [_morentranscost setSingleLineAutoResizeWithMaxWidth:200];
    //
    _labelgoodscost.sd_layout
    .topSpaceToView(_addtranscost, 50)
    .leftEqualToView(_addtranscost)
    .heightIs(14);
    [_labelgoodscost setSingleLineAutoResizeWithMaxWidth:200];
    //
    _realgoodscost.sd_layout
    .widthIs(250)
    .heightRatioToView(_labelgoodscost, 1)
    .topEqualToView(_labelgoodscost)
    .leftSpaceToView(_labelgoodscost, 5);
    //
    _goodsintroduce.sd_layout
    .heightIs(14)
    .topSpaceToView(_labelgoodscost, 50)
    .leftEqualToView(_labelgoodscost);
    [_goodsintroduce setSingleLineAutoResizeWithMaxWidth:250];
    //
    _realintroduce.sd_layout
    .leftEqualToView(_goodsintroduce)
    .topSpaceToView(_goodsintroduce, 20)
    .rightSpaceToView(self.view, 20)
    .heightIs(150);
    //
    _queren.sd_layout
    .heightIs(25)
    .widthIs(80)
    .leftSpaceToView(self.view, 5)
    .topEqualToView(_quxiao)
    ;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
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
-(void)viewWillAppear:(BOOL)animated{
  
}
@end
