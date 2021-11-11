//
//  codeViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/9.
//

#import "codeViewController.h"
#import "HWTFCodeBView.h"
#import "passwordViewController.h"
#import "sendMsgParser.h"
#import "newPasswordViewController.h"
#import "verifyAuthCodeParser.h"
@interface codeViewController ()<sendMsgParserDlegate,verifyAuthCodeParserDelegate>
@property(nonatomic,retain)NSTimer * codeTimer;
@property(nonatomic,retain)HWTFCodeBView *codeView;
@property(nonatomic,assign)int code;

@end

@implementation codeViewController
-(id)init{
    if (self==[super init]) {
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
    self.codeCons.constant = 0.0669643*ScreenHeight;
    self.sureButton.clipsToBounds = YES;
    self.sureButton.layer.cornerRadius = 16;
    NSLog(@"%f",self.timeL.frame.origin.y);
    self.codeView = [[HWTFCodeBView alloc] initWithCount:6 margin:9];
    self.codeView.frame = CGRectMake(0, 0,ScreenWidth-72, (ScreenWidth-72-5*9)/6);
    [self.codeV addSubview:self.codeView];
    self.codeV.frame = CGRectMake( self.codeV.frame.origin.x,  self.codeV.frame.origin.y,  self.codeV.frame.size.width, (ScreenWidth-72-5*9)/6);
    _codeTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(codeMethord) userInfo:nil repeats:YES];
    
   [_codeTimer setFireDate:[NSDate distantPast]];
    self.code=60;
}
-(void)requestSendMsg{
    sendMsgParser * parser = [[sendMsgParser alloc] init];
    parser.myDelegate = self;
    [parser requestWithName:self.name type:self.type];
}
-(void)successSendMsg{
     FBUtilShowTipView(self.view,@"验证码发送成功");

}
-(void)failedMethod:(NSString *)messege{
    FBUtilShowTipView(self.view,messege);
    if ([messege isEqualToString:@"暂未登录或token已经过期"]) {
//        [self presentViewController:[agro_lo] animated:YES completion:nil];
    }
}
- (IBAction)timeButtonMethod:(UIButton *)sender {
    if ([self.timeButton.titleLabel.text isEqualToString:@"重新发送"]) {
        [self requestSendMsg];
        [_codeTimer setFireDate:[NSDate distantPast]];
        self.code = 60;
        [self.timeButton setTitleColor:CommonColor forState:UIControlStateNormal];
    }
}
-(void)codeMethord
{
    
    [self.timeButton setTitle:[NSString stringWithFormat:@"倒计时%dS",self.code--] forState:UIControlStateNormal];
    if (self.code<=0)
    {
        [_codeTimer setFireDate:[NSDate distantFuture]];
        [self.timeButton setTitle:@"重新发送" forState:UIControlStateNormal];
        [self.timeButton setTitleColor:UIColorFromRGB(0x62BFB4) forState:UIControlStateNormal];
     }
}
- (IBAction)backButtonMethod:(bigButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)verifyAuthCodeMethod{
    verifyAuthCodeParser * parser = [[verifyAuthCodeParser alloc] init];
    parser.myDelegate = self;
    [parser requestWithAuthCode:@"" name:self.name type:self.type];
}
-(void)successVerifyAuthCode:(BOOL)data{
    if (data==1) {
        
    }
}
- (IBAction)sureButtonMethod:(UIButton *)sender {
    if (self.name.length==0) {
        [[iToast makeText:@"请输入您的手机号或邮箱"] show];
    }else{
        
        if (self.type==11) {
            passwordViewController * passwordVC = [[passwordViewController alloc] init];
            passwordVC.modalPresentationStyle = UIModalPresentationFullScreen;
            passwordVC.code=self.codeView.code;
            passwordVC.name = self.name;
            [self presentViewController:passwordVC animated:YES completion:nil];
        }else if (self.type==13){
            newPasswordViewController * passwordVC = [[newPasswordViewController alloc] init];
            passwordVC.code=self.codeView.code;
            passwordVC.name = self.name;
            passwordVC.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:passwordVC animated:YES completion:nil];
        }
    }
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
@end
