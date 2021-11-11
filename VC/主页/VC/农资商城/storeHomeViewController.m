//
//  storeHomeViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/26.
//

#import "storeHomeViewController.h"
#import "CustomBannerView.h"
#import "storeTypeOneViewController.h"
#import "XXPageTabView.h"
#import "storeCarViewController.h"
#import "goodsParentListModel.h"
#import "goodsChildrenListModel.h"
#import "goodsCatIdParser.h"
#import "childListCollectionViewCell.h"
#import "goodsChildListCollectionView.h"
#import "parentCollectionViewCell.h"
#import "goodsListParser.h"
#import "productListCollectionView.h"
#import "productListCollectionViewCell.h"
#import "homeBannerParser.h"

@interface storeHomeViewController ()<UIScrollViewDelegate,CustomBannerViewDelegate,XXPageTabViewDelegate,goodsCatIdParserDelegate,goodsListParserDelegate,homeBannerParserDelegate>
{
    CGFloat _isScrollDown;
}
@property(nonatomic,retain)UIScrollView *homeScrollView;
@property(nonatomic,retain)UISearchBar * searchB;
@property(nonatomic,retain)CustomBannerView * bannerView;
@property(nonatomic,retain)NSMutableArray *bannerImgArr;
@property(nonatomic,retain)XXPageTabView *pageTabView;
@property(nonatomic,retain)NSMutableArray *goodsParentListArr;;
@property(nonatomic,retain)NSMutableArray *goodsChildrenListArr;
@property(nonatomic,retain)goodsChildListCollectionView *pageListView;
@property(nonatomic,retain)goodsChildListCollectionView *childListCollectionView;
@property(nonatomic,retain)productListCollectionView *listCollectionView;
@property(nonatomic,retain)NSMutableArray *listArr;
@end

@implementation storeHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BackGroundColor;
    [self initMethod];
    [self createScrollView];
    [self createSeachBarView];
    [self createBannerView];
    [self requestParentListMethod];
    [self requestHomeBanner];
 }
-(void)initMethod{
    self.goodsParentListArr = [[NSMutableArray alloc] init];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadFrame:) name:@"reloadFrame" object:nil];
}
-(void)requestParentListMethod{
    goodsCatIdParser * parser = [[goodsCatIdParser alloc] init];
    parser.myDelegate = self;
    [parser requestWithParentId];
}
-(void)successGetCatParentList:(NSMutableArray *)parentArr{
    self.goodsParentListArr = parentArr;
    [self createSelectView];

}
-(void)createScrollView{
    self.homeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, statusBarHeight, ScreenWidth, ScreenHeight1-20)];
    self.homeScrollView.delegate = self;
    self.homeScrollView.contentSize = CGSizeMake(ScreenWidth, 1000);
    self.homeScrollView.showsVerticalScrollIndicator = NO;
    self.homeScrollView.userInteractionEnabled = YES;
