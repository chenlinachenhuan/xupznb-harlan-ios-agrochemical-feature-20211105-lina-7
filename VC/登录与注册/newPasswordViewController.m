//
//  newPasswordViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/21.
//

#import "newPasswordViewController.h"
#import "Agro_loginViewController.h"
#import "resetPasswordParser.h"
#import "resetPasswordSuccessViewController.h"
@interface newPasswordViewController ()<resetPasswordParserDelegate>

@end

@implementation newPasswordViewController
-(id)init{
    if (self=[super init]) {
        self.code = [[NSString alloc] init];
        self.name = [[NSString alloc] init];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initMethod];
}
-(void)initMethod{
    self.iconV.clipsToBounds = YES;
    self.iconV.layer.cornerRadius = 20;
    self.nameCons.constant = 0.0184152*ScreenHeight;
    self.textCons.constant = 0.0184152*ScreenHeight;
    self.registerCons.constant = 0.0669643*ScreenHeight;
    self.registerVCons.constant = 0.032924*ScreenHeight;
    self.registerV.clipsToBounds = YES;
    self.registerV.layer.cornerRadius = 16;
    self.registerV.layer.borderWidth = 0.5;
    self.registerV.layer.borderColor = CommonColor.CGColor;
    Ivar ivar =  class_getInstanceVariable([UITextField class], "_placeholderLabel");
    UILabel *placeholderLabel = object_getIvar(self.passwordFielf, ivar);
    placeholderLabel.textColor = UIColorFromRGB(0xCDCDCD);
    placeholderLabel.font = FontSize(12);
    self.passwordFielf.font = FontSize(12);
    self.loginButton.titleEdgeInsets = UIEdgeInsetsMake(0,-25, 0, 0);
    self.loginButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -80);
    self.sureButton.clipsToBounds = YES;
    self.sureButton.layer.cornerRadius = 16;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
- (void)keyboardWillShow:(NSNotification *)notification
{
    //获取处于焦点中的view
    NSArray *textFields = @[self.passwordFielf];
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
- (IBAction)backButtonMethod:(bigButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)seeButtonMethod:(UIButton *)sender {
}
- (IBAction)sureButtonMethod:(UIButton *)sender {
    resetPasswordParser * parser =[[resetPasswordParser alloc] init];
    parser.myDelegate =self;
    [parser resetPasswordWithUsername:self.name password:self.passwordFielf.text authCode:self.code];
}
-(void)resetPasswordSuccess{
   
    resetPasswordSuccessViewController * vc = [[resetPasswordSuccessViewController alloc] init];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vc animated:YES completion:nil];
 
}
-(void)failedMethod:(NSString *)messege{
    FBUtilShowTipView(self.view,messege);
}
- (IBAction)loginButtonMethod:(UIButton *)sender {
     
    [self dismissViewControllerClass:NSClassFromString(@"Agro_loginViewController")];
}
- (void)dismissViewControllerClass:(Class)class {
    UIViewController *vc = self;
    while (![vc isKindOfClass:class] && vc != nil) {
        vc = vc.presentingViewController;
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController *)vc).viewControllers.lastObject;
        }
    }
    [vc dismissViewControllerAnimated:YES completion:nil];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
