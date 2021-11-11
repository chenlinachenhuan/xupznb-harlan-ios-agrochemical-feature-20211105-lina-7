//
//  classDetailViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/27.
//

#import "classDetailViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "classIntrodutionViewController.h"
#import "XXPageTabView.h"
#import "contentViewController.h"
#import "classCommentViewController.h"
#import "toolButton.h"
#import "addStudyPayView.h"
#import "classItemParser.h"
#import "classDetailIntroduceModel.h"
#import "subClassDetailParser.h"
#import "subClassDetailModel.h"
#import <WebKit/WebKit.h>

@interface classDetailViewController ()<UIGestureRecognizerDelegate,UIScrollViewDelegate,XXPageTabViewDelegate,classItemParserDelegate,subClassDetailParserDelegate,SuperPlayerDelegate>
@property(nonatomic,retain)UIScrollView *homeScrollView;
@property(nonatomic,retain)UIView *videoView;
/** 播放器属性 */
@property (nonatomic, strong) AVPlayer * player;
@property (nonatomic, strong) XXPageTabView *pageTabView;
@property(nonatomic,retain)addStudyPayView *payView;
@property(nonatomic,retain)classDetailIntroduceModel * model;
@property(nonatomic,retain)subClassDetailModel * subModel;
@property(nonatomic,retain)SuperPlayerView*playerView;
@property(nonatomic,retain)WKWebView * webView;

@end

@implementation classDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BackGroundColor;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [[NSNotificationCenter defaultCenter ] addObserver:self selector:@selector(reloadVideoMethod:) name:@"reloadVideo" object:nil];
     [self createNaviView];
//    [self createVideoView];
    [self requestClassItem];
 }
-(void)reloadVideoMethod:(NSNotification*)noti{
    NSInteger myId = [[noti.userInfo objectForKey:@"myId"] integerValue];
    subClassDetailParser * parser = [[subClassDetailParser alloc] init];
    parser.myDelegate = self;
    [parser requestSubClassDetail:myId];
}
-(void)successGetSubClassDetail:(subClassDetailModel *)model{
    self.subModel=model;
    if ([model.fileType isEqualToString:@"pdf"]) {
        [self createPDFView];

    }else{
        [self createVideoView];

    }
 //    self.player=nil;
//    [self.player play];
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;

}
-(void)createNaviView{
    UIView * navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, TopHeight)];
    navView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:navView];
    bigButton *backButton = [bigButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(10, statusBarHeight, 44, 44);
    [backButton addTarget:self action:@selector(backButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [backButton setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [navView addSubview:backButton];
   
    UILabel * title = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/2-100, statusBarHeight, 200,navBarHeight)];
    title.text = @"课程详情";
    title.font = [UIFont fontWithName:@"PingFang SC" size: 17];
    title.numberOfLines = 0;
    title.textColor = [UIColor blackColor];
    title.textAlignment = NSTextAlignmentCenter;
    [navView addSubview:title] ;
//
    UIButton * forwordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    forwordButton.frame = CGRectMake(ScreenWidth-16-17, statusBarHeight+13.5, 17, 17);
    [forwordButton setBackgroundImage:[UIImage imageNamed:@"转发"] forState:UIControlStateNormal];
    [forwordButton addTarget:self action:@selector(forwordButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:forwordButton];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;

}

#pragma mark 返回
-(void)backButtonMethod{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark 转发
-(void)forwordButtonMethod{
    
}
-(void)createPDFView{
    
    
    self.webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, TopHeight, ScreenWidth, ScreenWidth * 0.56 )];
//       _webView.scalesPageToFit = YES;
       NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.subModel.fileUrl]];
       [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
}
#pragma mark 课程视频
-(void)createVideoView{
    UIView * holderView = [[UIView alloc] initWithFrame:CGRectMake(0, TopHeight, ScreenWidth, ScreenWidth * 0.56 )];
    [self.view addSubview:holderView];
    // 创建播放器
    _playerView = [[SuperPlayerView alloc] init];
    // 设置代理，用于接受事件
    _playerView.delegate = self;
    // 设置父 View，_playerView 会被自动添加到 holderView 下面
    _playerView.fatherView =  holderView;
    
     //开启防盗链需填写 psign，psign 即超级播放器签名，签名介绍和生成方式参见链接：https://cloud.tencent.com/document/product/266/42436
    SuperPlayerModel *model = [[SuperPlayerModel alloc] init];
    model.appId = 1301577937;// 配置 AppId
    model.videoId = [[SuperPlayerVideoId alloc] init];
    model.videoId.fileId = self.subModel.fileId; // 配置 FileId
    model.videoId.psign =self.subModel.psign;
    [_playerView playWithModel:model];
//    _playerView.repeatBackBtn
}
-(void)playButtonMethod:(UIButton*)button{
    button.hidden=YES;
    [self.player play];
}
 
