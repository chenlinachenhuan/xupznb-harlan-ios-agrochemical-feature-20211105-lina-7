//
//  Agro_homeViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/6.
//
#import "Agro_homeViewController.h"
#import "CustomBannerView.h"
#import "CustomButton.h"
#import "CustomNewsTableView.h"
#import "PYSearch.h"
#import "policyTableViewCell.h"
#import "CustomHorizontalCollectionView.h"
#import "CustomVerticallyCollectionView.h"
#import "waterCollectionViewCell.h"
#import "VerticalCollectionViewCell.h"
#import "hotConsultTableViewCell.h"
#import "customLeftAndRightButton.h"
#import "policyBannerView.h"
#import "newsListViewController.h"
#import "classDetailViewController.h"
#import "classHomeViewController.h"
#import "storeHomeViewController.h"
#import "newsParser.h"
#import "NewsTextMedel.h"
#import "newsDetailViewController.h"
#import "homeBannerParser.h"
#import "policyListParser.h"
#import "policyListModel.h"
#import "policyViewController.h"
#import "knowledgeListViewController.h"
#import "knowledgeListParser.h"
#import "knowledgeDetailViewController.h"
#import "knowledgeListModel.h"
#import "classListParser.h"
#import "classListModel.h"
#import "classHomeViewController.h"

@interface Agro_homeViewController ()<UIScrollViewDelegate,CustomBannerViewDelegate,PYSearchViewControllerDelegate,policyBannerViewDelegate,newsProtocolDelegate,homeBannerParserDelegate,policyListParserDelegate,knowledgeListParserDelegate,classListParserDelegate>
{
    

}
@property(nonatomic,retain)UIScrollView *homeScrollView;
@property(nonatomic,retain)NSMutableArray *bannerImgArr;
@property(nonatomic,retain)CustomBannerView * bannerView;
@property(nonatomic,retain)UIView * firstButtonView;
@property(nonatomic,retain)UIView * secondButtonView;
@property(nonatomic,retain)UIView * thirdButtonView;
@property(nonatomic,retain)NSMutableArray *buttonImgArr;
@property(nonatomic,retain)NSMutableArray *buttonTitleArr;
@property(nonatomic,retain)CustomNewsTableView *newsTableView;
@property(nonatomic,retain)policyBannerView *policyView;
@property(nonatomic,retain)CustomHorizontalCollectionView *lastClassCollectionView;
@property(nonatomic,retain)CustomVerticallyCollectionView *popularClassCollectionView;
@property(nonatomic,retain)CustomNewsTableView *consultTableView;
@property(nonatomic,retain)NSMutableArray *policyTitleArr;

@property(nonatomic,retain)UISearchBar * searchB;
@property(nonatomic,retain)NSMutableArray *newsListArr;
@property(nonatomic,retain)NSMutableArray *knowledgeListArr;
@property(nonatomic,retain)NSMutableArray *classListArr;

@end

@implementation Agro_homeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = colorH(248, 250, 251);
    [self initMethod];
    [self createScrollView];
    [self setNaviTitleMethod];
    [self createSeachBarView];
    [self createBannerView];
    [self createButtonView];
    [self createlastPolicyView];
//    [self createhotNewsView];
//    [self createLastClassView];
//    [self createPupolerClassView];
//    [self createhotConsultView];
//    [self createLastLabel];
    [self requestHomeBanner];
    [self getPolicyDataParser];
//    [self requestKnowledgeList];
    NSData *data= [[NSUserDefaults standardUserDefaults] objectForKey:@"loginModel"];
    NSMutableArray * arr =[NSKeyedUnarchiver unarchiveObjectWithData:data];
    Agro_appDelegate.loginModel =[arr lastObject];
    if (Agro_appDelegate.loginModel!=nil) {
        Agro_appDelegate.isLogin = YES;
    }
    NSLog(@"%@",Agro_appDelegate.loginModel.token);
 }
