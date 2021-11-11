//
//  Agro_loginViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/8.
//

#import "Agro_loginViewController.h"
#import "Agro_registerViewController.h"
#import "Agro_loginParser.h"
#import "Agro_loginModel.h"
#import "resetPasswordViewController.h"
@interface Agro_loginViewController ()<UIScrollViewDelegate,Agro_loginParserDelegate,UIGestureRecognizerDelegate>
@property(nonatomic,retain)UIScrollView *homeScrollView;
@property(nonatomic,retain)UITextField *accountField;
@property(nonatomic,retain)UITextField *passwordField;
@property(nonatomic,retain)UIView * accountV;
@property(nonatomic,retain)UIView * passwordV;

@end

@implementation Agro_loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView * bgImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenH)];
    bgImgV.userInteractionEnabled = YES;
    bgImgV.image = [UIImage imageNamed:@"底图"];
    [self.view addSubview:bgImgV];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [self createScrollView];
    [self createCellView];
}
- (void)keyboardWillShow:(NSNotification *)notification
{
    //获取处于焦点中的view
    NSArray *textFields = @[self.accountField, self.passwordField];
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
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
//    self.navigationController.navigationBarHidden=YES;
}
-(void)createScrollView{
   
    self.homeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, statusBarHeight, ScreenWidth, ScreenHeight)];
    self.homeScrollView.delegate = self;
    self.homeScrollView.contentSize = CGSizeMake(ScreenWidth, 1000);
    self.homeScrollView.showsVerticalScrollIndicator = NO;
    self.homeScrollView.userInteractionEnabled = YES;
//    [self.view addSubview:self.homeScrollView];
    [self.view addSubview:self.homeScrollView];
    
    UITapGestureRecognizer * ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMethod:)];
    [self.homeScrollView addGestureRecognizer:ges];
}
-(void)tapMethod:(UIGestureRecognizer*)rec{
    [self.view endEditing:YES];
}
-(void)createCellView{
    
    bigButton*bigB = [[bigButton alloc] init];
    bigB.frame = CGRectMake(10, 0, 44, 44);
    [bigB setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [bigB addTarget:self action:@selector(backMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.homeScrollView addSubview:bigB];
    UIView * iconV = [[UIView alloc] initWithFrame:CGRectMake(ScreenWidth/2-0.1413333333*ScreenWidth*0.5, 0.0814732*ScreenHeight, 0.1413333333*ScreenWidth, 0.1413333333*ScreenWidth)];
    iconV.backgroundColor = [UIColor colorWithRed:96/255.0 green:194/255.0 blue:182/255.0 alpha:1.0];
    iconV.clipsToBounds = YES;
    iconV.layer.cornerRadius = 20;
    [self.homeScrollView addSubview:iconV];
    
    UILabel * nameL = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(iconV.frame)+0.01841518*ScreenHeight, ScreenWidth, 20)];
    nameL.text = @"Acml";
    nameL.textColor = [UIColor blackColor];
    nameL.textAlignment = NSTextAlignmentCenter;
    nameL.font = [UIFont fontWithName:@"PingFang SC Medium" size:24];
    [self.homeScrollView addSubview:nameL];
    
    UILabel * textL = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(nameL.frame)+0.01841518*ScreenHeight, ScreenWidth, 12.5)];
    textL.text = @"Community we all need";
    textL.textColor = CommonColor;
    textL.textAlignment = NSTextAlignmentCenter;
    textL.font = [UIFont fontWithName:@"PingFang SC" size:12];
    [self.homeScrollView addSubview:textL];
    
    UILabel * loginL = [[UILabel alloc] initWithFrame:CGRectMake(37, CGRectGetMaxY(textL.frame)+0.0669643*ScreenHeight, ScreenWidth, 22.5)];
    loginL.text = @"登录";
    loginL.textColor =  [UIColor blackColor];
    loginL.font = [UIFont fontWithName:@"PingFang SC Medium" size:24];
    [self.homeScrollView addSubview:loginL];
    
    UILabel * tipL = [[UILabel alloc] initWithFrame:CGRectMake(37, CGRectGetMaxY(loginL.frame)+0.0223214*ScreenHeight, ScreenWidth, 14.5)];
    tipL.text = @"请输入您的账号和密码";
    tipL.textColor =  CommonColor;
    tipL.font = [UIFont fontWithName:@"PingFang SC" size:15];
    [self.homeScrollView addSubview:tipL];
    
    self.accountV = [[UIView alloc] initWithFrame:CGRectMake(37.5, CGRectGetMaxY(tipL.frame)+0.032924*ScreenHeight, ScreenWidth-37.5*2, 58)];
    self.accountV.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    self.accountV.layer.borderWidth = 0.5;
    self.accountV.layer.borderColor = CommonColor.CGColor;
    self.accountV.layer.cornerRadius = 16;
    [self.homeScrollView addSubview:self.accountV];
    
    UIImageView * accontImgV = [[UIImageView alloc] initWithFrame:CGRectMake(21, 19, 20, 20)];
    accontImgV.image = [UIImage imageNamed:@"账号"];
    [self.accountV addSubview:accontImgV];
    
    UIView * lineV = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(accontImgV.frame)+19, 10, 0.5, 38)];
    lineV.backgroundColor = CommonColor;
    [self.accountV addSubview:lineV];
    
    UILabel * accountL = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lineV.frame)+17, 10, 60, 12)];
    accountL.text = @"账号";
    accountL.textColor = CommonColor;
    accountL.font = FontSize(12);
    [self.accountV addSubview:accountL];
    
    self.accountField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lineV.frame)+17, CGRectGetMaxY(accountL.frame), self.accountV.frame.size.width-CGRectGetMaxX(lineV.frame)-17, 36)];
    self.accountField.placeholder = @"请输入您的手机号或邮箱";
    self.accountField.font = FontSize(12);
    Ivar ivar =  class_getInstanceVariable([UITextField class], "_placeholderLabel");
    UILabel *placeholderLabel = object_getIvar(self.accountField, ivar);
    placeholderLabel.textColor = CommonColor;
    placeholderLabel.font = FontSize(12);
    [self.accountV addSubview:self.accountField];
    
    self.passwordV = [[UIView alloc] initWithFrame:CGRectMake(37.5, CGRectGetMaxY(self.accountV.frame)+0.032924*ScreenHeight, ScreenWidth-37.5*2, 58)];
    self.passwordV.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    self.passwordV.layer.borderWidth = 0.5;
    self.passwordV.layer.borderColor = CommonColor.CGColor;
    self.passwordV.layer.cornerRadius = 16;
    [self.homeScrollView addSubview:self.passwordV];
    
    UIImageView * passwordImgV = [[UIImageView alloc] initWithFrame:CGRectMake(21, 19, 20, 20)];
    passwordImgV.image = [UIImage imageNamed:@"密码"];
    [self.passwordV addSubview:passwordImgV];
    
    UIView * lineV1 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(passwordImgV.frame)+19, 10, 0.5, 38)];
    lineV1.backgroundColor = CommonColor;
    [self.passwordV addSubview:lineV1];
    
    UILabel * passwordL = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lineV1.frame)+17, 10, 60, 12)];
    passwordL.text = @"密码";
    passwordL.textColor = CommonColor;
    passwordL.font = FontSize(12);
    [self.passwordV addSubview:passwordL];
    
    self.passwordField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lineV1.frame)+17, CGRectGetMaxY(passwordL.frame), self.accountV.frame.size.width-CGRectGetMaxX(lineV1.frame)-17-16-18-5, 38)];
    self.passwordField.placeholder = @"请输入密码";
    self.passwordField.secureTextEntry = YES;
