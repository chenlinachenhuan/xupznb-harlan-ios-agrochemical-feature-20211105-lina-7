//
//  trendViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/22.
//

#import "trendViewController.h"
#import "trendCollectionView.h"
#import "trendCollectionViewCell.h"
#import "trendModel.h"
#import "trendImageView.h"
#import "trendDetailViewController.h"
#import "trendDataModel.h"
#import "trendProtocol.h"
#import "trendListParser.h"
#import "trendDeleteParser.h"
#import "trendFabulousParser.h"
@interface trendViewController ()<UIScrollViewDelegate,trendProtocolDelegate,trendListParserDelegate,trendDeleteParserDelegate,trendFabulousParserDelegate>
@property(nonatomic,retain)UIScrollView *homeScrollView;
@property(nonatomic,retain)trendCollectionView *cellView;
@property(nonatomic,retain)NSMutableArray * dataModelArr;
@property(nonatomic,retain)trendModel * model;
@property(nonatomic,retain)NSMutableArray * moments;
@property(nonatomic,retain)UILabel * footerLabel;
@property(nonatomic,assign)NSInteger total;
@property(nonatomic,assign)int32_t pageNum;
@property(nonatomic,assign)BOOL loadMore;
@property(nonatomic,assign)BOOL refrash;

@property(nonatomic,assign)CGFloat lastcontentOffset;
@property(nonatomic,retain)UIRefreshControl *control;
@end

@implementation trendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:248/255.0 green:250/255.0 blue:251/255.0 alpha:1.0];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reloadDataMethod) name:@"reloadDataMethod" object:nil];
    self.pageNum = 10;
    [self getTrendListMethod:10];
    [self createScrollView];
    [self createCellView];
//    [self createFooterView];
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;

}
-(void)reloadDataMethod{
//    self.pageNum=10;
//    [self.cellView removeFromSuperview];
//    self.loadMore=NO;
    [self getTrendListMethod:self.pageNum];
   
}
-(void)getTrendListMethod:(int32_t)pageSize{
//    [[ChrysanthemumIndexView sharedMasterUser] show];
    trendListParser * parser = [[trendListParser alloc] init];
    parser.myDelegate = self;
    [parser requestWithCatId:0 keyword:@"" pageNum:1 pageSize:pageSize showStatus:1];
}
-(void)successTrendListMethod:(NSMutableArray *)listArr withTotal:(nonnull NSString *)total{
    [[ChrysanthemumIndexView sharedMasterUser] remove];
    self.dataModelArr = [[NSMutableArray alloc] init];
    for (trendModel * model in listArr) {
        trendDataModel * dataModel = [[trendDataModel alloc] init];
        dataModel.moment = model;
        [self.dataModelArr addObject:dataModel];
    }
    self.total = [total intValue];
    self.cellView.momentFrames = self.dataModelArr;
    [self createCellView];

    
    [self reloadScrollViewFrame:CGRectGetMaxY(self.cellView.frame)];
    self.loadMore = NO;
    
    [self.control endRefreshing];

}
-(void)failedMethod:(NSString *)message{
    [[ChrysanthemumIndexView sharedMasterUser] remove];
    FBUtilShowTipView(self.view,message);
}
-(void)createScrollView{
    self.homeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 11.5, ScreenWidth, ScreenHeight)];
    self.homeScrollView.delegate = self;
    self.homeScrollView.contentSize = CGSizeMake(ScreenWidth, 1000);
    self.homeScrollView.showsVerticalScrollIndicator = NO;
    self.homeScrollView.userInteractionEnabled = YES;
//    self.homeScrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.homeScrollView];
//    [self.tabBarController.view addSubview:self.homeScrollView];
    self.control = [[UIRefreshControl alloc] init];
    [self.control addTarget:self action:@selector(reFreshstatus:) forControlEvents:UIControlEventValueChanged];
       //不用自定义frame
    [self.homeScrollView addSubview:self.control];
       //一进来就有刷新效果（但刷新数据是要手动的)
       [self.control beginRefreshing];
 
    
}
-(void)reFreshstatus:(UIRefreshControl*)control{
    
    [self getTrendListMethod:10];}
