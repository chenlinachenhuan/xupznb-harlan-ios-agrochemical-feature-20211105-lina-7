//
//  classHomeViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/27.
//

#import "classHomeViewController.h"
#import "CustomVerticallyCollectionView.h"
#import "VerticalCollectionViewCell.h"
#import "CustomHorizontalCollectionView.h"
#import "waterCollectionViewCell.h"
#import "ClassificationOneTableViewCell.h"
#import "CustomNewsTableView.h"
#import "classificationAllViewController.h"
#import "classDetailViewController.h"
#import "classListParser.h"
#import "classListModel.h"
@interface classHomeViewController ()<UIGestureRecognizerDelegate,UIScrollViewDelegate,classListParserDelegate>
@property(nonatomic,retain)UIScrollView *homeScrollView;
@property(nonatomic,retain)CustomVerticallyCollectionView *lasterClassView;
@property(nonatomic,retain)CustomHorizontalCollectionView *recommendClassView;
@property(nonatomic,retain)CustomVerticallyCollectionView *studentView;
@property(nonatomic,retain)CustomNewsTableView *classificationOneView;
@property(nonatomic,retain)CustomVerticallyCollectionView *classificationTwoView;
@property(nonatomic,retain)NSMutableArray *classListArr;

@end

@implementation classHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     
    [self initMethod];
    [self createNaviView];
    [self createScrollView];
    [self  requestClassList];
   
}
-(void)initMethod{
    [self.navigationController.navigationBar setBarTintColor: [UIColor whiteColor]];
    self.view.backgroundColor = BackGroundColor;
    self.classListArr = [[NSMutableArray alloc] init];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = NO;
    
    
}
-(void)createNaviView{
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    bigButton *backButton = [bigButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 44, 44);
    [backButton addTarget:self action:@selector(backButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [backButton setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
     UIBarButtonItem * leftB = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = leftB;
   
    UILabel * title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100,navBarHeight)];
    title.text = @"化浪课堂";
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
-(void)createScrollView{
   
    self.homeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, TopHeight, ScreenWidth, ScreenHeight)];
    self.homeScrollView.delegate = self;
    self.homeScrollView.contentSize = CGSizeMake(ScreenWidth, 1000);
    self.homeScrollView.showsVerticalScrollIndicator = NO;
    self.homeScrollView.userInteractionEnabled = YES;
//    [self.view addSubview:self.homeScrollView];
    [self.view addSubview:self.homeScrollView];
}
-(CGFloat)createTitleView:(NSString*)title litleTitle:(NSString*)litleTitle frame:(CGRect)frame withTag:(CGFloat)tag{
     
    UILabel * titleL = [[UILabel alloc] initWithFrame:CGRectMake(15.5, frame.origin.y+frame.size.height+20, ScreenWidth-2*homeSpacing, 0)];
    titleL.text = title;
    titleL.numberOfLines=0;
    titleL.textColor = [UIColor blackColor];
//    titleL.backgroundColor = [UIColor orangeColor];
    titleL.font = [UIFont fontWithName:@"PingFang SC" size: 15];
    CGSize size = CGSizeMake(ScreenWidth-2*homeSpacing, MAXFLOAT);//设置高度宽度的最大限度
    CGRect rect = [title boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :FontSize(15)} context:nil];
    titleL.frame = CGRectMake(15.5, CGRectGetMaxY(frame)+24, ScreenWidth-32, rect.size.height);
    [self.homeScrollView addSubview:titleL];
    [self reloadScrollViewFrame:CGRectGetHeight(titleL.frame)];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(ScreenWidth-homeSpacing-ScreenHeight*0.0248227*0.5714286, titleL.center.y-ScreenHeight*0.0248227*0.5, ScreenHeight*0.0248227*0.5714286, ScreenHeight*0.0248227);
    [button setImage:[UIImage imageNamed:@"大模块进入"] forState:UIControlStateNormal];
    button.tag = tag;
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
-(void)enterButtonMethod:(UIButton*)button{
    if (button.tag==1000) {
         
    }else if (button.tag==2000){
        
    }else if (button.tag==3000){
        
    }else if (button.tag==4000){
        
    }else if (button.tag==5000){
        
    }
    classificationAllViewController * classificationVC  = [[classificationAllViewController alloc] init];
    [self.navigationController pushViewController:classificationVC animated:YES];
}
-(void)requestClassList{
    classListParser *parser = [[classListParser alloc] init];
    parser.myDelegate = self;
    [parser requestClaaList:0 catId:0 crop2Id:0 cropId:0 keyword:@"" orderBy:@"" pageNum:1 pageSize:10 proficientId:0 publishStatus:1];
}
-(void)successGetClassList:(NSMutableArray *)arr total:(NSInteger)total{
    self.classListArr = arr;
    [self createLasterClassView];
}
#pragma mark 最新上架
-(void)createLasterClassView{
    CGFloat y = [self createTitleView:@"最新上架" litleTitle:@"" frame:CGRectMake(0, 0, ScreenWidth, 0) withTag:1000];
    CGFloat height =0;
    if (_classListArr.count<=2) {
        height =(ScreenWidth-32-11)/2*1.2298157;
    }else if (_classListArr.count<=4){
        height =(ScreenWidth-32-11)/2*1.2298157*2+12;

    }else if (_classListArr.count<=6){
        height =(ScreenWidth-32-11)/2*1.2298157*3+12*2;
    }
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    self.lasterClassView = [[CustomVerticallyCollectionView alloc] initWithFrame:CGRectMake(homeSpacing, y+17.5, ScreenWidth-2*homeSpacing, height) collectionViewLayout:flow];
    self.lasterClassView.scrollEnabled = NO;
    self.lasterClassView.showsVerticalScrollIndicator = NO;
    [self.lasterClassView registerNib:[UINib nibWithNibName:NSStringFromClass([VerticalCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"popularClass"];
    [self.lasterClassView items:MIN(self.classListArr.count, 6) withRowHeight:(ScreenWidth-32-11)/2*1.22891566 withRowWidth:(ScreenWidth-32-11)/2 withSpacing:11 isShowFooter:NO cellIdentify:@"popularClass" selectedCell:^(NSIndexPath * _Nonnull indexPath) {
        classDetailViewController * class = [[classDetailViewController alloc] init];
        [self.navigationController pushViewController:class animated:YES];
    } moreButtonBlock:^(UIButton * _Nonnull button) {
        
    }];
    [self.homeScrollView addSubview:self.lasterClassView];
    [self reloadScrollViewFrame:CGRectGetMaxY(self.lasterClassView.frame)];
    self.lasterClassView.listArr = self.classListArr;
    [self createRecommendClassView];
    

}
#pragma mark 推荐课程
-(void)createRecommendClassView{
    CGFloat y = [self createTitleView:@"编辑推荐" litleTitle:@"" frame:self.lasterClassView.frame withTag:2000];
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.recommendClassView = [[CustomHorizontalCollectionView alloc] initWithFrame:CGRectMake(homeSpacing, y+13.5, ScreenWidth-2*homeSpacing,  0.650666667*ScreenWidth*0.444672) collectionViewLayout:flow];
    self.recommendClassView.showsHorizontalScrollIndicator=NO;
    [self.recommendClassView registerNib:[UINib nibWithNibName:NSStringFromClass([waterCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"ItemID"];
    [self.recommendClassView items:3 withRowHeight:0.650666667*ScreenWidth*0.444672 withRowWidth:0.650666667*ScreenWidth withSpacing:12 withHeaderTitle:@"编辑推荐" cellIdentify:@"ItemID" selectedCell:^(NSIndexPath * _Nonnull indexPath) {
        classDetailViewController * class = [[classDetailViewController alloc] init];
        [self.navigationController pushViewController:class animated:YES];
    }];
    [self.homeScrollView addSubview:self.recommendClassView];
    [self reloadScrollViewFrame:CGRectGetMaxY(self.recommendClassView.frame)];
    [self createStudentView];
     
}
#pragma mark 新手上路
-(void)createStudentView{
    CGFloat y = [self createTitleView:@"新手上路" litleTitle:@"" frame:self.recommendClassView.frame withTag:3000];
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    self.studentView = [[CustomVerticallyCollectionView alloc] initWithFrame:CGRectMake(homeSpacing, y+17.5, ScreenWidth-2*homeSpacing, (ScreenWidth-32-11)/2*1.22891566*3+11*2) collectionViewLayout:flow];
    self.studentView.scrollEnabled = NO;
    self.studentView.showsVerticalScrollIndicator = NO;
    [self.studentView registerNib:[UINib nibWithNibName:NSStringFromClass([VerticalCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"popularClass"];
    [self.studentView items:6 withRowHeight:(ScreenWidth-32-11)/2*1.22891566 withRowWidth:(ScreenWidth-32-11)/2 withSpacing:11 isShowFooter:NO cellIdentify:@"popularClass" selectedCell:^(NSIndexPath * _Nonnull indexPath) {
        classDetailViewController * class = [[classDetailViewController alloc] init];
        [self.navigationController pushViewController:class animated:YES];
    } moreButtonBlock:^(UIButton * _Nonnull button) {
        
    }];
    [self.homeScrollView addSubview:self.studentView];
    [self reloadScrollViewFrame:CGRectGetMaxY(self.studentView.frame)];
    [self createClassificationOneView];
 }
#pragma mark 分类1 缤纷水果
-(void)createClassificationOneView{
    float y= [self createTitleView:@"缤纷水果" litleTitle:@""  frame:self.studentView.frame withTag:4000];
    __weak CustomNewsTableView * tb = self.classificationOneView;
    self.classificationOneView = [[CustomNewsTableView alloc]initWithFrame:CGRectMake(homeSpacing, y+13.5, self.homeScrollView.frame.size.width-2*homeSpacing, 0.9146666667*ScreenWidth*0.306122449*4) headerHeight:0 style:UITableViewStylePlain rowCount:4 cellHeight:0.9146666667*ScreenWidth*0.306122449 cell:^UITableViewCell *(NSIndexPath *indexPath) {
            // 创建你自定义的cell
            static NSString *identifier = @"ClassificationOneCell";
            ClassificationOneTableViewCell *cell = [tb dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[[UINib nibWithNibName:@"ClassificationOneTableViewCell" bundle:nil]instantiateWithOwner:self options:nil]firstObject];
            }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

            return cell;
        }selectedCell:^(NSIndexPath *indexPath) {
            classDetailViewController * class = [[classDetailViewController alloc] init];
            [self.navigationController pushViewController:class animated:YES];
        } moreButtonClick:^(UIButton * _Nonnull button) {
           
        }];
 
    self.classificationOneView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.classificationOneView.scrollEnabled = NO;
    [self.homeScrollView addSubview:self.classificationOneView];
    [self reloadScrollViewFrame:CGRectGetMaxY(self.classificationOneView.frame)];
    [self createClassificationTwoView];

}
#pragma mark 分类2 田园美食
-(void)createClassificationTwoView{
    CGFloat y = [self createTitleView:@"田园美食" litleTitle:@"" frame:self.classificationOneView.frame withTag:5000];
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    self.classificationTwoView = [[CustomVerticallyCollectionView alloc] initWithFrame:CGRectMake(homeSpacing, y+17.5, ScreenWidth-2*homeSpacing, (ScreenWidth-32-11)/2*1.22891566*3+11*2) collectionViewLayout:flow];
    self.classificationTwoView.scrollEnabled = NO;
    self.classificationTwoView.showsVerticalScrollIndicator = NO;
    [self.classificationTwoView registerNib:[UINib nibWithNibName:NSStringFromClass([VerticalCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"popularClass"];
    [self.classificationTwoView items:6 withRowHeight:(ScreenWidth-32-11)/2*1.22891566 withRowWidth:(ScreenWidth-32-11)/2 withSpacing:11 isShowFooter:NO cellIdentify:@"popularClass" selectedCell:^(NSIndexPath * _Nonnull indexPath) {
        classDetailViewController * class = [[classDetailViewController alloc] init];
        [self.navigationController pushViewController:class animated:YES];
    } moreButtonBlock:^(UIButton * _Nonnull button) {
        
    }];
    [self.homeScrollView addSubview:self.classificationTwoView];
    [self reloadScrollViewFrame:CGRectGetMaxY(self.classificationTwoView.frame)];
}
#pragma mark 刷新列表
-(void)reloadScrollViewFrame:(CGFloat)height{
    self.homeScrollView.contentSize= CGSizeMake(ScreenWidth, height+30) ;
}
@end
