//
//  passwordViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/9.
//

#import "passwordViewController.h"
#import "registerSuccessViewController.h"
#import "Agro_loginViewController.h"
#import "Agro_registerParser.h"
@interface passwordViewController ()<Agro_registerParserDelegate>

@end

@implementation passwordViewController
-(id)init{
    if (self==[super init]) {
        self.code = [[NSString alloc] init];
        self.name = [[NSString alloc] init];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUIView];
}
-(void)initUIView{
    self.iconV.clipsToBounds = YES;
    self.iconV.layer.cornerRadius = 20;
    self.iconCons.constant = 0.0814732*ScreenHeight;
    self.nameCons.constant = 0.0184152*ScreenHeight;
    self.passwordCons.constant = 0.0669643*ScreenHeight;
    self.registerButton.clipsToBounds = YES;
    self.registerButton.layer.cornerRadius = 16;
    self.passwordVCons.constant = ScreenHeight * 0.032924107;
    self.rigisterButtonCons.constant = ScreenHeight * 0.03794643;
    self.loginCons.constant = ScreenHeight * 0.03794643;
    self.passwordV.clipsToBounds = YES;
    self.passwordV.layer.cornerRadius = 16;
    self.passwordV.layer.borderWidth = 0.5;
    self.passwordV.layer.borderColor = CommonColor.CGColor;
    self.loginButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -80);
    self.loginButton.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    self.registerButton.clipsToBounds = YES;
    self.registerButton.layer.cornerRadius = 16;
    Ivar ivar =  class_getInstanceVariable([UITextField class], "_placeholderLabel");
    UILabel *placeholderLabel = object_getIvar(self.passwordField, ivar);
    placeholderLabel.textColor = CommonColor;
    placeholderLabel.font = FontSize(12);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
- (void)keyboardWillShow:(NSNotification *)notification
{
    //获取处于焦点中的view
    NSArray *textFields = @[self.passwordField];
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
         CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
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

-(void)requestMethod{
    Agro_registerParser * parser =[[Agro_registerParser alloc] init];
    parser.myDelegate = self;
    [parser registerWithUsername:self.name password:self.passwordField.text authCode:self.code];
}
-(void)registerSuccess{
    registerSuccessViewController * registerVC = [[registerSuccessViewController alloc] init];
    registerVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:registerVC animated:YES completion:nil];
}
-(void)failedMethod:(NSString *)message{
    FBUtilShowTipView(self.view,message);
}
- (IBAction)backButtonMethod:(bigButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)registerButtonMethod:(UIButton *)sender {
   
    [self requestMethod];
}
- (IBAction)loginButtonMethod:(UIButton *)sender {
    Agro_loginViewController * loginVC = [[Agro_loginViewController alloc] init];
    loginVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:loginVC animated:YES completion:nil];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
