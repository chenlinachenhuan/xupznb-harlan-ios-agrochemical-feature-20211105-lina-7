//
//  updateAddressViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/29.
//

#import "updateAddressViewController.h"
#import "updateAdressParser.h"
#import "addressSelectView.h"
#import "detailAddressParser.h"
#import "deleteAddressParser.h"
@interface updateAddressViewController ()<detailAddressParserDelegate,UIGestureRecognizerDelegate,updateAdressParserDelegate,deleteAddressParserDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UIButton *phoneButton;
@property (weak, nonatomic) IBOutlet UITextField *cityTF;
@property (weak, nonatomic) IBOutlet UIButton *cityButton;
@property (weak, nonatomic) IBOutlet UITextField *addressTF;
@property (weak, nonatomic) IBOutlet UIButton *selectButton;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property(nonatomic,retain)NSMutableArray * selectArr;

@end

@implementation updateAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BackGroundColor;
    [self initMethod];
    [self createNaviView];
    [self requestdetailAddress];
}
-(void)requestdetailAddress{
    detailAddressParser * parser = [[detailAddressParser alloc] init];
    parser.myDelegate = self;
    [parser detailAddress:self.myId];
}
-(void)successGetDetailAddress:(addressTextModel *)model{
    self.nameTF.text = model.name;
    self.phoneTF.text = model.phone;
    self.cityTF.text = [NSString stringWithFormat:@"%@ %@ %@",model.province,model.city,model.region];
    [self.selectArr addObject:model.provinceId];
    [self.selectArr addObject:model.cityId];
    [self.selectArr addObject:model.regionId];

    self.addressTF.text = model.address;
    if ([model.defaultStatus intValue]==1) {
        [self.selectButton setImage:[UIImage imageNamed:@"开"] forState:UIControlStateNormal];
        self.selectButton.selected = YES;
    }else{
        [self.selectButton setImage:[UIImage imageNamed:@"关"] forState:UIControlStateNormal];
        self.selectButton.selected = NO;
    }
    
}
-(void)initMethod{
    self.selectArr = [[NSMutableArray alloc] init];
    self.saveButton.clipsToBounds = YES;
    self.saveButton.layer.cornerRadius = 20;
    UITapGestureRecognizer * ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMethod:)];
    [self.cityTF addGestureRecognizer:ges];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(addressNameMethod:) name:@"addressName" object:nil];
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
    title.text = @"修改收货地址";
    title.textColor = [UIColor blackColor];
    title.font = FontSize(17);
    title.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:title];

    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(ScreenWidth-16.5-50, statusBarHeight, 50, 44);
    button.titleLabel.textAlignment = NSTextAlignmentRight;
    [button setTitle:@"删除" forState:UIControlStateNormal];
    [button setTitleColor:SelectColor forState:UIControlStateNormal];
    [button addTarget:self action:@selector(deleteButton) forControlEvents:UIControlEventTouchUpInside];
    [bgV addSubview:button];
    button.titleLabel.font = FontSize(15);
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}
-(void)deleteButton{
    deleteAddressParser * parser = [[deleteAddressParser alloc] init];
    parser.myDelegate = self;
    [parser deleteAddress:self.myId];
}
-(void)successDeleteAdress{
    FBUtilShowTipView(self.view,@"删除成功");
    [self.navigationController popViewControllerAnimated:YES];

}
-(void)backButtonMethod{
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)selectButtonMethod:(UIButton *)sender {
    self.selectButton.selected = !self.selectButton.selected;
    if (self.selectButton.selected==YES) {
        [sender setImage:[UIImage imageNamed:@"开"] forState:UIControlStateNormal];
    }else{
        [sender setImage:[UIImage imageNamed:@"关"] forState:UIControlStateNormal];

    }
}
- (IBAction)saveButtonMethod:(UIButton *)sender {
    [self updateAddressMethod];
}
-(void)updateAddressMethod{
    updateAdressParser * parser = [[updateAdressParser alloc] init];
    parser.myDelegate = self;
    [parser updateAddress:[[self.selectArr objectAtIndexCheck:0]integerValue]  city:[[self.selectArr objectAtIndexCheck:1]integerValue] region:[[self.selectArr objectAtIndexCheck:2]integerValue] detailAddress:_addressTF.text name:_nameTF.text phoneNumber:_phoneTF.text defaultStatus:self.selectButton.selected myId:self.myId];

     
}
-(void)successUpdateAddress{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)tapMethod:(UIGestureRecognizer*)rec{
    [self.view endEditing:YES];
    [self createSelectView];
}
-(void)createSelectView{
    addressSelectView* addV = [[addressSelectView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [addV createSelectView];
    [self.view addSubview:addV];
}
-(void)addressNameMethod:(NSNotification*)noti{
    NSString * addressStr= [noti.userInfo objectForKey:@"address"];
    
    self.cityTF.text = addressStr;
    self.selectArr =[noti.userInfo objectForKey:@"addressId"];

 }
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
