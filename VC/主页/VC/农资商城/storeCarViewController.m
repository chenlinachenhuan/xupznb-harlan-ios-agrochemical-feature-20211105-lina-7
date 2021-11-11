//
//  storeCarViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/26.
//

#import "storeCarViewController.h"
#import "carTableView.h"
#import "carListParser.h"
#import "cartListProductModel.h"
#import "cartProductModel.h"
#import "carCellTableViewCell.h"
#import "DWQTableHeaderView.h"
#import "deleteGoodsParser.h"
#import "OrderViewController.h"
#import "clearAllGoodsParser.h"
@interface storeCarViewController ()<UIGestureRecognizerDelegate,carListParserDelegate,UITableViewDelegate,UITableViewDataSource,deleteGoodsParserDelegate,clearAllGoodsParserDelegate>
@property(nonatomic,retain)UITableView * car;
@property(nonatomic,retain)NSMutableArray * dataArray;
@property(nonatomic,retain)UILabel*moneyL;
@property (strong,nonatomic)NSMutableArray *selectedArray;
@property (strong,nonatomic)UIButton *allSellectedButton;
@property (strong,nonatomic)UILabel * mLabel;
@property (strong,nonatomic)UIButton * countButton;
@end

@implementation storeCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BackGroundColor;
    self.navigationController.navigationBarHidden = YES;
    self.dataArray = [[NSMutableArray alloc] init];
    [self createNaviView];
    [self createCellView];
    [self createBottomView];
 }
-(void)viewWillAppear:(BOOL)animated{
    [self requestCarList];
}
-(void)requestCarList{
    carListParser * parser = [[carListParser alloc] init];
    parser.myDelegate = self;
    [parser requestList:1 pageSize:10];
}
-(void)successGetCarList:(NSMutableArray *)arr{
    self.dataArray = arr;
    [self.car reloadData];
 }
- (NSMutableArray *)selectedArray {
    if (_selectedArray == nil) {
        _selectedArray = [NSMutableArray arrayWithCapacity:0];
    }
    
    return _selectedArray;
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
   
    UILabel * title  = [[UILabel alloc] initWithFrame:CGRectMake(0, statusBarHeight, ScreenWidth, 44)];
    title.text = @"购物车";
    title.textColor = [UIColor blackColor];
    title.font = FontSize(17);
    title.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:title];

    UIButton *carButton = [UIButton buttonWithType:UIButtonTypeCustom];
    carButton.frame = CGRectMake(ScreenWidth-12-44, statusBarHeight, 44, 44);
//    carButton.backgroundColor = SelectColor;
    [carButton addTarget:self action:@selector(carButtonMethod:) forControlEvents:UIControlEventTouchUpInside];
    carButton.titleLabel.font = FontSize(15);
    [carButton setTitle:@"编辑" forState:UIControlStateNormal];
    [carButton setTitleColor:SelectColor forState:UIControlStateNormal];
    [self.view addSubview:carButton];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}