-(void)requestClassItem{
    classItemParser * parser = [[classItemParser alloc] init];
    parser.myDelegate = self;
    [parser requestItem:self.myId];
}
-(void)successGetItem:(classDetailIntroduceModel *)model{
    self.model = model;
    [self createScrollView];
    [self createBottomView];
}
-(void)createScrollView{
   
    classIntrodutionViewController *title_0VC = [[classIntrodutionViewController alloc] init];
    title_0VC.textModel = _model;
    contentViewController *title_1VC = [[contentViewController alloc] init];
    title_1VC.textModel = self.model;
    classCommentViewController *title_2VC = [[classCommentViewController alloc] init];
    title_2VC.textModel = self.model;
    [self addChildViewController:title_0VC];
    [self addChildViewController:title_1VC];
    [self addChildViewController:title_2VC];
    
    _pageTabView = [[XXPageTabView alloc] initWithChildControllers:self.childViewControllers childTitles:@[@"介绍", @"目录", @"评价"]];
    _pageTabView.frame = CGRectMake(0, TopHeight+ScreenWidth*0.56, ScreenWidth, ScreenHeight-(ScreenWidth*0.56));
    _pageTabView.tabSize = CGSizeMake(ScreenWidth, 40);
    _pageTabView.tabFrame = CGRectMake(0, 0, ScreenWidth, 40);
    _pageTabView.tabItemFont = [UIFont fontWithName:@"PingFang SC" size: 17];
//    _pageTabView.unSelectedColor = [UIColor orangeColor];;
    _pageTabView.selectedColor = [UIColor colorWithRed:98/255.0 green:191/255.0 blue:180/255.0 alpha:1.0];
    _pageTabView.bodyBounces = NO;
    _pageTabView.titleStyle = XXPageTabTitleStyleDefault;
    _pageTabView.indicatorStyle = XXPageTabIndicatorStyleFollowText;
    _pageTabView.selectedTabIndex = 0;
     _pageTabView.delegate = self;
    _pageTabView.tabBackgroundColor =  [UIColor whiteColor];;
    [self.view addSubview:_pageTabView];
 }
-(void)createBottomView{
    UIView * bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenH-49, ScreenWidth, 49)];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    
    UIButton * consultButton = [UIButton buttonWithType:UIButtonTypeCustom];
    consultButton.frame = CGRectMake(0, 0, ScreenWidth/4, 49);
    [consultButton setImage:[UIImage imageNamed:@"咨询"] forState:UIControlStateNormal];
    [consultButton setTitle:@"咨询" forState:UIControlStateNormal];
    [consultButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    consultButton.imageEdgeInsets = UIEdgeInsetsMake(0,-ScreenWidth/30,0,0);
 
    consultButton.titleLabel.font = FontSize(15);
//    consultButton.backgroundColor = [UIColor orangeColor];
    [bottomView addSubview:consultButton];
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetWidth(consultButton.frame)-0.5, 12, 1, 25)];
    view.backgroundColor =  [UIColor colorWithRed:94/255.0 green:127/255.0 blue:253/255.0 alpha:0.05];
    [bottomView addSubview:view];
    
    UIButton * likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    likeButton.frame = CGRectMake(CGRectGetMaxX(consultButton.frame), 0, ScreenWidth/4, 49);
    [likeButton setImage:[UIImage imageNamed:@"想学1"] forState:UIControlStateNormal];
    [likeButton setTitle:@"想学" forState:UIControlStateNormal];
    [likeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    likeButton.imageEdgeInsets = UIEdgeInsetsMake(0,-ScreenWidth/30,0,0);
    likeButton.titleLabel.font = FontSize(15);
//    consultButton.backgroundColor = [UIColor orangeColor];
    [bottomView addSubview:likeButton];
    
    UIButton * addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addButton.frame = CGRectMake(CGRectGetMaxX(likeButton.frame), 0, ScreenWidth/2, 49);
    [addButton setImage:[UIImage imageNamed:@"加入学习"] forState:UIControlStateNormal];
    [addButton setTitle:@"加入学习" forState:UIControlStateNormal];
    [addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    addButton.imageEdgeInsets = UIEdgeInsetsMake(0,-ScreenWidth/30,0,0);
    addButton.titleEdgeInsets = UIEdgeInsetsMake(0, ScreenWidth/30, 0, 0);
    addButton.titleLabel.font = FontSize(15);
    addButton.backgroundColor = SelectColor;
    [addButton addTarget:self action:@selector(addClassMethod) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:addButton];
    
}
-(void)addClassMethod{
   
    classDetailDataModel *momentFrame = [[classDetailDataModel alloc] init];
    momentFrame.model = [[classDetailIntroduceModel alloc] initWithData:[[NSDictionary alloc]init]];
    self.payView = [[addStudyPayView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, [UIScreen mainScreen].bounds.size.height)];
    [self.payView createCellView:momentFrame];
    [self.view addSubview:self.payView];
}
@end
