//
//  LZGlog.m
//  FXDJ
//
//  Created by 李正国 on 2019/6/26.
//  Copyright © 2019 李正国. All rights reserved.
//

#import "LZGlog.h"
#import "PrefixHeader.pch"
@interface LZGlog ()<UITextFieldDelegate>
{
    CGFloat theboradheight;
}
@end

@implementation LZGlog
-(void)viewWillAppear:(BOOL)animated{
    CGFloat height;
    if (LZGSCREENHEIGHT==667) {
        height=50;
    }
    else{
        height=200;
    }
    _logbtn.sd_layout
    .heightIs(25)
    .bottomSpaceToView(self.view, height)
    .centerXEqualToView(self.view);
    _logbtn.layer.cornerRadius=10;
    _logbtn.clipsToBounds=YES;
    [_logbtn addTarget:self action:@selector(loginthere ) forControlEvents:UIControlEventTouchUpInside];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
-(void)keyboardWillShow:(NSNotification*)noti{
}
-(void)keyboardWillHide:(NSNotification *)noti{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _usrname.delegate=self;
    _password.delegate=self;
 UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(textFieldShouldReturn:)];
    [self.view addGestureRecognizer:tap];
    // Do any additional setup after loading the view.
}
-(void)jinggao{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSString *title=NSLocalizedString(@"提示", nil);
        NSString *message=NSLocalizedString(@"输入的信息有误", nil);
        NSString *cancelbtn=NSLocalizedString(@"取消", nil);
        NSString *okbtn=NSLocalizedString(@"好的", nil);
        UIAlertController *alertVc=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelaction=[UIAlertAction actionWithTitle:cancelbtn style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *okaction=[UIAlertAction actionWithTitle:okbtn style:UIAlertActionStyleDefault handler:nil];
        [alertVc addAction:cancelaction];
        [alertVc addAction:okaction];
        [self presentViewController:alertVc animated:YES completion:nil];
    });
   
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    CGFloat thegap=self.view.frame.size.height- textField.frame.origin.y-textField.frame.size.height;
    
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
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    CGPoint theoldorigin=CGPointMake(0, 0);
    CGRect theoldrect=self.view.frame;
    theoldrect.origin=theoldorigin;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    self.view.frame=theoldrect;
    [UIView commitAnimations];
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_usrname resignFirstResponder];
    [_password resignFirstResponder];
    return YES;
}
-(void)loginthere{
    if ([_usrname.text isEqualToString:@"alice"]&&[_password.text isEqualToString:@"123"]) {
       [[UIApplication sharedApplication].keyWindow.rootViewController dismissViewControllerAnimated:YES completion:nil];
    }
    else{
        [self jinggao];
    }
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