-(void)backButtonMethod{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)createCellView{
    self.car = [[UITableView alloc] initWithFrame:CGRectMake(10, TopHeight+20, ScreenWidth-20, ScreenHeight-49) style:UITableViewStyleGrouped];
    self.car.delegate = self;
    self.car.dataSource = self;
    self.car.backgroundColor = [UIColor clearColor];
    self.car.showsVerticalScrollIndicator = NO;
    self.car.rowHeight = 120;
    self.car.separatorStyle = 0;
    [self.view addSubview:self.car];
    [self.car registerClass:[DWQTableHeaderView class] forHeaderFooterViewReuseIdentifier:@"DWQHeaderView"];

}
-(void)carButtonMethod:(UIButton*)button{
    button.selected=!button.selected;
    if (button.selected==YES) {
        [button setTitle:@"完成" forState:UIControlStateNormal];
        self.mLabel.hidden=YES;
        self.moneyL.hidden=YES;
        [self.countButton setTitle:@"删除" forState:UIControlStateNormal];
        
    }else{
        [button setTitle:@"编辑" forState:UIControlStateNormal];
        self.mLabel.hidden=NO;
        self.moneyL.hidden=NO;
        [self.countButton setTitle:@"去结算" forState:UIControlStateNormal];
    }
 
}
#pragma mark --- UITableViewDataSource & UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    cartListProductModel *model = [self.dataArray objectAtIndex:section];
    return model.productArr.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    carCellTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell = [[[UINib nibWithNibName:@"carCellTableViewCell" bundle:nil]instantiateWithOwner:self options:nil]lastObject];
    }
    cartListProductModel *shopModel = [self.dataArray objectAtIndex:indexPath.section];
    cartProductModel * model = shopModel.productArr[indexPath.row];
    cell.backgroundColor =SelectColor;
    cell.selectionStyle =0;
    cell.selectButton.indexPath = indexPath;
    cell.cellSelectedBlock = ^(BOOL select) {
        model.select = select;
        if (select) {
            [self.selectedArray addObject:model];
        } else{
            [self.selectedArray removeObject:model];
        }
        [self verityAllSelectState];
        [self verityGroupSelectState:indexPath.section];
        [self countPrice];
    };
    [cell reloadDataWithModel:model];
    return cell;
}
- (void)verityGroupSelectState:(NSInteger)section {
    
    // 判断某个区的商品是否全选
    cartListProductModel *tempShop = self.dataArray[section];
    // 是否全选标示符
    BOOL isShopAllSelect = YES;
    for (cartProductModel *model in tempShop.productArr) {
        // 当有一个为NO的是时候,将标示符置为NO,并跳出循环
        if (model.select == NO) {
            isShopAllSelect = NO;
            break;
        }
    }
    DWQTableHeaderView *header = (DWQTableHeaderView *)[self.car headerViewForSection:section];
    header.select = isShopAllSelect;
    tempShop.select = isShopAllSelect;
}

//-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return @"删除";
//}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    cartListProductModel *model = [self.dataArray objectAtIndex:section];
    DWQTableHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"DWQHeaderView"];
    view.titleLabel.frame = CGRectMake(view.titleLabel.frame.origin.x, view.titleLabel.frame.origin.y,[commonMethod widthAuto:model.shopName fontSize:18 contentheight: 15], 15);
    view.shopEnterB.frame = CGRectMake(CGRectGetMaxX(view.titleLabel.frame)+5.5, view.shopEnterB.frame.origin.y, 5, 8);
    view.title = model.shopName;
    view.select = model.select;

    view.dwqClickBlock = ^(BOOL select) {
        model.select = select;
        if (select) {
            for (cartProductModel *good in model.productArr) {
                good.select = YES;
                if (![self.selectedArray containsObject:good]) {
                    
                    [self.selectedArray addObject:good];
                }
            }
        } else {
            for (cartProductModel *good in model.productArr) {
                good.select = NO;
                if ([self.selectedArray containsObject:good]) {
                    
                    [self.selectedArray removeObject:good];
                }
            }
        }
        [self verityAllSelectState];
        [tableView reloadData];
        [self countPrice];
    };
    return view;
}
- (void)verityAllSelectState {
    
    NSInteger count = 0;
    for (cartListProductModel *shop in self.dataArray) {
        count += shop.productArr.count;
    }
    
    if (self.selectedArray.count == count) {
        _allSellectedButton.selected = YES;
    } else {
        _allSellectedButton.selected = NO;
    }
}

-(void)enterShopMethod{
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 48;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//
//    return 1;
//}
//-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//     
//}
-(void)createBottomView{
    UIView * bgV = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight1-49, ScreenWidth, 49)];
    bgV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgV];

    _allSellectedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _allSellectedButton.frame = CGRectMake(10, 16.5, 16, 16);
