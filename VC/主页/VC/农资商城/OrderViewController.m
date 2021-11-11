//
//  OrderViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/27.
//

#import "OrderViewController.h"
#import "orderAddressCellView.h"
#import "allAdressParser.h"
#import "addressTextModel.h"
#import "orderAddressCellFrameModel.h"
#import "addressViewController.h"
#import "orderTextModel.h"
#import "generateConfirmOrderParser.h"
#import "goodsOrderModel.h"
#import "cartProductModel.h"
#import "oneProductTableViewCell.h"
#import "shopOrderModel.h"
#import "orderProductCollectionView.h"
#import "orderCollectionViewCell.h"
#import "showProductListView.h"
#import "orderPayView.h"
#import "generateOrderParser.h"
#import "weChatPay.h"

@interface OrderViewController ()<UIGestureRecognizerDelegate,UIScrollViewDelegate,allAddressParserDelegate,UITableViewDelegate,UITableViewDataSource,generateConfirmOrderParserDelegate,UITextFieldDelegate,generateOrderParserDelegate,weChatPayDelegate,WXApiDelegate>
@property(nonatomic,retain)orderAddressCellView*addressCellView;
@property(nonatomic,retain)UIScrollView*homeScrollView;
@property(nonatomic,retain)NSMutableArray *addressArr;
@property(nonatomic,retain)addressTextModel *addressModel;

@property(nonatomic,retain)UITableView * myTab;
@property(nonatomic,retain)orderTextModel * orderModel;
@property(nonatomic,retain)UILabel * moneyL;
@property(nonatomic,assign)NSInteger  recordTag;
@property(nonatomic,retain)NSMutableArray *remarkArr;
@property(nonatomic,assign)BOOL keyBoardShow;
@property(nonatomic,assign)NSInteger payType;

@end

@implementation OrderViewController
-(id)init{
    if (self==[super init]) {
        self.selectArr = [[NSMutableArray alloc] init];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BackGroundColor;
    self.addressArr = [[NSMutableArray alloc] init];
    self.remarkArr = [[NSMutableArray alloc] init];
    [[NSNotificationCenter defaultCenter ]addObserver:self selector:@selector(addressChangeMethod:) name:@"addressChange" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(commitPayMethod:) name:@"CommitPay" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [self createNaviView];
    [self createScrollView];
    [self createAddressCellView];
    [self requestAllAddress];
    [self dealSelectArrData];
 }
-(void)dealSelectArrData{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (cartProductModel*model in self.selectArr) {
        [arr addObject:model.myId];
    }
    generateConfirmOrderParser* parser = [[generateConfirmOrderParser alloc] init];
    parser.myDelegate = self;
    [parser requestOrderParser:arr];
}
-(void)successGenerateOrder:(orderTextModel *)model{
    self.orderModel = model;
    [self createTableView];
    [self createBottomView];

}
-(void)requestAllAddress{
    allAdressParser * parser = [[allAdressParser alloc] init];
    parser.myDelegate = self;
    [parser requestAllAdress];
}
-(void)successGetAllAdress:(NSMutableArray *)listArr{
    [self.addressArr removeAllObjects];
    if (listArr.count>0) {
        for (addressTextModel * model in listArr) {
            if ([model.defaultStatus integerValue]==1) {
                [self.addressArr addObject:model];
            }
        }
        if (self.addressArr.count>0) {
            self.addressModel = self.addressArr[0];
        }else{
            self.addressModel = listArr[0];
        }
        orderAddressCellFrameModel * frameModel = [[orderAddressCellFrameModel alloc] init];
        frameModel.model = self.addressModel;
        self.addressCellView.frameModel = frameModel;
    }else{
        
    }
    self.addressArr = listArr;
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
    title.text = @"确认订单";
    title.textColor = [UIColor blackColor];
    title.font = FontSize(17);
    title.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:title];

    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}
-(void)backButtonMethod{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)createScrollView{
    self.homeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, TopHeight, ScreenWidth, ScreenHeight-59)];
    self.homeScrollView.delegate = self;
    self.homeScrollView.contentSize = CGSizeMake(ScreenWidth, 1000);
    self.homeScrollView.showsVerticalScrollIndicator = NO;
    self.homeScrollView.userInteractionEnabled = YES;
    self.homeScrollView.backgroundColor = BackGroundColor;