-(void)initMethod{
    self.newsListArr = [[NSMutableArray alloc] init];
    self.policyTitleArr = [[NSMutableArray alloc] init];
    self.knowledgeListArr = [[NSMutableArray alloc] init];
    self.classListArr = [[NSMutableArray alloc] init];

}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController
   .navigationBarHidden = YES;
}
#pragma mark 设置导航栏
-(void)setNaviTitleMethod{
    
//    [ self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];//设置导航背景色为clear
//    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];//隐藏导航栏底部线条
//    [self.navigationController.navigationBar setBarTintColor:[UIColor clearColor]];
//
//    UIView * titleView = [[UIView alloc] init];
//    titleView.frame = CGRectMake(0, statusBarHeight, ScreenWidth, 44);
////    titleView.backgroundColor = colorH(255, 194, 69);//设置导航背景色为clear;
//
//    self.navigationItem.titleView =titleView;
//    _searchB = [[UISearchBar alloc] initWithFrame:CGRectMake(20, 5, ScreenWidth-40, 40)];
//    _searchB.barTintColor = [UIColor whiteColor];
//    [titleView addSubview:_searchB];
//    UIButton * searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    searchButton.backgroundColor = [UIColor redColor];
//    [searchButton addTarget:self action:@selector(searchButtonMethod) forControlEvents:UIControlEventTouchUpInside];
//    searchButton.frame = CGRectMake(0, 0, 100, 40);
//    [titleView addSubview:searchButton];
}
 
-(void)createScrollView{
    self.homeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, statusBarHeight, ScreenWidth, ScreenHeight)];
    self.homeScrollView.delegate = self;
    self.homeScrollView.contentSize = CGSizeMake(ScreenWidth, 1000);
    self.homeScrollView.showsVerticalScrollIndicator = NO;
    self.homeScrollView.userInteractionEnabled = YES;
