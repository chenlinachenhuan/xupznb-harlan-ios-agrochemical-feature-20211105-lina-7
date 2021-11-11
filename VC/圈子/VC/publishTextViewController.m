//
//  publishTextViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/21.
//

#import "publishTextViewController.h"
#import "trendCreateParser.h"
@interface publishTextViewController ()<UITextViewDelegate,trendCreateParserDelegate>
@property(nonatomic,retain) UITextView * textView;
@end

@implementation publishTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createTextView];
    
}
-(void)createTextView{
    UIView * topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, TopHeight)];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    
    bigButton * backButton = [bigButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(10.5, statusBarHeight, 44, 44);
    [backButton setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:backButton];
    
    UILabel * title = [[UILabel alloc] initWithFrame:CGRectMake(0, statusBarHeight, ScreenWidth, 44)];
    title.text = @"发表文字";
    title.textAlignment = NSTextAlignmentCenter;
    title.font = FontSize(17);
    [topView addSubview:title];
    
    UIButton * publishB = [UIButton buttonWithType:UIButtonTypeCustom];
    publishB.frame = CGRectMake(ScreenWidth-12-54, title.center.y-12, 54, 24);
    [publishB setBackgroundColor:SelectColor];
    [publishB setTitle:@"发布" forState:UIControlStateNormal];
    [publishB setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    publishB.clipsToBounds = YES;
    publishB.layer.cornerRadius = 5;
    publishB.titleLabel.font = FontSize(15);
    [publishB addTarget:self action:@selector(publishMethod) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:publishB];
    
    UILabel * lineL = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(topView.frame)-1, ScreenWidth, 1)];
    lineL.backgroundColor = BackGroundColor;
    [topView addSubview:lineL];
    
    self.textView = [[UITextView alloc] init];
    self.textView.backgroundColor = [UIColor whiteColor];
    self.textView.frame  = CGRectMake(12, CGRectGetMaxY(topView.frame)+5, ScreenWidth-24, 130);
    self.textView.delegate = self;
    self.textView.textColor = UIColorFromRGB(0xCCCCCC);
    self.textView.text = @"这一刻的想法…";
    self.textView.font = FontSize(15);
    [self.view addSubview:self.textView];
    
}
#pragma mark - UITextViewDelegate
- (void)textViewDidEndEditing:(UITextView *)textView
{
    if(textView.text.length < 1){
        textView.textColor = UIColorFromRGB(0xCCCCCC);
        textView.text = @"这一刻的想法…";
    }
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if([textView.text isEqualToString:@"这一刻的想法…"]){
        textView.text=@"";
        textView.textColor=[UIColor blackColor];
    }
}
-(void)backButtonMethod{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)publishMethod{
    trendCreateParser * parser =[[trendCreateParser alloc] init];
    parser.myDelegate = self;
    [parser requestAlbumPics:@"" content:self.textView.text typeId:1 title:@""];
    
}
-(void)successCreateTrend{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"reloadDataMethod" object:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)failedMethod:(NSString *)message{
    [[ChrysanthemumIndexView sharedMasterUser] remove];
    FBUtilShowTipView(self.view,message);
}
@end