//    self.passwordField.font=nil;
//    self.passwordField.font = FontSize(12);
    UILabel *placeholderLabelP = object_getIvar(self.passwordField, ivar);
    placeholderLabelP.textColor = CommonColor;
    placeholderLabelP.font = FontSize(12);
    [self.passwordV addSubview:self.passwordField];
    
    UIImageView * seePasswordImgV = [[UIImageView alloc] initWithFrame:CGRectMake(self.passwordV.frame.size.width-16-18, CGRectGetMaxY(self.passwordField.frame)-CGRectGetHeight(self.passwordField.frame)/2-7.25, 18, 14.5)];
    seePasswordImgV.image = [UIImage imageNamed:@"不显示密码"];
    [self.passwordV addSubview:seePasswordImgV];
    
    UIButton * forgetPasswordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    forgetPasswordButton.frame = CGRectMake(ScreenWidth-37.5-57, CGRectGetMaxY(self.passwordV.frame)+0.01841518*ScreenHeight, 57, 12);
    [forgetPasswordButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [forgetPasswordButton setTitle:@"忘记密码" forState:UIControlStateNormal];
    forgetPasswordButton.titleLabel.font = FontSize(12);
    forgetPasswordButton.titleLabel.textAlignment = NSTextAlignmentRight;
    [forgetPasswordButton addTarget:self action:@selector(forgetPasswordButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.homeScrollView addSubview:forgetPasswordButton];
    
    UIButton * loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.frame = CGRectMake(37.5, CGRectGetMaxY(self.passwordV.frame)+0.0636161*ScreenHeight, ScreenWidth-37.5*2, 50);
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    loginButton.backgroundColor = [UIColor colorWithRed:96/255.0 green:194/255.0 blue:182/255.0 alpha:1.0];
    loginButton.clipsToBounds = YES;
    loginButton.layer.cornerRadius = 16;
    loginButton.titleLabel.font = [UIFont fontWithName:@"PingFang SC Medium" size:17];
    [loginButton addTarget:self action:@selector(loginButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.homeScrollView addSubview:loginButton];
    
    UILabel * registerL = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/2-70, CGRectGetMaxY(loginButton.frame)+0.0267857*ScreenHeight, 75, 12)];
    registerL.text = @"还没有账号？";
    registerL.font = FontSize(12);
    [self.homeScrollView addSubview:registerL];
    
    UIButton * registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    registerButton.frame = CGRectMake(CGRectGetMaxX(registerL.frame), registerL.frame.origin.y, 50, 11.5);
    [registerButton setTitle:@"去注册" forState:UIControlStateNormal];
    registerButton.titleLabel.font = FontSize(12);
//    registerButton.backgroundColor = [UIColor orangeColor];
    [registerButton setTitleColor:SelectColor forState:UIControlStateNormal];
    [registerButton setImage:[UIImage imageNamed:@"进入注册"] forState:UIControlStateNormal];
    [registerButton addTarget:self action:@selector(registerButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    registerButton.titleEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 0);
    registerButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -80);
    [self.homeScrollView addSubview:registerButton];
    
    UILabel * otherL = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/2-[commonMethod widthAuto:@"其他登陆方式" fontSize:12 contentheight:11.5]/2, CGRectGetMaxY(registerButton.frame)+0.06529*ScreenHeight, [commonMethod widthAuto:@"其他登陆方式" fontSize:12 contentheight:11.5], 11.5)];
    otherL.text = @"其他登陆方式";
    otherL.font = FontSize(12);
    [self.homeScrollView addSubview:otherL];
    
    UILabel * line1 = [[UILabel alloc] initWithFrame:CGRectMake(43, otherL.center.y-0.25, (ScreenWidth-CGRectGetWidth(otherL.frame)-43*2-20*2)/2, 0.5)];
    line1.backgroundColor = CommonColor;
    [self.homeScrollView addSubview:line1];
    
    UILabel * line2 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(otherL.frame)+20, otherL.center.y-0.25, (ScreenWidth-CGRectGetWidth(otherL.frame)-43*2-20*2)/2, 0.5)];
    line2.backgroundColor = CommonColor;
    [self.homeScrollView addSubview:line2];
    
    UIButton * QQButton = [UIButton buttonWithType:UIButtonTypeCustom];
    QQButton.frame = CGRectMake(ScreenWidth/2-23, CGRectGetMaxY(otherL.frame)+0.0334821*ScreenHeight, 46, 46);
    [QQButton setBackgroundImage:[UIImage imageNamed:@"QQ登录"] forState:UIControlStateNormal];
    [QQButton addTarget:self action:@selector(QQButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.homeScrollView addSubview:QQButton];
    
    UIButton * weChatButton = [UIButton buttonWithType:UIButtonTypeCustom];
    weChatButton.frame = CGRectMake(QQButton.frame.origin.x-50-46, CGRectGetMaxY(otherL.frame)+0.0334821*ScreenHeight, 46, 46);
    [weChatButton setBackgroundImage:[UIImage imageNamed:@"微信登录"] forState:UIControlStateNormal];
    [weChatButton addTarget:self action:@selector(weChatButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.homeScrollView addSubview:weChatButton];
    
    UIButton * weiBoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    weiBoButton.frame = CGRectMake(ScreenWidth/2+23+50, CGRectGetMaxY(otherL.frame)+0.0334821*ScreenHeight, 46, 46);
    [weiBoButton setBackgroundImage:[UIImage imageNamed:@"微博登录"] forState:UIControlStateNormal];
    [weiBoButton addTarget:self action:@selector(weiBoButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.homeScrollView addSubview:weiBoButton];
    
    [self reloadScrollViewFrame:CGRectGetMaxY(QQButton.frame)];
}
-(void)backMethod{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)forgetPasswordButtonMethod{
    resetPasswordViewController * resetP = [[resetPasswordViewController alloc] init];
    resetP.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:resetP animated:YES completion:nil];
}
-(void)loginButtonMethod{
//    [[ChrysanthemumIndexView sharedMasterUser]show];
    Agro_loginParser * parser = [[Agro_loginParser alloc] init];
    parser.myDelegate = self;
    [parser loginWithUsername:self.accountField.text password:self.passwordField.text];
}
-(void)successLoginMethod:(Agro_loginModel *)model{
    [[ChrysanthemumIndexView sharedMasterUser]remove];
    Agro_appDelegate.loginModel = model;
    Agro_appDelegate.isLogin = YES;
    NSArray * arr = @[model];
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:arr] forKey:@"loginModel"];
//    [[NSUserDefaults standardUserDefaults]setObject:arr forKey:@"loginModel"];
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)failedMethod:(NSString*)messege{
    FBUtilShowTipView(self.view,messege);
}
-(void)registerButtonMethod{
    Agro_registerViewController * registerV = [[Agro_registerViewController alloc] init];
    registerV.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:registerV animated:YES completion:nil];
}
-(void)QQButtonMethod{
    
}
-(void)weChatButtonMethod{
    
}
-(void)weiBoButtonMethod{
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
#pragma mark 刷新列表
-(void)reloadScrollViewFrame:(CGFloat)height{
    self.homeScrollView.contentSize= CGSizeMake(ScreenWidth, height) ;
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