//    [self.view addSubview:self.homeScrollView];
    [self.view addSubview:self.homeScrollView];
}
-(void)createSeachBarView{
    
    _searchB = [[UISearchBar alloc] initWithFrame:CGRectMake(homeSpacing, 8, 0.837333*ScreenWidth, 0.0496554*ScreenHeight)];
    NSLog(@"%f",self.searchB.frame.size.width);
    _searchB.searchBarStyle = UISearchBarStyleMinimal;
    [_searchB setBackgroundImage:[[UIImage alloc]init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefaultPrompt];
    [self.homeScrollView addSubview:_searchB];
//    _searchB.layer.cornerRadius = 14;
//    _searchB.clipsToBounds = YES;
//    _searchB.backgroundColor = [UIColor redColor];
//    [self reloadScrollViewFrame:CGRectGetMaxY(self.bannerView.frame)];

   
    UIButton * button = [[UIButton alloc] init];
    button.frame = CGRectMake(self.homeScrollView.frame.size.width-CGRectGetHeight(self.searchB.frame)/2-homeSpacing, self.searchB.frame.origin.y+CGRectGetHeight(self.searchB.frame)/4, CGRectGetHeight(self.searchB.frame)/2,CGRectGetHeight(self.searchB.frame)/2);
    [button setBackgroundImage:[UIImage imageNamed:@"菜单"] forState:UIControlStateNormal];
    [self.homeScrollView addSubview:button];
//    self.searchB.frame = CGRectMake(homeSpacing, 8, self.homeScrollView.frame.size.width-2*homeSpacing-button.frame.size.width-15, 0.0496554*ScreenHeight);
//    [button mas_makeConstraints:^(MASConstraintMaker *make) {
////           make.right.equalTo(self.homeScrollView.mas_right).offset(16);
//           make.top.equalTo(self.homeScrollView).offset(15);
//           make.left.equalTo(self.homeScrollView.mas_right).offset(ScreenWidth-16-0.03733333*ScreenWidth);
//           make.width.equalTo(self.homeScrollView.mas_width).multipliedBy(0.03733333);
//           make.height.equalTo(button.mas_width).multipliedBy(1);
//
//
//       }];
//    [_searchB mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.homeScrollView).offset(homeSpacing);
//        make.top.equalTo(self.homeScrollView).offset(8);
//        make.height.equalTo(self.homeScrollView).multipliedBy(0.049645);
//        make.width.equalTo(self.homeScrollView).multipliedBy(0.8373333);
//        make.right.equalTo(button.mas_left).offset(-homeSpacing);
//
//    }];
//    [button mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.searchB);
////        make.top.equalTo(self.searchB).offset(8);
//        make.left.equalTo(self.searchB.mas_right).offset(-67);
//        make.width.equalTo(self.searchB.mas_height).multipliedBy(0.5);
//        make.height.equalTo(button.mas_width).multipliedBy(1);
//
//
//    }];
//    [button mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.top.mas_equalTo(self.searchB.mas_top).offset(18);
//        make.left.mas_equalTo(self.searchB.mas_right).offset(15);
////        make.height.equalTo(@14);
////        make.width.equalTo(@14);
//        make.centerY.equalTo(self.searchB);
////                make.left.equalTo(self.homeScrollView).mas_offset(15);
//        make.right.equalTo(self.homeScrollView);
////                //make.width.equalTo(blueView);
//        make.height.mas_equalTo(@(14));
////        make.right.mas_equalTo(self.homeScrollView.mas_right).offset(16);
//     }];
}
-(void)requestHomeBanner{
    homeBannerParser * parser = [[homeBannerParser  alloc] init];
    parser.myDelegate = self;
    [parser requestBannerPosition:323 num:3];
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
    
   
}
#pragma mark CustomBannerViewDelegate 轮播图点击跳转
-(void)imageViewDidClick:(NSInteger)clickTag{
    
}
#pragma mark  创建button
-(void)createButtonView{
    float width = (ScreenWidth-homeSpacing*2)/5;
    float height = 0.106383*ScreenHeight;
    self.firstButtonView = [[UIView alloc] initWithFrame:CGRectMake(homeSpacing, CGRectGetMaxY(self.bannerView.frame), ScreenWidth-2*homeSpacing, height)];
    self.firstButtonView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    self.firstButtonView.layer.shadowColor = [UIColor colorWithRed:94/255.0 green:127/255.0 blue:253/255.0 alpha:0.05].CGColor;
    self.firstButtonView.layer.shadowOffset = CGSizeMake(3,3);
    self.firstButtonView.layer.shadowOpacity = 1;
    self.firstButtonView.layer.shadowRadius = 10;
    self.firstButtonView.layer.cornerRadius = 10;
    [self.homeScrollView addSubview:self.firstButtonView];
    [self reloadScrollViewFrame:CGRectGetMaxY(self.firstButtonView.frame)];
    self.buttonImgArr = [NSMutableArray arrayWithObjects:@"农资商城",@"土地资源",@"政策资讯",@"农资包采",@"报告大厅",@"信贷投资",@"设施建设",@"查补贴",@"飞防作业",@"收割",@"作物交易", nil];
    self.buttonTitleArr = [NSMutableArray arrayWithObjects:@"农资商城",@"土地资源",@"政策资讯",@"农资包采",@"报告大厅",@"信贷投资",@"设施建设",@"查补贴",@"飞防作业",@"收割",@"作物交易", nil];
    for (int i=0; i<5; i++) {
        CustomButton * button = [CustomButton buttonWithType:UIButtonTypeCustom];
        button.frame =CGRectMake(width*i, 0, width, height);
        [button buttonimage:[UIImage imageNamed:self.buttonImgArr[i]] title:self.buttonTitleArr[i] buttonHeight:height];
         button.tag = 100+i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.firstButtonView addSubview:button];
    }
    
    self.secondButtonView = [[UIView alloc] initWithFrame:CGRectMake(homeSpacing, CGRectGetMaxY(self.firstButtonView.frame)+homeSpacing, ScreenWidth-2*homeSpacing, 0.187943*ScreenHeight)];
    [self.homeScrollView addSubview:self.secondButtonView];
    [self reloadScrollViewFrame:CGRectGetMaxY(self.secondButtonView.frame)];
    float width1 = (CGRectGetWidth(self.secondButtonView.frame)-12.5*2)/3;
    float height1 = 0.45283*self.secondButtonView.frame.size.height;
    NSMutableArray * arr = [NSMutableArray arrayWithObjects:@"立即查询",@"立即查询",@"立即查询",@"立即查询",@"高效经济",@"安全、经济", nil];
     for (int i=0; i<6; i++) {
        customLeftAndRightButton * button = [customLeftAndRightButton buttonWithType:UIButtonTypeCustom];
         button.isShowRightImage = NO;
        [button setBackgroundColor:[UIColor whiteColor]];
        if (i<3) {
            if (i<2) {
                button.isShowRightImage = YES;
            }
             
            button.frame = CGRectMake((12.5+width1)*i, 0, width1, height1);
        }else if (i<6){
            button.frame = CGRectMake((12.5+width1)*(i-3), height1+10, width1, height1);
        }
//        button.leftImage.image =[UIImage imageNamed:self.buttonImgArr[i+5]];
        [button buttonimage:[UIImage imageNamed:self.buttonImgArr[i+5]] topTitle:self.buttonTitleArr[i+5] rightImage:[UIImage imageNamed:@"新方案"] bottomTitle:arr[i] nextImage:[UIImage imageNamed:@"进入1"] isRightImage:button.isShowRightImage];
        [self.secondButtonView addSubview:button];
    }
 }