//    [self.view addSubview:self.homeScrollView];
    [self.view addSubview:self.homeScrollView];
}
-(void)createAddressCellView{
    self.addressCellView = [[orderAddressCellView alloc] init];
    self.addressCellView.frame = CGRectMake(10, 10, ScreenWidth-20, 120);
    self.addressCellView.backgroundColor = [UIColor whiteColor];
    [self.homeScrollView addSubview:self.addressCellView];
    [self reloadScrollViewFrame:CGRectGetMaxY(self.addressCellView.frame)];
    self.addressCellView.tag=100;
    UITapGestureRecognizer * ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMethod:)];
    ges.view.tag=self.addressCellView.tag;
    [self.addressCellView addGestureRecognizer:ges];
}
-(void)tapMethod:(UITapGestureRecognizer*)rec{
    NSLog(@"%ld",(long)rec.view.tag);
 
    if (rec.view.tag==100) {
        addressViewController * addressVC = [[addressViewController alloc] init];
        addressVC.select=YES;
        [self.navigationController pushViewController:addressVC animated:YES];
    }else{
        if (rec.view.tag>=200) {
            showProductListView * listV = [[showProductListView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, FullScreenHeight)];
            shopOrderModel * shopModel = self.orderModel.cartPromotionItemList[rec.view.tag-200];
            listV.listArr = shopModel.cartList;
            [self.view addSubview:listV];
        }
    }
     
}
-(void)reloadScrollViewFrame:(CGFloat)height{
    self.homeScrollView.contentSize= CGSizeMake(ScreenWidth, height) ;
}
-(void)addressChangeMethod:(NSNotification*)noti{
    orderAddressCellFrameModel * frameModel = [[orderAddressCellFrameModel alloc] init];
    frameModel.model = [noti.userInfo objectForKey:@"addressModel"];
    self.addressCellView.frameModel = frameModel;
}
-(void)createTableView{
    self.myTab = [[UITableView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.addressCellView.frame)+10, ScreenWidth-20, self.orderModel.cartPromotionItemList.count*254) style:UITableViewStyleGrouped];
    self.myTab.delegate = self;
    self.myTab.dataSource = self;
    self.myTab.rowHeight=204;
    self.myTab.showsVerticalScrollIndicator = NO;
    self.myTab.scrollEnabled = NO;
    self.myTab.separatorStyle = 0;
    [self.homeScrollView addSubview:self.myTab];
    self.myTab.backgroundColor = [UIColor clearColor];
    [self reloadScrollViewFrame:CGRectGetMaxY(self.myTab.frame)];

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.orderModel.cartPromotionItemList.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    shopOrderModel * shopModel = self.orderModel.cartPromotionItemList[indexPath.section];
    goodsOrderModel * goodsModel = shopModel.cartList[indexPath.row];
    oneProductTableViewCell * cell;
    if (shopModel.cartList.count>1) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"moreProduct"];
        if (cell==nil) {
            cell = [[[UINib nibWithNibName:@"oneProductTableViewCell" bundle:nil]instantiateWithOwner:self options:nil]lastObject];
        }
        cell.selectionStyle=0;
        UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
        flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        orderProductCollectionView *CollectionView = [[orderProductCollectionView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth-100, 92) collectionViewLayout:flow];
        CollectionView.showsHorizontalScrollIndicator=NO;
        [CollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([orderCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"cell"];
        [CollectionView items:shopModel.cartList.count withRowHeight:92 withRowWidth:92 withSpacing:10 withHeaderTitle:@"" cellIdentify:@"" shopModel:shopModel selectedCell:^(NSIndexPath * _Nonnull indexPath) {
            
        }];
        [cell.moreProductView addSubview:CollectionView];
        cell.moreCountL.text = [NSString stringWithFormat:@"共%lu件",(unsigned long)shopModel.cartList.count];
        cell.freightML.text =[NSString stringWithFormat:@"%@",shopModel.freightAmount];
        cell.moreTF.delegate = self;
        cell.moreTF.textAlignment = NSTextAlignmentRight;
//        [self.remarkArr addObject:cell.moreTF];
        cell.moreTF.returnKeyType =UIReturnKeyDone;
        shopModel.remark = cell.moreTF.text;
        [self.orderModel.cartPromotionItemList replaceObjectAtIndex:indexPath.section withObject:shopModel];
        cell.moreBgView.tag = 200+indexPath.section;;
        UITapGestureRecognizer * ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMethod:)];
        ges.view.tag = cell.moreBgView.tag;
        [cell.moreBgView addGestureRecognizer:ges];
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:@"oneProduct"];
        if (cell==nil) {
            cell = [[[UINib nibWithNibName:@"oneProductTableViewCell" bundle:nil]instantiateWithOwner:self options:nil]firstObject];
        }
        cell.selectionStyle=0;
        
        
        [cell.iconImageV sd_setImageWithURL:[NSURL URLWithString:goodsModel.pic]];
        cell.titleL.text = goodsModel.name;
        cell.typeL.text = goodsModel.spec1Val;
        cell.freightL.text = [NSString stringWithFormat:@"%@",goodsModel.freight];
        cell.moneyL.text =  [NSString stringWithFormat:@"%@",goodsModel.mallPrice];
        cell.countL.text = [NSString stringWithFormat:@"x%@",goodsModel.quantity];
        cell.textField.delegate = self;
        cell.textField.textAlignment = NSTextAlignmentRight;
