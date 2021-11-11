//
//  knowledgeListViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import "knowledgeListViewController.h"
#import "newsCollectionView.h"
#import "newsListCollectionViewCell.h"
#import "CustomNewsTableView.h"
#import "policyTableViewCell.h"
#import "knowledgeListParser.h"
#import "UIImageView+WebCache.h"
#import "knowledgeDetailViewController.h"
#import "childrenByPidParser.h"
#import "knowledgeListModel.h"
#import "newsListView.h"
#import "knowledgeCatListModel.h"
@interface knowledgeListViewController ()<UIScrollViewDelegate,UIGestureRecognizerDelegate,knowledgeListParserDelegate,KnowledgeCatListParserDelegate,newsListViewDelegate>
@property(nonatomic,retain)UIScrollView *homeScrollView;
@property(nonatomic,retain)newsCollectionView *ClassificationView;
@property(nonatomic,retain)newsListView *newsTableView;
@property(nonatomic,retain)UILabel * label;
@property(nonatomic,retain)NSMutableArray * dataArr;
@property(nonatomic,retain)NSMutableArray * cat2NameArr;
@property(nonatomic,assign)NSInteger selectIndex;
@property(nonatomic,assign)BOOL loadMore;
@property(nonatomic,assign)NSInteger total;
@end

@implementation knowledgeListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.view.backgroundColor = BackGroundColor;
    [self initData];
    [self getCatListParser];
   
//    [self createLastLabel];
    [self createNaviView];
    
 }
