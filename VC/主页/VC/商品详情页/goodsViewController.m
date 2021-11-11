//
//  goodsViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/12.
//

#import "goodsViewController.h"
#import "Agro_goodDetailViewController.h"
#import "goodscustomBannerView.h"
#include "goodsImageScrollview.h"
#import "goodsCellOneFrameModel.h"
#import "goodsCellOneVIew.h"
#import "goodsCellTwoView.h"
#import "goodsCellTwoFrameModel.h"
#import "goodsDetailModel.h"
#import "goodsCellThreeFrameModel.h"
#import "goodsCommentTableView.h"
#import "goodsDetailCommentModel.h"
#import "goodsCellFOurFrameModel.h"
#import "goodsCellFourView.h"
#import "productDetailParser.h"
#import "addGoodsToCarParser.h"
#import "productSKUModel.h"
@interface goodsViewController ()<UIScrollViewDelegate,goodscustomBannerViewDelegate,productDetailParserDelegate,addGoodsToCarParserDelegate>
@property(nonatomic,retain)UIScrollView *homeScrollView;
@property(nonatomic,retain)goodscustomBannerView * bannerView;
@property(nonatomic,retain)NSMutableArray * bannerImgArr;
@property(nonatomic,retain)goodsCellOneVIew * cellOneView;
@property(nonatomic,retain)goodsCellTwoView * cellTwoView;
@property(nonatomic,retain)goodsCommentTableView * commentTableView;
@property(nonatomic,retain)goodsCellFourView * cellFourView;
@property(nonatomic,retain)productDetailModel * detailModel;

@end

@implementation goodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BackGroundColor;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addGoodsToCarMethod) name:@"addGoods" object:nil];
    [self requestProductDetailMethod];
    [self createScrollView];
    [self createBannerView];
 }
-(void)requestProductDetailMethod{
    productDetailParser * parser = [[productDetailParser alloc] init];
    parser.myDelegate = self;
    [parser requestProductDetail:[self.model.myId integerValue]];
}
-(void)successGetProductDetailInfo:(productDetailModel *)model{
    self.detailModel = model;
    [self createCellView];

}
 
-(void)addGoodsToCarMethod{
    addGoodsToCarParser * parser = [[addGoodsToCarParser alloc] init];
    parser.myDelegate = self;
   productSKUModel*model = self.detailModel.typeArr[0];
    [parser requestAddCar:[Agro_appDelegate.loginModel.myId integerValue] productId:[self.model.myId integerValue] productSkuId:[model.myId intValue] quantity:1];
}
-(void)successAddToCar{
    FBUtilShowTipView(self.view,@"加入购物车成功");
}
-(void)createScrollView{
   
    self.homeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    self.homeScrollView.delegate = self;
    self.homeScrollView.contentSize = CGSizeMake(ScreenWidth, 1000);
    self.homeScrollView.showsVerticalScrollIndicator = NO;
    self.homeScrollView.userInteractionEnabled = YES;
//    [self.view addSubview:self.homeScrollView];
    [self.view addSubview:self.homeScrollView];
}
#pragma mark  banner轮播
-(void)createBannerView{
    self.bannerImgArr = [[NSMutableArray alloc] init];
    for (int i=0; i<3; i++) {
        [self.bannerImgArr addObject:[UIImage imageNamed:@"u=2621658848,3952322712&fm=193&f=GIF.jpeg"] ];
    }
    self.bannerView = [[goodscustomBannerView alloc] initWithFrame:CGRectMake(0, 6, ScreenWidth, 0.418527*ScreenH) imageArr:self.detailModel.albumPics];
    self.bannerView.delegate =self;
    [self.homeScrollView addSubview:self.bannerView];
    
   
}
-(void)createCellView{
    goodsCellOneFrameModel * oneFrameModel = [[goodsCellOneFrameModel alloc] init];
    oneFrameModel.textModel = self.detailModel;
    [oneFrameModel setGoodsFrams:oneFrameModel.textModel];
    self.cellOneView = [[goodsCellOneVIew alloc] init];
    self.cellOneView.frame = CGRectMake(10, CGRectGetMaxY(self.bannerView.frame)+10, ScreenWidth-20, oneFrameModel.cellOneHeight);
    self.cellOneView.backgroundColor = [UIColor whiteColor];
    [self.homeScrollView addSubview:self.cellOneView];
    [self.cellOneView createCellOneView:oneFrameModel];
    
    goodsCellTwoFrameModel * twoFrameModel = [[goodsCellTwoFrameModel alloc] init];
    twoFrameModel.textModel = self.detailModel;
    [twoFrameModel setGoodsTwoCellFrams:twoFrameModel.textModel];
    self.cellTwoView = [[goodsCellTwoView alloc] init];
    self.cellTwoView.frame = CGRectMake(10, CGRectGetMaxY(self.cellOneView.frame)+10, ScreenWidth-20, twoFrameModel.cellTwoHeight);
    self.cellTwoView.backgroundColor = [UIColor whiteColor];
    [self.homeScrollView addSubview:self.cellTwoView];
    [self.cellTwoView createCellTwoView:twoFrameModel];
    
//    goodsCellThreeFrameModel * threeModel = [[goodsCellThreeFrameModel alloc] init];
//    NSMutableArray * commentArr = [[NSMutableArray alloc] init];
//    for (goodsDetailCommentModel * textModel in twoFrameModel.textModel.goodsCommentArr) {
//        threeModel.textModel = textModel;
//        [threeModel setCellThreeFrames:textModel];
//        [commentArr addObject:threeModel];
//    }
//     self.commentTableView = [[goodsCommentTableView alloc] initWithFrame:CGRectMake(10 , CGRectGetMaxY(self.cellTwoView.frame)+12, ScreenWidth-20, threeModel.cellHeight*2+51) style:UITableViewStylePlain dataArr:commentArr showCount:2];
//    [self.homeScrollView addSubview:self.commentTableView];
    
//    goodsCellFOurFrameModel * fourModel = [[goodsCellFOurFrameModel alloc] init];
//    fourModel.textModel = [[goodsDetailModel alloc] initWithData:[[NSDictionary alloc]init]];
//    [fourModel setCellFOurFrames:fourModel.textModel];
//    self.cellFourView = [[goodsCellFourView alloc] init];
//
//    [self.cellFourView createCellFourView:fourModel];
//    self.cellFourView.frame = CGRectMake(10, CGRectGetMaxY(self.commentTableView.frame)+12, ScreenWidth-20, fourModel.cellHeight);
//    [self.homeScrollView addSubview:self.cellFourView];
//    
//    [self reloadScrollViewFrame:CGRectGetMaxY(self.cellFourView.frame)];
}
-(void)reloadScrollViewFrame:(CGFloat)height{
    self.homeScrollView.contentSize= CGSizeMake(ScreenWidth, height+45+11.5) ;
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