//        [self.remarkArr addObject:cell.moreTF];
        cell.textField.returnKeyType =UIReturnKeyDone;
        shopModel.remark = cell.textField.text;
        [self.orderModel.cartPromotionItemList replaceObjectAtIndex:indexPath.section withObject:shopModel];
//        [self.remarkArr addObject:cell.textField];
        Ivar ivar =  class_getInstanceVariable([UITextField class], "_placeholderLabel");
        UILabel *placeholderLabel = object_getIvar(cell.textField, ivar);
        placeholderLabel.textAlignment = NSTextAlignmentRight;
    }
    
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    cartListProductModel * model = self.shopArr[section];
//    NSMutableArray * arr =self.productDic[model.shopName];
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth-20, 40)];
    view.backgroundColor = [UIColor whiteColor];
    UIImageView * imageV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 23, 14, 12.5)];
    imageV.image = [UIImage imageNamed:@"店铺"];
    [view addSubview:imageV];
   shopOrderModel * shopModel = self.orderModel.cartPromotionItemList[section];
    UILabel * shopNameL = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageV.frame)+6.5, imageV.center.y-7.5, [commonMethod widthAuto:shopModel.shopName fontSize:15 contentheight:15]+10, 15)];
    shopNameL.text = shopModel.shopName;
    shopNameL.textColor = UIColorFromRGB(0x080808);
    shopNameL.font = [UIFont fontWithName:@"PingFangSC-Medium" size:15];
    [view addSubview:shopNameL];
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth-20, 10)];
    view.backgroundColor = UIColorFromRGB(0xF8FAFB);
    return view;
}
-(void)createBottomView{
    CGFloat height = 0;
    if (statusBarHeight>20) {
        height = 69;
    }else{
        height=49;
    }
    UIView * bgView = [[UIView alloc] initWithFrame:CGRectMake(0, FullScreenHeight-height, ScreenWidth, height)];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(16, 23.5, 9, 11.5)];
    label.text = @"¥";
    label.textColor = UIColorFromRGB(0xFD2A18);
    label.font  =FontSize(15);
    [bgView addSubview:label];
    
    self.moneyL = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(label.frame)+6, 13.5, [commonMethod widthAuto:[NSString stringWithFormat:@"%@",self.orderModel.payAmount] fontSize:28 contentheight:21.5]+10, 21.5)];
    self.moneyL.text = [NSString stringWithFormat:@"%@",self.orderModel.payAmount];
    self.moneyL.textColor= UIColorFromRGB(0xFD2A18);;
    self.moneyL.font  =[UIFont fontWithName:@"PingFang SC Medium" size:28];
    [bgView addSubview:self.moneyL];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(ScreenWidth-120, 4.5, 110, 40);
    button.backgroundColor = UIColorFromRGB(0x60C2B6);
    [button setTitle:@"提交订单" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = FontSize(15);
    [button addTarget:self action:@selector(commitOrderMethod) forControlEvents:UIControlEventTouchUpInside];
    button.clipsToBounds=YES;
    button.layer.cornerRadius = 20;
    [bgView addSubview:button];
}
- (void)keyboardWillShow:(NSNotification *)notification
{
    NSDictionary *userInfo = [notification userInfo];
    CGRect keyboardEndFrame;
    [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyboardEndFrame];
    CGRect keyboardFrame = [self.view convertRect:keyboardEndFrame fromView:nil];
    self.homeScrollView.contentInset = UIEdgeInsetsMake(0, 0, keyboardFrame.size.height, 0);
    self.keyBoardShow=YES;
}
- (void)keyboardWillHide:(NSNotification*)notification
{
    self.keyBoardShow=NO;

}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.myTab reloadData];
    return YES;
}
 
