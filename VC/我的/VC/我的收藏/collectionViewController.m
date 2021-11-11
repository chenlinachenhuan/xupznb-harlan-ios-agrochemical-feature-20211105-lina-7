//
//  collectionViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/27.
//

#import "collectionViewController.h"
#import "ClassificationOneTableViewCell.h"
#import "collectionClassViewController.h"
#import "collectionExpertViewController.h"
#import "XXPageTabView.h"
@interface collectionViewController ()<XXPageTabViewDelegate,UIGestureRecognizerDelegate>
{
    XXPageTabView *_pageTabView;
}

@end

@implementation collectionViewController

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
    [backButton addTarget:self action:@selector(backButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [backButton setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
     UIBarButtonItem * leftB = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = leftB;
   
    UILabel * title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth,navBarHeight)];
    title.text = @"我的收藏";
    title.font = [UIFont fontWithName:@"PingFang SC" size: 17];
    title.numberOfLines = 0;
    title.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView=title ;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;


}
#pragma mark 返回
-(void)backButtonMethod{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)createSelectView{
    
    
    collectionClassViewController *title_0VC = [[collectionClassViewController alloc] init];
    collectionExpertViewController *title_1VC = [[collectionExpertViewController alloc] init];
    [self addChildViewController:title_0VC];
    [self addChildViewController:title_1VC];
     _pageTabView = [[XXPageTabView alloc] initWithChildControllers:self.childViewControllers childTitles:@[@"课程", @"专家"]];
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