//    [self.view addSubview:self.homeScrollView];
    [self.view addSubview:self.homeScrollView];
}
-(void)createSeachBarView{
    bigButton * button = [[bigButton alloc] init];
    button.frame = CGRectMake(ScreenWidth-10.5-40, 0, 40,40);
    [button setBackgroundImage:[UIImage imageNamed:@"购物车"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(carMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.homeScrollView addSubview:button];
    
    bigButton * backB  = [[bigButton alloc] init];
    backB.frame = CGRectMake(10.5, 0, 44, 44);
    [backB setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [backB addTarget:self action:@selector(backMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.homeScrollView addSubview:backB];
    _searchB = [[UISearchBar alloc] initWithFrame:CGRectMake(CGRectGetMaxX(backB.frame), 8, ScreenWidth-(CGRectGetMaxX(backB.frame)+23.5+13.5+44+10.5), 28)];
    NSLog(@"%f",self.searchB.frame.size.width);
    _searchB.searchBarStyle = UISearchBarStyleMinimal;
    [_searchB setBackgroundImage:[[UIImage alloc]init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefaultPrompt];
    [self.homeScrollView addSubview:_searchB];
 
}
-(void)backMethod{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)carMethod{
    storeCarViewController * carVC = [[storeCarViewController alloc] init];
    [self.navigationController pushViewController:carVC animated:YES];
}
-(void)requestHomeBanner{
    homeBannerParser * parser = [[homeBannerParser  alloc] init];
    parser.myDelegate = self;
    [parser requestBannerPosition:393 num:3];
}
-(void)successGetCommonBanner:(NSMutableArray *)bannerArr{
    NSMutableArray * arr = [[NSMutableArray alloc] init];
    for (bannerModel*model in bannerArr) {
        [arr addObject:model.pic];
    }
    self.bannerView.imgArr = arr;
}
#pragma mark  banner轮播
-(void)createBannerView{
    self.bannerImgArr = [[NSMutableArray alloc] init];
    for (int i=0; i<3; i++) {
        [self.bannerImgArr addObject:@""];
    }
    self.bannerView = [[CustomBannerView alloc] initWithFrame:CGRectMake(homeSpacing, CGRectGetMaxY(self.searchB.frame)+homeSpacing, self.homeScrollView.frame.size.width-2*homeSpacing, 0.329787*ScreenHeight) imageArr:self.bannerImgArr isTimer:YES];
    self.bannerView.delegate =self;
    [self.homeScrollView addSubview:self.bannerView];
    [self reloadScrollViewFrame:CGRectGetMaxY(self.bannerView.frame)];

   
}
-(void)createSelectView{
    NSMutableArray * arr = [[NSMutableArray alloc] init];
    for (int i=0; i<self.goodsParentListArr.count; i++) {
        goodsParentListModel * model = self.goodsParentListArr[i];
        storeTypeOneViewController *title_0VC = [[storeTypeOneViewController alloc] init];
        title_0VC.goodsChildrenListArr = model.childArr;
        title_0VC.myTag = i;
        [self addChildViewController:title_0VC];
        [arr addObject:model.name];
    }
    _pageTabView = [[XXPageTabView alloc] initWithChildControllers:self.childViewControllers childTitles:arr];

   _pageTabView.frame = CGRectMake(0, CGRectGetMaxY(self.bannerView.frame)+50, ScreenWidth, ScreenHeight);
   _pageTabView.tabFrame = CGRectMake(0, 0, ScreenWidth, 44);
   _pageTabView.tabSize = CGSizeMake(ScreenWidth, 44);

   _pageTabView.tabItemFont = [UIFont fontWithName:@"PingFang SC Medium" size: 17];
//    _pageTabView.unSelectedColor = [UIColor orangeColor];;
   _pageTabView.selectedColor = [UIColor colorWithRed:98/255.0 green:191/255.0 blue:180/255.0 alpha:1.0];
   _pageTabView.bodyBounces = NO;
   _pageTabView.titleStyle = XXPageTabTitleStyleDefault;
   _pageTabView.indicatorStyle = XXPageTabIndicatorStyleFollowText;
   _pageTabView.selectedTabIndex = 0;
    _pageTabView.delegate = self;
   _pageTabView.tabBackgroundColor =  [UIColor whiteColor];;
   [self.homeScrollView addSubview:_pageTabView];
//    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
//    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    if (self.pageListView==nil) {
//        self.pageListView = [[goodsChildListCollectionView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.bannerView.frame), ScreenWidth-20, 40) collectionViewLayout:flow];
//
//    }
//    self.pageListView.showsHorizontalScrollIndicator=NO;
////    self.pageListView.backgroundColor = SelectColor;
//    self.pageListView.ListArr = self.goodsParentListArr;
//    [self.pageListView registerNib:[UINib nibWithNibName:NSStringFromClass([parentCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"parentCell"];
//    [self.pageListView items:self.goodsParentListArr.count withRowHeight:40 withRowWidth:40 withSpacing:26 withIdentify:@"parentCell" selectedCell:^(NSIndexPath * _Nonnull indexPath) {
//        [self.childListCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:indexPath.section] atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
//    }];
//    [self.homeScrollView addSubview:self.pageListView];
//    [self reloadScrollViewFrame:CGRectGetMaxY(self.pageTabView.frame)];
//    [self createChildListMethod];
}

//-(void)createChildListMethod{
//    NSMutableArray * arr = [[NSMutableArray alloc] init];
//    for (goodsParentListModel*modelP in self.goodsParentListArr) {
//        [arr addObject:modelP.childArr];
//     }
//    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
//    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    if (self.childListCollectionView==nil) {
//        self.childListCollectionView = [[goodsChildListCollectionView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.pageListView.frame)+18, ScreenWidth-20, 0.2075*ScreenHeight1) collectionViewLayout:flow];
//
//    }
//     self.childListCollectionView.showsHorizontalScrollIndicator=NO;
////    self.childListCollectionView.backgroundColor = SelectColor;
////    self.childListCollectionView.ListArr = self.goodsChildrenListArr;
////    goodsParentListModel * modelP = self.goodsParentListArr[0];
//   //        storeTypeOneViewController *title_0VC = [[storeTypeOneViewController alloc] init];
//    self.childListCollectionView.ListArr = arr;
//    [self.childListCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([childListCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"cell"];
//    [self.childListCollectionView items:arr.count withRowHeight:0.2075*ScreenHeight1 withRowWidth:0.341*ScreenWidth withSpacing:10  withIdentify:@"cell" selectedCell:^(NSIndexPath * _Nonnull indexPath) {
//        goodsChildrenListModel * model = arr[indexPath.row];
//        
//        [self requestGoodsList:model];
//    }];
//    [self.homeScrollView addSubview:self.childListCollectionView];
//    [self reloadScrollViewFrame:CGRectGetMaxY(self.childListCollectionView.frame)];
//   
//
//}
-(void)requestGoodsList:(goodsChildrenListModel*)model{
    goodsListParser * parser = [[goodsListParser alloc] init];
    parser.myDelegate = self;
    [parser requestWitCatId:[model.myId integerValue] catIds:[[NSArray alloc]init] keyword:@"" orderType:@"" pageNum:1 pageSize:1 position:0 shopCat:0 shopId:0];
}
-(void)successGetGoodsList:(NSMutableArray *)arr{
    self.listArr  = arr;
    self.listCollectionView.ListArr = arr;
    [self createListCollectionView];
   

 }
-(void)createListCollectionView{
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    CGFloat height =0;
    if (self.listArr.count%2==0) {
        height = self.listArr.count/2*((ScreenWidth-27)/2*1.4023+7) ;
    }else{
        height = (self.listArr.count/2+1)*((ScreenWidth-27)/2*1.4023+7) ;
    }
    [self.listCollectionView removeFromSuperview];
     self.listCollectionView = [[productListCollectionView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.childListCollectionView.frame)+18, ScreenWidth-20, height) collectionViewLayout:flow];

   
     self.listCollectionView.showsHorizontalScrollIndicator=NO;
//    self.childListCollectionView.backgroundColor = SelectColor;
    self.listCollectionView.ListArr = self.listArr;
    [self.listCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([productListCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"cell"];
    [self.listCollectionView items:self.listArr.count withRowHeight:ScreenWidth*0.464*1.4023 withRowWidth:(CGRectGetWidth(self.listCollectionView.frame)-14)/2 withSpacing:7 selectedCell:^(NSIndexPath * _Nonnull indexPath) {
        
    }];
    [self.homeScrollView addSubview:self.listCollectionView];
    [self reloadScrollViewFrame:CGRectGetMaxY(self.listCollectionView.frame)];

    NSLog(@"%f===%f",self.listCollectionView.contentSize.height,height);
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadFrame" object:nil userInfo:@{@"height":[NSNumber numberWithFloat:CGRectGetMaxY(self.childListCollectionView.frame)+18+height]}];
}
-(void)createCellView{
    UIView * contentView =(UIView*) [self.view viewWithTag:10000];
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 30, 30)];
    view.backgroundColor = [UIColor redColor];
    [contentView addSubview:view];
}
 
#pragma mark CustomBannerViewDelegate 轮播图点击跳转
-(void)imageViewDidClick:(NSInteger)clickTag{
    
}
- (void)pageTabViewDidEndChange{

}
-(void)reloadFrame:(NSNotification*)noti{
    CGFloat height = [[noti.userInfo objectForKey:@"height"]floatValue];
    self.pageTabView.frame = CGRectMake(0, CGRectGetMaxY(self.bannerView.frame)+50, ScreenWidth, height+40);
    [self reloadScrollViewFrame:CGRectGetMaxY(self.pageTabView.frame)];
    NSLog(@"%f====%f",self.pageTabView.frame.size.height,self.homeScrollView.contentSize.height);
}
-(void)reloadScrollViewFrame:(CGFloat)height{
    self.homeScrollView.contentSize= CGSizeMake(ScreenWidth, height) ;
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