-(void)getPolicyDataParser{
    policyListParser* parser = [[policyListParser alloc] init];
    parser.myDelegate = self;
    [parser requestPolicyList:0 cat2Id:0 catId:0 cityId:0 cropId:0 expireStatus:-1 keyword:@"" pageNum:1 pageSize:10 provinceId:0 showStatus:1];
    
}
-(void)successGetPolicyList:(NSMutableArray *)arr{
    self.policyTitleArr =arr;
    NSMutableArray * ListArr =[[NSMutableArray alloc] init];
     for (policyListModel * model in arr) {
         [ListArr addObject:model.title];
    }
    self.policyView.titleArr = ListArr;
}
#pragma mark  创建最新政策列表
-(void)createlastPolicyView{
    self.policyTitleArr = [NSMutableArray arrayWithObjects:@"", nil];
    self.policyView = [[policyBannerView alloc] initWithFrame:CGRectMake(homeSpacing, CGRectGetMaxY(self.secondButtonView.frame)+homeSpacing, ScreenWidth-2*homeSpacing, 30)  titleArr:self.policyTitleArr];
    self.policyView.delegate = self;
    [self.homeScrollView addSubview:self.policyView];
    [self reloadScrollViewFrame:CGRectGetMaxY(self.policyView.frame)];
    [self requestNewsListMethod];

}
#pragma mark policyViewDelegate 轮播图点击跳转 tag 200+
-(void)policyViewDidClick:(NSInteger)clickTag{
    policyViewController * policyVC = [[policyViewController alloc] init];
    policyListModel * model = self.policyTitleArr[clickTag-200];
    policyVC.myId = model.myId;
    [self.navigationController pushViewController:policyVC animated:YES];
}
-(CGFloat)createTitleView:(NSString*)title litleTitle:(NSString*)litleTitle frame:(CGRect)frame withTag:(CGFloat)tag{
     
    UILabel * titleL = [[UILabel alloc] initWithFrame:CGRectMake(15.5, frame.origin.y+frame.size.height+24, ScreenWidth-2*homeSpacing, 52)];
    titleL.text = title;
    titleL.numberOfLines=0;
    titleL.textColor = [UIColor blackColor];
//    titleL.backgroundColor = [UIColor orangeColor];
    titleL.font = [UIFont fontWithName:@"PingFang SC" size: 15];
    CGSize size = CGSizeMake(ScreenWidth-2*homeSpacing, MAXFLOAT);//设置高度宽度的最大限度
    CGRect rect = [title boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:20]} context:nil];
    titleL.frame = CGRectMake(15.5, CGRectGetMaxY(frame)+24, ScreenWidth-32, rect.size.height);
    [self.homeScrollView addSubview:titleL];
    [self reloadScrollViewFrame:CGRectGetHeight(titleL.frame)];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(ScreenWidth-homeSpacing-ScreenHeight*0.0248227*0.5714286, titleL.center.y-ScreenHeight*0.0248227*0.5, ScreenHeight*0.0248227*0.5714286, ScreenHeight*0.0248227);
    [button setImage:[UIImage imageNamed:@"大模块进入"] forState:UIControlStateNormal];
    button.tag=tag;
    [button addTarget:self action:@selector(enterButtonMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.homeScrollView addSubview:button];
    NSLog(@"%f",titleL.frame.origin.y);
    UILabel * litleTitleL = [[UILabel alloc] initWithFrame:CGRectMake(15.5, CGRectGetMaxY(titleL.frame)+5.5, ScreenWidth-2*homeSpacing, 0)];
    litleTitleL.text = litleTitle;
    litleTitleL.numberOfLines=0;
    litleTitleL.textColor =[UIColor colorWithRed:162/255.0 green:166/255.0 blue:172/255.0 alpha:1.0];
//    litleTitleL.backgroundColor = [UIColor greenColor];
    litleTitleL.font = [UIFont fontWithName:@"PingFang-SC-Regular" size: 12];
    CGFloat fontSize = 12;
    if ([litleTitle isEqualToString:@""]) {
        fontSize = 0;
    }
    CGRect rect1 = [litleTitle boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]} context:nil];
    litleTitleL.frame = CGRectMake(15.5, CGRectGetMaxY(titleL.frame)+5.5, ScreenWidth-32, rect1.size.height);
    [self.homeScrollView addSubview:litleTitleL];
    [self reloadScrollViewFrame:CGRectGetHeight(litleTitleL.frame)];
     return litleTitleL.frame.origin.y+litleTitleL.frame.size.height;
}
-(void)requestNewsListMethod{
    newsParser * parser =[[newsParser alloc] initWithViewProtocol:self];
    [parser requestWithCat2Id:0 withCatId:0 withKeyWord:@"" withPageNum:1 withPageSize:10 withShowStatus:1 ] ;
}
-(void)success:(NSMutableArray *)arr total:(NSInteger)total{
    self.newsListArr = arr;
     [self createhotNewsView];
//    [self.newsTableView reloadData];

   
    
}
#pragma mark  最新资讯
-(void)createhotNewsView{
    float y= [self createTitleView:@"最新资讯" litleTitle:@""  frame:self.policyView.frame withTag:10000];
    __weak CustomNewsTableView * tb = self.newsTableView;
    NSUInteger count =0;
    CGFloat height =0;
    if (_newsListArr.count<=4) {
        count= _newsListArr.count;
       height = 0.177305*ScreenHeight*_newsListArr.count;
    }else{
        count=4;
        height =0.9146666667*ScreenWidth*0.306122449*4+0.08*ScreenHeight;

    }
    self.newsTableView = [[CustomNewsTableView alloc]initWithFrame:CGRectMake(homeSpacing, y+13.5, self.homeScrollView.frame.size.width-2*homeSpacing, height) headerHeight: 0.08*ScreenHeight style:UITableViewStylePlain rowCount:count cellHeight:0.9146666667*ScreenWidth*0.306122449 cell:^UITableViewCell *(NSIndexPath *indexPath) {
        // 创建你自定义的cell
        static NSString *identifier = @"policyCell";
        policyTableViewCell *cell = [tb dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[[UINib nibWithNibName:@"policyTableViewCell" bundle:nil]instantiateWithOwner:self options:nil]lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (self.newsListArr.count!=0) {
            NewsTextMedel * model = self.newsListArr[indexPath.row];
            [cell.imageV sd_setImageWithURL:[NSURL URLWithString:model.pic]];
            cell.titleL.text = model.title;
            cell.textL.text = model.albumPics;
            cell.viewsL.text = [NSString stringWithFormat:@"%@ views",model.viewNum];
            cell.timeL.text = model.pubTime;
        }
        
        return cell;
    }selectedCell:^(NSIndexPath *indexPath) {
        if (self.newsListArr.count!=0) {
            NewsTextMedel * model = self.newsListArr[indexPath.row];
            newsDetailViewController * news =[[newsDetailViewController alloc] init];
            news.myId = model.myId;
            [self.navigationController pushViewController:news animated:YES];
        }
    } moreButtonClick:^(UIButton * _Nonnull button) {
        newsListViewController * newsList = [[newsListViewController alloc] init];
        [self.navigationController pushViewController:newsList animated:YES];
    }];
    
    self.newsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.newsTableView.scrollEnabled = NO;
    self.newsTableView.dataArr=self.newsListArr;
    [self.homeScrollView addSubview:self.newsTableView];
    [self reloadScrollViewFrame:CGRectGetMaxY(self.newsTableView.frame)];
    [self requestKnowledgeList];
}
-(void)requestKnowledgeList{
    knowledgeListParser *parser = [[knowledgeListParser alloc] init];
    parser.myDelegate = self;
    [parser requestWithCat2Id:339 withCatId:0 withKeyWord:@"" withPageNum:1 withPageSize:10 withShowStatus:1 withCropId:0];
}
-(void)successGetList:(NSMutableArray *)arr total:(NSInteger)total{
    self.knowledgeListArr = arr;
    [self createLastClassView];
    
}
#pragma mark 技术小文摘
-(void)createLastClassView{
    float y= [self createTitleView:@"技术小文摘" litleTitle:@""  frame:self.newsTableView.frame withTag:20000];
    //    __weak CustomHorizontalCollectionView * tb = self.lastClassCollectionView;
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.lastClassCollectionView = [[CustomHorizontalCollectionView alloc] initWithFrame:CGRectMake(10, y+13.5, ScreenWidth-20, 0.650666667*ScreenWidth*0.444672) collectionViewLayout:flow];
    self.lastClassCollectionView.showsHorizontalScrollIndicator=NO;
    [self.lastClassCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([waterCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"ItemID"];
    [self.lastClassCollectionView items: self.knowledgeListArr.count withRowHeight:0.650666667*ScreenWidth*0.444672 withRowWidth:0.650666667*ScreenWidth withSpacing:5 withHeaderTitle:@"最新课程" cellIdentify:@"ItemID" selectedCell:^(NSIndexPath * _Nonnull indexPath) {
        knowledgeListModel * model = self.knowledgeListArr[indexPath.row];
        knowledgeDetailViewController *detailVC = [[knowledgeDetailViewController alloc] init];
        detailVC.myId =model.myId;
        detailVC.titleStr = @"技术小文摘";
        [self.navigationController pushViewController:detailVC animated:YES];
    }];
    [self.homeScrollView addSubview:self.lastClassCollectionView];
    [self reloadScrollViewFrame:CGRectGetMaxY(self.lastClassCollectionView.frame)];
    self.lastClassCollectionView.listArr = self.knowledgeListArr;

    [self requestClassList];
    
}
-(void)requestClassList{
    classListParser *parser = [[classListParser alloc] init];
    parser.myDelegate = self;
    [parser requestClaaList:0 catId:0 crop2Id:0 cropId:0 keyword:@"" orderBy:@"" pageNum:1 pageSize:10 proficientId:0 publishStatus:1];
}
-(void)successGetClassList:(NSMutableArray *)arr total:(NSInteger)total{
    self.classListArr = arr;
    [self createPupolerClassView];
}
#pragma mark 课程
-(void)createPupolerClassView{
    float y= [self createTitleView:@"本月最受欢迎课程排行榜" litleTitle:@"可以挑选课程进行免费试学，感兴趣再购买"  frame:self.lastClassCollectionView.frame withTag:30000];
    CGFloat height =0;
    if (_classListArr.count<=2) {
        height =(ScreenWidth-32-12)/2*1.2298157;
    }else if (_classListArr.count<=4){
        height =(ScreenWidth-32-12)/2*1.2298157*2+12;

    }else if (_classListArr.count<=6){
        height =(ScreenWidth-32-12)/2*1.2298157*3+12*2;
    }else{
        height =(ScreenWidth-32-12)/2*1.2298157*3+12*2+ScreenHeight*0.0744681;
    }
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    self.popularClassCollectionView = [[CustomVerticallyCollectionView alloc] initWithFrame:CGRectMake(homeSpacing, y+18, ScreenWidth-2*homeSpacing, height) collectionViewLayout:flow];
    [self.popularClassCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([VerticalCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"popularClass"];
    //    self.popularClassCollectionView.backgroundColor = [UIColor orangeColor];
    self.popularClassCollectionView.scrollEnabled = NO;
    self.popularClassCollectionView.showsVerticalScrollIndicator = NO;
    [self.popularClassCollectionView items:MIN(self.classListArr.count, 6) withRowHeight:(ScreenWidth-32-12)/2*1.2298157 withRowWidth:(ScreenWidth-32-12)/2 withSpacing:12 isShowFooter:YES cellIdentify:@"popularClass" selectedCell:^(NSIndexPath * _Nonnull indexPath) {
        classListModel * model = self.classListArr[indexPath.row];
        classDetailViewController * class = [[classDetailViewController alloc] init];
        class.myId = [model.myId integerValue];
        [self.navigationController pushViewController:class animated:YES];
    } moreButtonBlock:^(UIButton * _Nonnull button) {
        classHomeViewController * classhome = [[classHomeViewController alloc] init];
    
        [self.navigationController pushViewController:classhome animated:YES];
    }];
    [self.homeScrollView addSubview:self.popularClassCollectionView];
    [self reloadScrollViewFrame:CGRectGetMaxY(self.popularClassCollectionView.frame)];
    self.popularClassCollectionView.listArr = self.classListArr;

    [self createhotConsultView];
    
}
#pragma mark 热点技术咨询
-(void)createhotConsultView{
    float y = [self createTitleView:@"热点技术咨询" litleTitle:@"" frame:self.popularClassCollectionView.frame withTag:40000];
    __weak CustomNewsTableView * tb = self.consultTableView;
    self.consultTableView = [[CustomNewsTableView alloc]initWithFrame:CGRectMake(self.homeScrollView.frame.origin.x, y+15.5, self.homeScrollView.frame.size.width, 118*4+0.074468*ScreenHeight) headerHeight: 0.074468*ScreenHeight style:UITableViewStylePlain rowCount:4 cellHeight:118 cell:^UITableViewCell *(NSIndexPath *indexPath) {
        // 创建你自定义的cell
        static NSString *identifier = @"consultCell";
        hotConsultTableViewCell *cell = [tb dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[[UINib nibWithNibName:@"hotConsultTableViewCell" bundle:nil]instantiateWithOwner:self options:nil]lastObject];
        }
        cell.backgroundColor = colorH(248, 250, 251);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }selectedCell:^(NSIndexPath *indexPath) {
        //点击cell执行此方法
        NSLog(@"网%ld",indexPath.row);
    } moreButtonClick:^(UIButton * _Nonnull button) {
        
    }];
    //    self.consultTableView.c
    self.consultTableView.backgroundColor = colorH(248, 250, 251);
    self.consultTableView.scrollEnabled = NO;
    self.consultTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.homeScrollView addSubview:self.consultTableView];
    [self reloadScrollViewFrame:CGRectGetMaxY(self.consultTableView.frame)];
    [self createLastLabel];
}
-(void)createLastLabel{
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.consultTableView.frame)-10, ScreenWidth, 40)];
    label.text = @"~到底啦~";
    label.textColor = [UIColor colorWithRed:162/255.0 green:166/255.0 blue:172/255.0 alpha:1.0];
    label.font = [UIFont fontWithName:@"PingFang SC" size:12];
    label.textAlignment = NSTextAlignmentCenter;
    [self.homeScrollView addSubview:label];
    [self reloadScrollViewFrame:CGRectGetMaxY(label.frame)];
}
-(void)enterButtonMethod:(UIButton*)button{
    if (button.tag==10000)/*最新资讯*/ {
        newsListViewController * listVC = [[newsListViewController alloc] init];
        [self.navigationController pushViewController:listVC animated:YES];
    }else if (button.tag==20000)/*技术小文摘*/{
        knowledgeListViewController * listVc = [[knowledgeListViewController alloc] init];
        [self.navigationController pushViewController:listVc animated:YES];
    }else if (button.tag==30000)/*课程*/{
        classHomeViewController * classVC = [[classHomeViewController alloc] init];
        [self.navigationController pushViewController:classVC animated:YES];
    }else if (button.tag==40000)/*热点技术咨询*/{
        
    }
}
-(void)reloadScrollViewFrame:(CGFloat)height{
    self.homeScrollView.contentSize= CGSizeMake(ScreenWidth, height) ;
}

#pragma mark  button点击跳转
-(void)buttonClick:(CustomButton*)button{
    if (button.tag==100) {
        storeHomeViewController * goodVC = [[storeHomeViewController alloc] init];
        [self.navigationController pushViewController:goodVC animated:YES];
    }
    
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
     
}
@end
