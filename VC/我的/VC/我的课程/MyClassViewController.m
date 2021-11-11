//
//  MyClassViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/28.
//

#import "MyClassViewController.h"
#import "XXPageTabView.h"
#import "MyClassBeginingViewController.h"
#import "MyClassEndViewController.h"
#import "MyClassNotBeginViewController.h"
@interface MyClassViewController ()<XXPageTabViewDelegate,UIGestureRecognizerDelegate>
{
    XXPageTabView *_pageTabView;
}


@end

@implementation MyClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.view.backgroundColor = BackGroundColor;
    [self createNaviView];
    [self createSelectView];
}
-(void)createNaviView{
    bigButton *backButton = [bigButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 44, 44);
//    backButton.backgroundColor = SelectColor;
    [backButton addTarget:self action:@selector(backButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [backButton setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
     UIBarButtonItem * leftB = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = leftB;
   
    UILabel * title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100,navBarHeight)];
    title.text = @"我的课程";
    title.font = [UIFont fontWithName:@"PingFang SC" size: 17];
    title.numberOfLines = 0;
    title.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView=title ;
//    title.backgroundColor = [UIColor orangeColor];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;


}
#pragma mark 返回
-(void)backButtonMethod{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)createSelectView{
    
    
    MyClassBeginingViewController *title_0VC = [[MyClassBeginingViewController alloc] init];
    MyClassNotBeginViewController *title_1VC = [[MyClassNotBeginViewController alloc] init];
    MyClassEndViewController *title_2VC = [[MyClassEndViewController alloc] init];

    [self addChildViewController:title_0VC];
    [self addChildViewController:title_1VC];
    [self addChildViewController:title_2VC];

     _pageTabView = [[XXPageTabView alloc] initWithChildControllers:self.childViewControllers childTitles:@[@"正在进行", @"未开始",@"已结束"]];
    _pageTabView.frame = CGRectMake(0, TopHeight, ScreenWidth, ScreenHeight);
    _pageTabView.tabSize = CGSizeMake(ScreenWidth, 44);
    _pageTabView.tabFrame = CGRectMake(0, 0, ScreenWidth, 44);
    _pageTabView.tabItemFont = [UIFont fontWithName:@"PingFang SC" size: 17];
//    _pageTabView.unSelectedColor = [UIColor orangeColor];;
    _pageTabView.selectedColor = [UIColor colorWithRed:98/255.0 green:191/255.0 blue:180/255.0 alpha:1.0];
    _pageTabView.bodyBounces = NO;
    _pageTabView.titleStyle = XXPageTabTitleStyleDefault;
    _pageTabView.indicatorStyle = XXPageTabIndicatorStyleFollowText;
    _pageTabView.selectedTabIndex = 0;
     _pageTabView.delegate = self;
    _pageTabView.tabBackgroundColor =  [UIColor colorWithRed:248/255.0 green:250/255.0 blue:251/255.0 alpha:1.0];;
    [self.view addSubview:_pageTabView];
 }

@end