-(void)commitOrderMethod{
    orderPayView * payView = [[orderPayView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, FullScreenHeight)];
    payView.money = self.moneyL.text;
    [self.view addSubview:payView];
}
-(void)commitPayMethod:(NSNotification*)noti{
  self.payType =  [[noti.userInfo objectForKey:@"payType"] integerValue];
    NSMutableArray *shopParams = [[NSMutableArray alloc] init];
    NSMutableArray *cartIds = [[NSMutableArray alloc] init];

     for (shopOrderModel*model in _orderModel.cartPromotionItemList) {
         NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        [dic setValue:[NSNumber numberWithInteger:0] forKey:@"billSend"];
        [dic setValue:[NSNumber numberWithInteger:0] forKey:@"memberBillId"];
        [dic setValue:[NSNumber numberWithInteger:0] forKey:@"memberBillReceiveId"];
        [dic setValue:[NSNumber numberWithInteger:[model.shopId integerValue]] forKey:@"shopId"];
        [dic setValue:model.remark forKey:@"remark"];
        [shopParams addObject:dic];
    }
    for (goodsOrderModel*model in self.selectArr) {
        [cartIds addObject:[NSNumber numberWithInteger:[model.myId integerValue]]];
    }
    generateOrderParser * parser = [[generateOrderParser alloc] init];
    parser.myDelegate = self;
    [parser requestOrder:cartIds memberReceiveAddressId:[self.addressModel.myId integerValue] payLineType:1 payType:self.payType quantity:0 shippingType:1 shopParams:shopParams skuId:0 sourceType:1];
}
-(void)successGenerateOrderId:(NSInteger)orderId{
    if (self.payType==2)/*微信*/ {
        [self wechatPayMethod:orderId];
    }else if (self.payType==1)/*支付宝*/{
        
    }
}
-(void)wechatPayMethod:(NSInteger)orderId{
    weChatPay * parser = [[weChatPay alloc] init];
    parser.myDelegate = self;
    [parser requestWechatPay:orderId returnUrl:@""];
}
-(void)successWechatPay:(weChatPayModel *)model{
   
    PayReq *req   = [[PayReq alloc] init];
    req.openID = model.appid;
    req.partnerId = model.partnerid;
    req.prepayId  = model.prepayid;
    req.package  = model.package;
    req.nonceStr  = model.noncestr;
    NSString * stamp = model.timestamp;
    req.timeStamp = stamp.intValue;
    req.sign = model.sign;
    NSLog(@"%@=%@=%@=%@=%@=%d=%@",req.openID,req.partnerId,req.prepayId,req.package,req.nonceStr,req.timeStamp,req.sign);
    [WXApi sendReq:req completion:^(BOOL success) {
        
    }];//
}

-(void)hangleWechatPayWith:(PayReq *)req {
    [WXApi sendReq:req completion:^(BOOL success) {
        if (success) {
            NSLog(@"微信支付成功");
        } else {
             NSLog(@"微信支付异常");
        }
    }];
}

#pragma mark - 微信支付回调

- (void)onResp:(BaseResp *)resp {
    if ([resp isKindOfClass:[PayResp class]]) {
        /*
         enum  WXErrCode {
         WXSuccess           = 0,    < 成功
         WXErrCodeCommon     = -1,  < 普通错误类型
         WXErrCodeUserCancel = -2,   < 用户点击取消并返回
         WXErrCodeSentFail   = -3,   < 发送失败
         WXErrCodeAuthDeny   = -4,   < 授权失败
         WXErrCodeUnsupport  = -5,   < 微信不支持
         };
         */
        PayResp *response = (PayResp*)resp;
        switch (response.errCode) {
            case WXSuccess: {
                NSLog(@"微信回调支付成功");
            break;
            }
            case WXErrCodeCommon: {
                NSLog(@"微信回调支付异常");
                break;
            }
            case WXErrCodeUserCancel: {
                NSLog(@"微信回调用户取消支付");
                break;
            }
            case WXErrCodeSentFail: {
                NSLog(@"微信回调发送支付信息失败");
                break;
            }
            case WXErrCodeAuthDeny: {
                NSLog(@"微信回调授权失败");
                break;
            }
            case WXErrCodeUnsupport: {
                NSLog(@"微信回调微信版本暂不支持");
                break;
            }
            default: {
                break;
            }
        }
    }
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
 }
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
@end
