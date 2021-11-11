//
//  storeTypeOneViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/26.
//

#import "storeTypeOneViewController.h"
#import "goodsChildListCollectionView.h"
#import "childListCollectionViewCell.h"
#import "goodsChildrenListModel.h"
#import "goodsListParser.h"
#import "productListCollectionView.h"
#import "productListCollectionViewCell.h"
#import "Agro_goodDetailViewController.h"
@interface storeTypeOneViewController ()<goodsListParserDelegate>
@property(nonatomic,retain)goodsChildListCollectionView *childListCollectionView;
@property(nonatomic,retain)productListCollectionView *listCollectionView;
@property(nonatomic,retain)NSMutableArray *listArr;
@property(nonatomic,retain)goodsChildrenListModel *recordModel;
@property(nonatomic,assign)int32_t pageNum;
@property(nonatomic,assign)BOOL loadMore;
@property(nonatomic,retain)NSMutableArray *childControllers;
@end

@implementation storeTypeOneViewController
-(id)init{
    if (self==[super init]) {
        self.goodsChildrenListArr = [[NSMutableArray alloc] init];
        self.listArr = [[NSMutableArray alloc] init];
        self.recordModel = [[goodsChildrenListModel alloc] init];
        self.pageNum=1;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(requestData) name:@"reloadData" object:nil];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
        [self createChildListMethod];

    UIViewController *childController = _childControllers[self.myTag];

   
 
}

-(void)createChildListMethod{
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    if (self.childListCollectionView==nil) {
        self.childListCollectionView = [[goodsChildListCollectionView alloc] initWithFrame:CGRectMake(10, 20, ScreenWidth-20, 0.2075*ScreenHeight1) collectionViewLayout:flow];

    }
     self.childListCollectionView.showsHorizontalScrollIndicator=NO;
//    self.childListCollectionView.backgroundColor = SelectColor;
    self.childListCollectionView.ListArr = self.goodsChildrenListArr;
    [self.childListCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([childListCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"cell"];
    [self.childListCollectionView items:self.goodsChildrenListArr.count withRowHeight:0.2075*ScreenHeight1 withRowWidth:0.341*ScreenWidth withSpacing:10  withIdentify:@"cell" selectedCell:^(NSIndexPath * _Nonnull indexPath) {
        goodsChildrenListModel * model = self.goodsChildrenListArr[indexPath.row];
        self.recordModel = model;
        [self requestGoodsList:model];
    }];
    [self.view addSubview:self.childListCollectionView];
//    [self reloadScrollViewFrame:CGRectGetMaxY(self.childListCollectionView.frame)];
    self.recordModel = _goodsChildrenListArr[0];
    [self requestGoodsList: self.recordModel];

}
-(void)requestData{
    if (self.loadMore == NO) {
                self.loadMore = YES;
                self.pageNum = self.pageNum+1;
            [self requestGoodsList: self.recordModel];
            }
    
    
    [self requestGoodsList: self.recordModel];

}
-(void)requestGoodsList:(goodsChildrenListModel*)model{
    goodsListParser * parser = [[goodsListParser alloc] init];
    parser.myDelegate = self;
    [parser requestWitCatId:[model.myId integerValue] catIds:[[NSArray alloc]init] keyword:@"" orderType:@"" pageNum:1 pageSize:10 position:0 shopCat:0 shopId:0];
}
-(void)successGetGoodsList:(NSMutableArray *)arr{
    self.listArr  = arr;
    self.listCollectionView.ListArr = arr;
    [self createListCollectionView];
    self.loadMore = NO;

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
        Agro_goodDetailViewController * detailVC = [[Agro_goodDetailViewController alloc] init];
        detailVC.model = self->_listArr[indexPath.row];
        [self.navigationController pushViewController:detailVC animated:YES];
    }];
    [self.view addSubview:self.listCollectionView];
    NSLog(@"%f===%f",self.listCollectionView.contentSize.height,height);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadFrame" object:nil userInfo:@{@"height":[NSNumber numberWithFloat:CGRectGetMaxY(self.childListCollectionView.frame)+18+height]}];
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
