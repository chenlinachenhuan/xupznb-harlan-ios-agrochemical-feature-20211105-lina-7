//
//  addressViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/27.
//

#import "addressViewController.h"
#import "sddressTableViewCell.h"
#import "addressCellFrameModel.h"
#import "addAddressViewController.h"
#import "allAdressParser.h"
#import "updateAddressViewController.h"
 @interface addressViewController ()<UIGestureRecognizerDelegate,UITableViewDelegate,UITableViewDataSource,allAddressParserDelegate>
@property(nonatomic,retain)UITableView * myTab;
@property(nonatomic,retain)NSMutableArray * listArr;

@end

@implementation addressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BackGroundColor;
    self.navigationController.navigationBarHidden = YES;
    [self initMethod];
    [self createNaviView];
    [self createTableView];
    [self createBottomButton];
}
-(void)viewWillAppear:(BOOL)animated{
    [self requestAdressList];

}
-(void)initMethod{
    self.listArr = [[NSMutableArray alloc] init];
}
-(void)requestAdressList{
    allAdressParser * parser = [[allAdressParser alloc] init];
    parser.myDelegate = self;
    [parser requestAllAdress];
      
 }
-(void)successGetAllAdress:(NSMutableArray *)listArr{
    [self.listArr removeAllObjects];
    for (int i=0; i<listArr.count; i++) {
       addressTextModel*tmodel = listArr[i];
       addressCellFrameModel *fModel = [[addressCellFrameModel alloc] init];
       fModel.model =tmodel;
       [self.listArr addObject:fModel];
    }
    [self.myTab reloadData];

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
    title.text = @"我的收货地址";
    title.textColor = [UIColor blackColor];
    title.font = FontSize(17);
    title.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:title];

   
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}
-(void)createBottomButton{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(36, ScreenHeight1-60, ScreenWidth-72, 40);
    [button setBackgroundColor:SelectColor];
    [button setImage:[UIImage imageNamed:@"加入学习"] forState:UIControlStateNormal];
    [button setTitle:@"新增收货地址" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(addAddressMethod) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.clipsToBounds = YES;
    button.layer.cornerRadius = 20;
    button.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -10);
    [self.view addSubview:button];
}
-(void)addAddressMethod{
    addAddressViewController * addVC = [[addAddressViewController alloc] init];
    [self.navigationController pushViewController:addVC animated:YES];
}
-(void)backButtonMethod{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)createTableView{
    self.myTab = [[UITableView alloc] initWithFrame:CGRectMake(8, TopHeight+14, ScreenWidth-16, ScreenHeight-80) style:UITableViewStylePlain];
    self.myTab.delegate = self;
    self.myTab.dataSource = self;
    self.myTab.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.myTab];
    self.myTab.clipsToBounds = YES;
    self.myTab.separatorStyle=0;
    self.myTab.showsVerticalScrollIndicator = NO;
    self.myTab.layer.cornerRadius = 10;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _listArr.count;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    addressCellFrameModel *fmodel =self.listArr[indexPath.row];
    return fmodel.cellHeight;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    sddressTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell = [[sddressTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle=0;
    cell.contentView.backgroundColor = [UIColor clearColor];
    addressCellFrameModel *fmodel =self.listArr[indexPath.row];
    cell.iconV.frame = fmodel.iconVFrame;
    cell.iconV.clipsToBounds=YES;
    cell.iconV.layer.cornerRadius = 16;
    cell.iconL.frame = fmodel.iconLFrame;
    cell.iconL.text = [fmodel.model.name substringToIndex:1];
    cell.nameL.frame = fmodel.nameFrame;
    cell.nameL.text = fmodel.model.name;
    cell.phoneL.frame = fmodel.phoneFrame;
    cell.phoneL.text = fmodel.model.phone;
    if ([fmodel.model.defaultStatus intValue]==1) {
        cell.selectAddressL.frame = fmodel.selectAddressLFrame;
        cell.selectAddressL.hidden = NO;
    }else{
        cell.selectAddressL.hidden = YES;

    }
    cell.addressL.frame = fmodel.addressLFrame;
    cell.addressL.text = [NSString stringWithFormat:@"%@ %@ %@ %@",fmodel.model.province,fmodel.model.city,fmodel.model.region,fmodel.model.address];
    cell.checkB.frame = fmodel.checkBFrame;
    [cell.checkB addTarget:self action:@selector(checkMethod:) forControlEvents:UIControlEventTouchUpInside];
    cell.checkB.tag = indexPath.row;
    
    return cell;
}
-(void)checkMethod:(UIButton*)button{
    addressCellFrameModel *fmodel =self.listArr[button.tag];
    updateAddressViewController * updateVC = [[updateAddressViewController alloc] init];
    updateVC.myId = [fmodel.model.myId integerValue];
    [self.navigationController pushViewController:updateVC animated:YES];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_select==YES) {
        addressCellFrameModel *fmodel =self.listArr[indexPath.row];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"addressChange" object:nil userInfo:@{@"addressModel":fmodel.model}];
        [self.navigationController popViewControllerAnimated:YES];
    }
}
@end