-(void)initData{
    self.dataArr = [[NSMutableArray alloc] init];
    self.cat2NameArr = [[NSMutableArray alloc] init];

 
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;
    
    
}
-(void)createNaviView{
    UIView * bgV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, TopHeight)];
    bgV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgV];
    bigButton *backButton = [bigButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(10.5, statusBarHeight, 44, 44);
//    backButton.backgroundColor = SelectColor;
    [backButton addTarget:self action:@selector(backButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [backButton setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [self.view addSubview:backButton];
   
    UILabel * title = [[UILabel alloc] initWithFrame:CGRectMake(0, statusBarHeight, ScreenWidth,navBarHeight)];
    title.text = @"技术小文摘";
//    title.backgroundColor = [UIColor redColor];
    title.font = [UIFont fontWithName:@"PingFang SC" size: 17];
    title.numberOfLines = 0;
    title.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:title];
    
    UIButton * rsearchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rsearchButton.frame = CGRectMake(ScreenWidth-16-17, title.center.y-8.5, 17, 17);
    [rsearchButton addTarget:self action:@selector(searchButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [rsearchButton setImage:[UIImage imageNamed:@"搜索1"] forState:UIControlStateNormal];
    [self.view addSubview:rsearchButton];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}
-(void)getCatListParser{
    childrenByPidParser * parser = [[childrenByPidParser alloc] init];
    parser.myDelegate = self;
    [parser requestKnowledgeCatList];
}
-(void)successGetKnowledgeCatList:(NSMutableArray *)arr{
    self.cat2NameArr = arr;
    for (knowledgeCatListModel*model in self.cat2NameArr) {
        model.pageSize = 10;
    }
    [self createNewsListView];
    [self createScrollView];
    [self createhotNewsView];
    [self getNewsDataParser];
}
-(void)getNewsDataParser{
    knowledgeListParser*parser = [[knowledgeListParser alloc]init];
    parser.myDelegate = self;
    knowledgeCatListModel*model = self.cat2NameArr[_selectIndex];
    [parser requestWithCat2Id:339 withCatId:0 withKeyWord:@"" withPageNum:1 withPageSize:model.pageSize withShowStatus:1 withCropId:[model.myId integerValue]];
    
    
}
#pragma mark newsProtocolDelegate
-(void)successGetList:(NSMutableArray *)arr total:(NSInteger)total{
    self.total = total;
    self.dataArr = arr;
    self.loadMore = NO;
    self.newsTableView.myArr = arr;
    
    
}
-(void)failedMethod{
    [[ChrysanthemumIndexView sharedMasterUser] remove];

}

#pragma mark 返回
-(void)backButtonMethod{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark 搜索
-(void)searchButtonMethod{
    
}
-(void)createScrollView{
    self.homeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.ClassificationView.frame)+18, ScreenWidth, ScreenHeight-16-CGRectGetHeight(self.ClassificationView.frame))];
    self.homeScrollView.delegate = self;
    self.homeScrollView.contentSize = CGSizeMake(ScreenWidth, 1000);
    self.homeScrollView.showsVerticalScrollIndicator = NO;
    self.homeScrollView.userInteractionEnabled = YES;
//    [self.view addSubview:self.homeScrollView];
    [self.view addSubview:self.homeScrollView];
}
#pragma mark 资讯分类选择
-(void)createNewsListView{
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.ClassificationView = [[newsCollectionView alloc] initWithFrame:CGRectMake(0, TopHeight+16, ScreenWidth, 0.369942197*ScreenWidth*0.23066667) collectionViewLayout:flow];
    self.ClassificationView.showsHorizontalScrollIndicator=NO;
    [self.ClassificationView registerNib:[UINib nibWithNibName:NSStringFromClass([newsListCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"listCell"];
    NSMutableArray * arr = [[NSMutableArray alloc] init];
    for (knowledgeCatListModel*model in _cat2NameArr) {
        [arr addObject:model.dictValue];
    }
    [self.ClassificationView  RowHeight:0.369942197*ScreenWidth*0.23066667 withRowWidth:ScreenWidth*0.23066667 withSpacing:12 withArr:arr  selectedCell:^(NSIndexPath * _Nonnull indexPath) {
        self.selectIndex = indexPath.row;
        [self getNewsDataParser];

    }];
    [self.view addSubview:self.ClassificationView];
 
}
#pragma mark  最新资讯
-(void)createhotNewsView{
    self.newsTableView =[[newsListView alloc] initWithFrame:CGRectMake(homeSpacing,0, self.homeScrollView.frame.size.width-2*homeSpacing, 0.9146666667*ScreenWidth*0.306122449*self.dataArr.count)];
    self.newsTableView.myDelegate = self;
    [self.homeScrollView addSubview:self.newsTableView];
    [self reloadScrollViewFrame:CGRectGetMaxY(self.newsTableView.frame)];
    
}
-(void)didSelectCell:(NSIndexPath *)indexPath{
    NewsTextMedel * model = self->_dataArr[indexPath.row];
    knowledgeDetailViewController * newsDetail = [[knowledgeDetailViewController alloc] init];
    newsDetail.myId = model.myId;
    newsDetail.titleStr = @"技术小文摘";
    [self.navigationController pushViewController:newsDetail animated:YES];
}
-(void)createLastLabel{
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.newsTableView.frame), ScreenWidth, 40)];
    _label.text = @"~没有更多啦~";
    _label.textColor = [UIColor colorWithRed:162/255.0 green:166/255.0 blue:172/255.0 alpha:1.0];
    _label.font = [UIFont fontWithName:@"PingFang SC" size:12];
    _label.textAlignment = NSTextAlignmentCenter;
    [self.homeScrollView addSubview:_label];
    [self reloadScrollViewFrame:CGRectGetMaxY(_label.frame)+16.5];
}
-(void)reloadScrollViewFrame:(CGFloat)height{
    self.homeScrollView.contentSize= CGSizeMake(ScreenWidth, height) ;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat currentOffsetY = scrollView.contentOffset.y;
    if (!self.loadMore&& currentOffsetY + scrollView.frame.size.height> scrollView.contentSize.height){
        if (self.dataArr.count<self.total) {
            if (self.loadMore == NO) {
                   self.loadMore = YES;
                   //设置滚动轮
                    knowledgeCatListModel*model = self.cat2NameArr[_selectIndex];
                    model.pageSize = model.pageSize+10;
                    [self  getNewsDataParser];
               }
    //        [self requestCommentList:20];
        }
    }
}

@end
