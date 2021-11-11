//
//  addAddressViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/28.
//

#import "addAddressViewController.h"
#import "addressSelectView.h"
#import "areaListParser.h"
#import "addAddressParser.h"
@interface addAddressViewController ()<UIGestureRecognizerDelegate,areaListParserDelegate,addAddressParserDelegate>
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

@implementation addAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BackGroundColor;
    [self initMethod];
    [self createNaviView];
//    [self createSelectView];
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
    title.text = @"添加收货地址";
    title.textColor = [UIColor blackColor];
    title.font = FontSize(17);
    title.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:title];

   
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}
-(void)backButtonMethod{
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)phoneSelectMethod:(UIButton *)sender {
}
- (IBAction)citySelectButtonMethod:(UIButton *)sender {
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
    [self addAddressMethod];
}
-(void)addAddressMethod{
    addAddressParser * parser = [[addAddressParser alloc] init];
    parser.myDelegate = self;
    [parser addAddress:[[self.selectArr objectAtIndexCheck:0]integerValue]  city:[[self.selectArr objectAtIndexCheck:1]integerValue] region:[[self.selectArr objectAtIndexCheck:2]integerValue] detailAddress:_addressTF.text name:_nameTF.text phoneNumber:_phoneTF.text defaultStatus:self.selectButton.selected];
}
-(void)successaddAdress{
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
//    NSString * addressStr =@"";
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
