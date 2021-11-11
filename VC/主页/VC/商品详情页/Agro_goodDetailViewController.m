//
//  Agro_goodDetailViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/9.
//

#import "Agro_goodDetailViewController.h"
#import "goodsViewController.h"
#import "detailViewController.h"
#import "goodsCommentViewController.h"
#import "XXPageTabView.h"
#import "topAndBottomButton.h"
#import "goodsTypeView.h"
#import "addGoodsToCarParser.h"
#import "productDetailModel.h"
@interface Agro_goodDetailViewController ()<XXPageTabViewDelegate,UIGestureRecognizerDelegate,addGoodsToCarParserDelegate>
{
    XXPageTabView *_pageTabView;

}
@property(nonatomic,retain)goodsTypeView * typeView;
@end

@implementation Agro_goodDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showGoodsTypeViewMethod:) name:@"showGoodsType" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hiddenTypeViewMethod) name:@"hiddenTypeView" object:nil];
    [self createSelectView];
    [self createNaviView];
    [self createBottomView];
}
-(void)createNaviView{
    
    
    bigButton *backButton = [bigButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(10.5, statusBarHeight, 44, 44);
//    backButton.backgroundColor = SelectColor;
    [backButton addTarget:self action:@selector(backButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [backButton setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [self.view addSubview:backButton];
    
    bigButton *carButton = [bigButton buttonWithType:UIButtonTypeCustom];
    carButton.frame = CGRectMake(ScreenWidth-12-44, statusBarHeight, 40, 44);
//    carButton.backgroundColor = SelectColor;
    [carButton addTarget:self action:@selector(carButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [carButton setImage:[UIImage imageNamed:@"购物车"] forState:UIControlStateNormal];
    [self.view addSubview:carButton];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}
-(void)backButtonMethod{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)carButtonMethod{
    
}
-(void)createSelectView{
    
   
    goodsViewController *title_0VC = [[goodsViewController alloc] init];
    title_0VC.model = self.model;
    detailViewController *title_1VC = [[detailViewController alloc] init];
    goodsCommentViewController *title_2VC = [[goodsCommentViewController alloc] init];

    [self addChildViewController:title_0VC];
    [self addChildViewController:title_1VC];
    [self addChildViewController:title_2VC];

     _pageTabView = [[XXPageTabView alloc] initWithChildControllers:self.childViewControllers childTitles:@[@"商品", @"详情",@"评价"]];
    
    _pageTabView.frame = CGRectMake(0, statusBarHeight, ScreenWidth, ScreenHeight);
    _pageTabView.tabFrame = CGRectMake(87, 0, ScreenWidth-87*2, 44);
    _pageTabView.tabSize = CGSizeMake(ScreenWidth-87*2, 44);

    _pageTabView.tabItemFont = [UIFont fontWithName:@"PingFang SC Medium" size: 17];
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
    UIView * bottomV = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight1-49, ScreenWidth, 49)];
    bottomV.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:bottomV];
    NSArray * imageArr = [NSArray arrayWithObjects:@"店铺",@"客服",@"关注收藏", nil];
    NSArray * titleArr = [NSArray arrayWithObjects:@"店铺",@"客服",@"收藏", nil];

    for (int i=0; i<3; i++) {
        topAndBottomButton * button = [topAndBottomButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0.128*ScreenWidth*i, 0, 0.128*ScreenWidth, 49);
        [button setTitle:titleArr[i] forState:UIControlStateNormal];
        [button setTitleColor:CommonColor forState:UIControlStateNormal];
        button.tag = 100+i;
        [button setImage:[UIImage imageNamed:imageArr[i]] forState:UIControlStateNormal];
        button.titleLabel.font = FontSize(10);
        [bottomV addSubview:button];
    }
    UIButton * cButton = (UIButton*)[bottomV viewWithTag:102];
    UIButton * addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addButton.frame = CGRectMake(CGRectGetMaxX(cButton.frame),3.5, (ScreenWidth-CGRectGetMaxX(cButton.frame)-10)/2, 49-3.5*2);
    [addButton setTitle:@"加入购物车" forState:UIControlStateNormal];
    [addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [addButton setBackgroundColor:SelectColor];
    addButton.titleLabel.font = FontSize(15);
    [addButton addTarget:self action:@selector(addCarMethod) forControlEvents:UIControlEventTouchUpInside];
    [self buttonConerRediu:addButton withRectCorner:UIRectCornerBottomLeft | UIRectCornerTopLeft withLayer:addButton.layer];
    [bottomV addSubview:addButton];
    
    UIButton * buyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    buyButton.frame = CGRectMake(CGRectGetMaxX(addButton.frame),3.5, (ScreenWidth-CGRectGetMaxX(cButton.frame)-10)/2, 49-3.5*2);
    [buyButton setTitle:@"立即购买" forState:UIControlStateNormal];
    [buyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    buyButton.titleLabel.font = FontSize(15);
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)UIColorFromRGB(0x56AEA4).CGColor, (__bridge id)UIColorFromRGB(0x5EBFB3).CGColor, (__bridge id)UIColorFromRGB(0x60C2B6).CGColor];
    gradientLayer.locations = @[@0.0, @0.8, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = buyButton.frame;
    [bottomV.layer addSublayer:gradientLayer];
    [self buttonConerRediu:buyButton withRectCorner:UIRectCornerBottomRight | UIRectCornerTopRight withLayer:gradientLayer];

    [bottomV addSubview:buyButton];
    

}
-(void)buttonConerRediu:(UIButton*)button withRectCorner:(UIRectCorner)RectCorner withLayer:(CALayer*)layer{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:button.bounds
                                                   byRoundingCorners:RectCorner cornerRadii:CGSizeMake(21, 21)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = button.bounds;
    maskLayer.path = maskPath.CGPath;
    layer.mask = maskLayer;
}
-(void)addCarMethod{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"addGoods" object:nil userInfo:nil];
    
}
 
#pragma mark 通知
-(void)showGoodsTypeViewMethod:(NSNotification*)noti{
    productDetailModel *model = noti.object;
    self.typeView = [[goodsTypeView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight1)];
    [self.typeView createTypeView:model];
    [self.view addSubview:self.typeView];
}
-(void)hiddenTypeViewMethod{
    [self.typeView removeFromSuperview];
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