//    [button setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [_allSellectedButton setImage:[UIImage imageNamed:@"photo_original_def"] forState:UIControlStateNormal];
    [_allSellectedButton setImage:[UIImage imageNamed:@"选中"] forState:UIControlStateSelected];

    [_allSellectedButton addTarget:self action:@selector(selectAllBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgV addSubview:_allSellectedButton];
    
    UILabel*titleL = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_allSellectedButton.frame)+6, _allSellectedButton.center.y-6, [commonMethod widthAuto:@"全选" fontSize:12 contentheight:12], 12)];
    titleL.text = @"全选";
    titleL.font = FontSize(12);
    [bgV addSubview:titleL];
    
    self.mLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(titleL.frame)+15.5, _allSellectedButton.center.y-7, [commonMethod widthAuto:[NSString stringWithFormat:@"合计 ：¥"] fontSize:15 contentheight:14], 14)];
    self.mLabel.text =[NSString stringWithFormat:@"合计 ：¥"];
    self.mLabel.font = FontSize(15);
    [bgV addSubview: self.mLabel];

   self.moneyL = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.mLabel.frame)+2.5, _allSellectedButton.center.y-7, [commonMethod widthAuto:[NSString stringWithFormat:@"100000000000000"] fontSize:15 contentheight:14], 14)];
    self.moneyL.text =@"0";
    self.moneyL.font = FontSize(15);
    [bgV addSubview:self.moneyL];
    
    self.countButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.countButton.frame = CGRectMake(ScreenWidth-120, 4.5, 110, 40);
    self.countButton.backgroundColor = SelectColor;
    [self.countButton setTitle:@"去结算" forState:UIControlStateNormal];
    self.countButton.clipsToBounds = YES;
    self.countButton.layer.cornerRadius = 20;
    [self.countButton addTarget:self action:@selector(countButtonMethod:) forControlEvents:UIControlEventTouchUpInside];
    [bgV addSubview:self.countButton];
}
- (void)selectAllBtnClick:(UIButton*)button {
    button.selected = !button.selected;
    //点击全选时,把之前已选择的全部删除
    for (cartProductModel *model in self.selectedArray) {
        model.select = NO;
    }
    [self.selectedArray removeAllObjects];
    if (button.selected) {
        for (cartListProductModel *shop in self.dataArray) {
            shop.select = YES;
            for (cartProductModel *model in shop.productArr) {
                model.select = YES;
                [self.selectedArray addObject:model];
            }
        }
    } else {
        for (cartListProductModel *shop in self.dataArray) {
            shop.select = NO;
        }
    }
    [self.car reloadData];
    [self countPrice];
}
-(void)countPrice {
    double totlePrice = 0.0;
    for (cartProductModel *model in self.selectedArray) {
        double price = [model.mallPrice doubleValue];
        totlePrice += price * [model.quantity doubleValue];
    }
    NSString *string = [NSString stringWithFormat:@"%.2f",totlePrice];
    self.moneyL.text = string;
}
-(void)countButtonMethod:(UIButton*)button{
    if ([button.titleLabel.text isEqualToString:@"删除"]) {
        NSInteger count = 0;
        for (cartListProductModel *shop in self.dataArray) {
            count += shop.productArr.count;
        }
        if (count==self.selectedArray.count) {
            [self clearAllGoods];
        }else{
            [self deleteProduct];
        }
        
    }else{
        if ([self.moneyL.text intValue]==0) {
            FBUtilShowTipView(self.view,@"您还没有选择宝贝哦");
            return;
        }
        OrderViewController * orderVC = [[OrderViewController alloc] init];
        orderVC.selectArr = self.selectedArray;
        [self.navigationController pushViewController:orderVC animated:YES];
    }
    
}
-(void)clearAllGoods{
    clearAllGoodsParser * parser = [[clearAllGoodsParser alloc] init];
    parser.myDelegate = self;
    [parser requestClear];
}
-(void)successClearCar{
    [self.selectedArray removeAllObjects];
    self.moneyL.text = @"0";
    [self requestCarList];
}
-(void)deleteProduct{
    NSMutableArray * arr = [[NSMutableArray alloc] init];
    for (cartProductModel*model in _selectedArray) {
        [arr addObject:model.myId];
    }
    deleteGoodsParser * parser = [[deleteGoodsParser alloc] init];
    parser.myDelegate = self;
    [parser requestDelete:arr];
}
-(void)successDeleteCarGoods{
    [self.selectedArray removeAllObjects];
    self.moneyL.text = @"0";
    [self requestCarList];
}
@end