-(void)createCellView{
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [self.cellView removeFromSuperview];
    self.cellView = [[trendCollectionView alloc] initWithFrame:CGRectMake(homeSpacing, 0, ScreenWidth-2*homeSpacing,620*self.dataModelArr.count) collectionViewLayout:flow];
    [ self.cellView registerClass:[trendCollectionViewCell class] forCellWithReuseIdentifier:@"trendCollectionViewCell"];
//    self.popularClassCollectionView.backgroundColor = [UIColor orangeColor];
    self.cellView.scrollEnabled = NO;
    self.cellView.showsVerticalScrollIndicator = NO;
 
    [self.cellView items:6 withRowHeight:620 withRowWidth:(ScreenWidth-32) withSpacing:12 isShowFooter:YES dataModelArr:self.dataModelArr selectedCell:^(NSIndexPath * _Nonnull indexPath) {
 
    } delegate:self];
    
    CGFloat height = self.cellView.collectionViewLayout.collectionViewContentSize.height;
    self.cellView.frame = CGRectMake(homeSpacing, 0, ScreenWidth-32, height);
    [self.homeScrollView addSubview:self.cellView];
    [self reloadScrollViewFrame:CGRectGetMaxY(self.cellView.frame)];
    
    
}
-(void)createFooterView{
    _footerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.cellView.frame),ScreenWidth, 40)];
    _footerLabel.text = @"~下面没有啦~";
    _footerLabel.textColor = [UIColor colorWithRed:162/255.0 green:166/255.0 blue:172/255.0 alpha:1.0];
    _footerLabel.font = [UIFont fontWithName:@"PingFang SC" size:12];
    _footerLabel.textAlignment = NSTextAlignmentCenter;
    [self.homeScrollView addSubview:_footerLabel];
    [self reloadScrollViewFrame:CGRectGetMaxY(_footerLabel.frame)];
}
#pragma mark 点击评论协议
-(void)didselectCell:(NSInteger)tag{
    trendDetailViewController *trend = [[trendDetailViewController alloc] init];
    trendDataModel * model =self.dataModelArr[tag];
    trend.model =model.moment;
    [self.navigationController pushViewController:trend animated:YES];
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat currentOffsetY = scrollView.contentOffset.y;
    
    if (!self.loadMore&&currentOffsetY + scrollView.frame.size.height> scrollView.contentSize.height){
        if (self.dataModelArr.count<self.total) {
            if (self.loadMore == NO) {
                self.loadMore = YES;
                self.pageNum = self.pageNum+10;
                [self getTrendListMethod:self.pageNum];
            }
        }
    }
    if (scrollView.contentOffset.y <= -50) {

            if (self.control.tag == 0) {

//                self.control.text = @"松开刷新";
                [self.control beginRefreshing];
                [self reFreshstatus:self.control];
            }

            self.control.tag = 1;

        }else{

    //防止用户在下拉到contentOffset.y <= -50后不松手，然后又往回滑动，需要将值设为默认状态

            self.control.tag = 0;

//            self.control.text = @"下拉刷新";

        }

}
#pragma mark 刷新列表
-(void)reloadScrollViewFrame:(CGFloat)height{
    if (statusBarHeight==20) {
        height = height+49;
    }else{
        height=height+79;
    }
    self.homeScrollView.contentSize= CGSizeMake(ScreenWidth, height) ;
}
-(void)deleteButtonClick:(trendModel *)model{
//    [[ChrysanthemumIndexView sharedMasterUser]show];
    trendDeleteParser * parser = [[trendDeleteParser alloc]init];
    parser.myDelegate = self;
    [parser requestWithMyId:[model.myId intValue]];
}

-(void)successDeleteTrend{
    FBUtilShowTipView(self.view,@"删除成功");
    [self reloadDataMethod];
}
-(void)likeButtonClick:(trendModel *)model{
//    [[ChrysanthemumIndexView sharedMasterUser]show];
    trendFabulousParser * parser = [[trendFabulousParser alloc]init];
    parser.myDelegate = self;
    [parser getTrendFabulous:[model.myId intValue]];
}
-(void)successFabulousTrend{
    [self reloadDataMethod];

    
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
