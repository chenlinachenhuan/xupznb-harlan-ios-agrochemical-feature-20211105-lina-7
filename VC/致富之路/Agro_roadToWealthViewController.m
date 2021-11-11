//
//  Agro_roadToWealthViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/16.
//

#import "Agro_roadToWealthViewController.h"
#import "homeBannerParser.h"
#import "CustomBannerView.h"
#import "richListParser.h"
#import "policyTableViewCell.h"
#import "NewsTextMedel.h"
#import "richDetailViewController.h"
@interface Agro_roadToWealthViewController ()<UIScrollViewDelegate,homeBannerParserDelegate,richListParserDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain)UIScrollView *homeScrollView;
@property(nonatomic,retain)NSMutableArray *bannerImgArr;
@property(nonatomic,retain)CustomBannerView * bannerView;
@property(nonatomic,assign)uint32_t pageSize;
@property(nonatomic,retain)UITableView * myTab;
@property(nonatomic,retain)NSMutableArray *richListArr;
@property(nonatomic,assign)BOOL loadMore;
@property(nonatomic,assign)NSInteger total;
@end

@implementation Agro_roadToWealthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BackGroundColor;
    self.navigationController.navigationBarHidden=YES;
    [self initMethod];
    [self createNaviView];
    [self createScrollView];
    [self requestHomeBanner];
    [self createBannerView];
    [self requestRichList];
}
-(void)initMethod{
    self.pageSize=10;
    self.richListArr = [[NSMutableArray alloc] init];
}
-(void)createNaviView{
    UIView * bgV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, TopHeight)];
    bgV.backgroundColor = BackGroundColor;
    [self.view addSubview:bgV];
    
    UILabel * title = [[UILabel alloc] initWithFrame:CGRectMake(0, statusBarHeight, ScreenWidth,navBarHeight)];
    title.text = @"致富之路";
//    title.backgroundColor = [UIColor redColor];
    title.font = [UIFont fontWithName:@"PingFang SC" size: 17];
    title.numberOfLines = 0;
    title.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:title];
    
   
 }
-(void)createScrollView{
    self.homeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, TopHeight+10, ScreenWidth, ScreenHeight-49)];
    self.homeScrollView.delegate = self;
    self.homeScrollView.contentSize = CGSizeMake(ScreenWidth, 1000);
    self.homeScrollView.showsVerticalScrollIndicator = NO;
    self.homeScrollView.userInteractionEnabled = YES;
//    [self.view addSubview:self.homeScrollView];
    [self.view addSubview:self.homeScrollView];
}
-(void)requestHomeBanner{
    homeBannerParser * parser = [[homeBannerParser  alloc] init];
    parser.myDelegate = self;
    [parser requestBannerPosition:394 num:5];
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
    self.bannerView = [[CustomBannerView alloc] initWithFrame:CGRectMake(homeSpacing, 0, self.homeScrollView.frame.size.width-2*homeSpacing, 0.329787*ScreenHeight) imageArr:self.bannerImgArr isTimer:YES];
    self.bannerView.delegate =self;
    [self.homeScrollView addSubview:self.bannerView];
    
   
}
 
-(void)requestRichList{
    [[ChrysanthemumIndexView sharedMasterUser] show];
    richListParser * parser =[[richListParser alloc] init];
    parser.myDelegate = self;
    [parser requestWithCat2Id:0 withCatId:0 withKeyWord:@"" withPageNum:1 withPageSize:self.pageSize withShowStatus:1];
}
-(void)successGetRichList:(NSMutableArray *)arr total:(NSInteger)total{
    [[ChrysanthemumIndexView sharedMasterUser] remove];
    [self.richListArr removeAllObjects];
    _loadMore=NO;
    self.total=total;
    self.richListArr = arr;
    [self creatRichListView];
}
-(void)creatRichListView{
    self.myTab = [[UITableView alloc] initWithFrame:CGRectMake(16, CGRectGetMaxY(self.bannerView.frame), ScreenWidth-32, 118*_richListArr.count) style:UITableViewStylePlain];
    self.myTab.delegate = self;
    self.myTab.dataSource = self;
    self.myTab.rowHeight=118;
    self.myTab.showsVerticalScrollIndicator=NO;
    self.myTab.scrollEnabled = NO;
    self.myTab.separatorStyle = 0;
    [self.homeScrollView addSubview:self.myTab];
    [self reloadScrollViewFrame:CGRectGetMaxY(self.myTab.frame)];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.richListArr.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"policyCell";
    policyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[UINib nibWithNibName:@"policyTableViewCell" bundle:nil]instantiateWithOwner:self options:nil]lastObject];
    }
    NewsTextMedel * model = self.richListArr[indexPath.row];
    [cell.imageV sd_setImageWithURL:[NSURL URLWithString:model.pic]];
    cell.titleL.text = model.title;
    cell.textL.text  = model.albumPics;
    cell.viewsL.text = [NSString stringWithFormat:@"%@ views",model.viewNum];
    cell.timeL.text = model.pubTime;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsTextMedel * model = self.richListArr[indexPath.row];
    richDetailViewController * richVC = [[richDetailViewController alloc] init];
    richVC.myId = model.myId;
    [self.navigationController pushViewController:richVC animated:YES];
}
-(void)reloadScrollViewFrame:(CGFloat)height{
    self.homeScrollView.contentSize= CGSizeMake(ScreenWidth, height) ;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat currentOffsetY = scrollView.contentOffset.y;
    if (!_loadMore&& currentOffsetY + scrollView.frame.size.height> scrollView.contentSize.height){
        if (self.richListArr.count<self.total) {
            if (self.loadMore == NO) {
                self.loadMore = YES;
                _pageSize = _pageSize+10;
                [self  requestRichList];
               }
    //        [self requestCommentList:20];
           
        }
        
    }
    

}
@end
