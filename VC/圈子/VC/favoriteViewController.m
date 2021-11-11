//
//  favoriteViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/22.
//

#import "favoriteViewController.h"
#import "XXPageTabView.h"
#import "rankingListParser.h"
#import "newsCollectionView.h"
#import "rankingListModel.h"
#import "likeListParser.h"
#import "likeListModel.h"
#import "likeListTableViewCell.h"
@interface favoriteViewController ()<rankingListParserDelegate,likeListParserDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain)UITableView * myTab;
@property(nonatomic,retain)NSMutableArray * typeArr;
@property(nonatomic,retain)NSMutableArray * typeNameArr;

@property(nonatomic,retain)newsCollectionView * typeCollectionView;
@property(nonatomic,retain)UIView * bgView;
@property(nonatomic,assign)NSInteger rankingId;
@property(nonatomic,retain)NSMutableArray * listArr;
@property(nonatomic,retain)UIButton * selectButton;

@end

@implementation favoriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BackGroundColor;
    [self initMethod];
    [self requestRankingList];
    [self createTypeView];
    [self createTableView];
}

-(void)initMethod{
    self.typeArr = [[NSMutableArray alloc] init];
    self.listArr = [[NSMutableArray alloc] init];
    self.typeNameArr = [[NSMutableArray alloc] init];
    _bgView = [[UIView alloc] initWithFrame:CGRectMake(16,12 , ScreenWidth-32, ScreenHeight-183)];
    _bgView.backgroundColor = [UIColor whiteColor];
    _bgView.clipsToBounds = YES;
    _bgView.layer.cornerRadius = 10;
    [self.view addSubview:_bgView];
    
    UIButton * allCollecB = [UIButton buttonWithType:UIButtonTypeCustom];
    allCollecB.frame = CGRectMake(ScreenWidth/2-112.5, CGRectGetMaxY(_bgView.frame)+20, 225, 40);
    [allCollecB setTitle:@"一键全部关注" forState:UIControlStateNormal];
    [allCollecB setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [allCollecB setBackgroundColor:SelectColor];
    allCollecB.clipsToBounds = YES;
    allCollecB.layer.cornerRadius = 20;
    allCollecB.titleLabel.font = FontSize(15);
    [self.view addSubview:allCollecB];
}
-(void)requestRankingList{
    rankingListParser * parser = [[rankingListParser alloc] init];
    parser.myDelegate = self;
    [parser requestRankingList];
}
-(void)successGetRankingList:(NSMutableArray *)arr{
    self.typeArr = arr;
    for (rankingListModel*model in arr) {
        [self.typeNameArr addObject:model.title];
    }
    self.typeCollectionView.cat2NameArr = self.typeNameArr;
    self.typeCollectionView.borderColor = CommonColor;
    rankingListModel * model = arr[0];
    self.rankingId = [model.myId integerValue];
    [self getLikeList];
}
-(void)failedMethod:(NSString *)message{
    FBUtilShowTipView(self.view,message);
}
-(void)createTypeView{
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.typeCollectionView = [[newsCollectionView alloc] initWithFrame:CGRectMake(0, 14, ScreenWidth, 0.369942197*ScreenWidth*0.23066667) collectionViewLayout:flow];
    self.typeCollectionView.showsHorizontalScrollIndicator=NO;
    [self.typeCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([newsListCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"listCell"];
    [self.typeCollectionView  RowHeight:0.369942197*ScreenWidth*0.23066667 withRowWidth:ScreenWidth*0.23066667 withSpacing:12 withArr:self.typeArr  selectedCell:^(NSIndexPath * _Nonnull indexPath) {
        rankingListModel * model = self.typeArr[indexPath.row];
        self.rankingId = [model.myId integerValue];
        [self getLikeList];
    }];
    [_bgView addSubview:self.typeCollectionView];
 
}
-(void)getLikeList{
    likeListParser * parser = [[likeListParser alloc] init];
    parser.myDelegate = self;
    [parser requestLikeList:self.rankingId];
}
-(void)successGetLikeList:(NSMutableArray *)arr{
    self.listArr = arr;
    [self.myTab reloadData];
}

-(void)createTableView{
    self.myTab = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.typeCollectionView.frame)+10, self.bgView.frame.size.width, self.bgView.frame.size.height-10-CGRectGetMaxY(self.typeCollectionView.frame)) style:UITableViewStylePlain];
    self.myTab.delegate = self;
    self.myTab.dataSource = self;
    self.myTab.rowHeight=82;
    [self.bgView addSubview:self.myTab];
    self.myTab.showsVerticalScrollIndicator = NO;
    self.myTab.separatorStyle = 0;
    self.myTab.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _listArr.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    likeListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell = [[[UINib nibWithNibName:@"likeListTableViewCell" bundle:nil]instantiateWithOwner:self options:nil]lastObject];
    }
    likeListModel * model = self.listArr[indexPath.row];
    cell.selectionStyle =0;
    [cell.iconImageV sd_setImageWithURL:[NSURL URLWithString:model.avatar]];
    if ([model.sortNum intValue]==1) {
        cell.numberImageV.hidden = NO;
        cell.numberImageV.image = [UIImage imageNamed:@"第一"];
        cell.numberL.hidden=YES;

    }else if ([model.sortNum intValue]==2){
        cell.numberImageV.hidden = NO;
        cell.numberImageV.image = [UIImage imageNamed:@"第二"];
        cell.numberL.hidden=YES;

    }else if ([model.sortNum intValue]==3){
        cell.numberImageV.hidden = NO;
        cell.numberImageV.image = [UIImage imageNamed:@"第三"];
        cell.numberL.hidden=YES;

    }else{
        cell.numberL.hidden = NO;
        cell.numberL.text = [NSString stringWithFormat:@"%@",model.sortNum];
        cell.numberImageV.hidden = YES;
    }
    cell.nameL.text = model.nickname;
    if ([model.sortTrend intValue]==0) {
        cell.levelImageV.image = [UIImage imageNamed:@"无变化"];
    }else if ([model.sortTrend intValue]==1) {
        cell.levelImageV.image = [UIImage imageNamed:@"上升"];
    }else if ([model.sortTrend intValue]==-1) {
        cell.levelImageV.image = [UIImage imageNamed:@"下降"];
    }
    cell.collectionB.clipsToBounds=YES;
    cell.collectionB.layer.borderColor = UIColorFromRGB(0x999999).CGColor;
    cell.collectionB.layer.cornerRadius = 5;
    cell.collectionB.tag = indexPath.row;
    [cell.collectionB addTarget:self action:@selector(collectionButtonM:) forControlEvents:UIControlEventTouchUpInside];
    if ([model.followStatus integerValue]==0) {
        cell.collectionB.layer.borderWidth = 0.5;
        [cell.collectionB setTitle:@"关注" forState:UIControlStateNormal];
        cell.collectionB.backgroundColor = [UIColor whiteColor];
        [cell.collectionB setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }else if ([model.followStatus integerValue]==1) {
        cell.collectionB.layer.borderWidth = 0;
        [cell.collectionB setTitle:@"已关注" forState:UIControlStateNormal];
        cell.collectionB.backgroundColor = UIColorFromRGB(0xFEC146);
        [cell.collectionB setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return cell;
}
-(void)collectionButtonM:(UIButton*)button{
    if ([button.titleLabel.text isEqualToString:@"关注"]) {
        button.layer.borderWidth = 0;
        [button setTitle:@"已关注" forState:UIControlStateNormal];
        button.backgroundColor = UIColorFromRGB(0xFEC146);
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }else{
        button.layer.borderWidth = 0.5;
        [button setTitle:@"关注" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor whiteColor];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
}
@end
