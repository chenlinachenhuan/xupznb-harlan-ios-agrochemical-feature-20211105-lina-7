//
//  Agro_registerViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/9.
//

#import "Agro_registerViewController.h"
#import "Agro_loginViewController.h"
#import "codeViewController.h"
#import "sendMsgParser.h"
@interface Agro_registerViewController ()<sendMsgParserDlegate>

@end

@implementation Agro_registerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUIView];
}
 
-(void)initUIView{
    self.iconV.clipsToBounds = YES;
    self.iconV.layer.cornerRadius = 20;
    self.iconConstraint.constant = 0.0814732*ScreenHeight+statusBarHeight;
    self.nameCons.constant = 0.0184152*ScreenHeight;
    self.textCons.constant = 0.0184152*ScreenHeight;
    self.registerCons.constant = 0.0669643*ScreenHeight;
    self.tipsCons.constant = 0.0184152*ScreenHeight;
    self.registerVCons.constant = 0.032924*ScreenHeight;
    self.registerV.clipsToBounds = YES;
    self.registerV.layer.cornerRadius = 16;
    self.registerV.layer.borderWidth = 0.5;
    self.registerV.layer.borderColor = CommonColor.CGColor;
    Ivar ivar =  class_getInstanceVariable([UITextField class], "_placeholderLabel");
    UILabel *placeholderLabel = object_getIvar(self.accountField, ivar);
    placeholderLabel.textColor = CommonColor;
    placeholderLabel.font = FontSize(12);
    self.accountField.font = FontSize(12);
    self.codeCons.constant = 0.0379464*ScreenHeight;
    self.getCodeButton.clipsToBounds = YES;
    self.getCodeButton.layer.cornerRadius = 16;
    self.loginCons.constant = 0.0267857*ScreenHeight;
    self.loginButton.titleEdgeInsets = UIEdgeInsetsMake(0,-30, 0, 0);
    self.loginButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -75);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
- (void)keyboardWillShow:(NSNotification *)notification
{
    //获取处于焦点中的view
    NSArray *textFields = @[self.accountField];
    UIView *focusView = nil;
    for (UITextField *view in textFields) {
        if ([view isFirstResponder]) {
            focusView = view;
            break;
        }
    }
    if (focusView) {
        //获取键盘弹出的时间
        double duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
        //获取键盘上端Y坐标
//         CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
//        CGRect rect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
        CGFloat keyboardY =[notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].origin.y;
        //获取输入框下端相对于window的Y坐标
        CGRect rect = [focusView convertRect:focusView.bounds toView:[[[UIApplication sharedApplication] delegate] window]];
        CGPoint tmp = rect.origin;
        CGFloat inputBoxY = tmp.y + focusView.frame.size.height;
        //计算二者差值
        CGFloat ty = keyboardY - inputBoxY;
        NSLog(@"position keyboard: %f, inputbox: %f, ty: %f", keyboardY, inputBoxY, ty);
        //差值小于0，做平移变换
        [UIView animateWithDuration:duration animations:^{
            if (ty < 0) {
                self.view.transform = CGAffineTransformMakeTranslation(0, ty);
            }
        }];
    }
}
 
- (void)keyboardWillHide:(NSNotification *)notification
{
    //获取键盘弹出的时间
    double duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    //还原
    [UIView animateWithDuration:duration animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, 0);
    }];
}
-(void)requestSendMsg{
    sendMsgParser * parser = [[sendMsgParser alloc] init];
    parser.myDelegate = self;
    [parser requestWithName:self.accountField.text type:11];
}
-(void)successSendMsg{
    FBUtilShowTipView(self.view,@"验证码发送成功");

    codeViewController * codeVC = [[codeViewController alloc] init];
    codeVC.modalPresentationStyle = UIModalPresentationFullScreen;
    codeVC.name = self.accountField.text;
    codeVC.type = 11;
    [self presentViewController:codeVC animated:YES completion:nil];
}
-(void)failedMethod:(NSString *)messege{
    [[ChrysanthemumIndexView sharedMasterUser]remove];
    FBUtilShowTipView(self.view,messege);
}
- (IBAction)getCodeButtonMethod:(UIButton *)sender {
    [self requestSendMsg];
}
- (IBAction)loginButtonMethod:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)backButtonMethod:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
