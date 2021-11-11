//
//  Agro_serviceViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/6.
//

#import "Agro_serviceViewController.h"
#import "wetherView.h"
#import "weatherScrollview.h"
#import "hospitalButton.h"
#import "CustomNewsTableView.h"
#import "MyPlanTableViewCell.h"
#import "policyTableViewCell.h"
#import "CustomVerticallyCollectionView.h"
#import "expertCollectionViewCell.h"
#import "VerticalCollectionViewCell.h"
#import "classHomeViewController.h"
#import "classDetailViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "knowledgeListParser.h"
#import "knowledgeListModel.h"
#import "PestsAndDiseasesViewController.h"
#import "knowledgeListViewController.h"
#import "knowledgeDetailViewController.h"
#import "proficientParser.h"
#import "exportListModel.h"
#import "classListParser.h"
#import "classListModel.h"
@interface Agro_serviceViewController ()<UIScrollViewDelegate,weatherParserDelegate,CLLocationManagerDelegate,knowledgeListParserDelegate,proficientParserDelegate,classListParserDelegate>
@property(nonatomic,retain)UIScrollView *homeScrollView;
@property(nonatomic,retain)UIButton * naviButton;
@property(nonatomic,retain)wetherView * wetherV;
@property(nonatomic,retain)weatherScrollview * wetherScrollview;
@property(nonatomic,retain)NSMutableArray * weatherDayArr;
@property(nonatomic,retain)NSMutableArray * weatherMonthArr;
@property(nonatomic,retain)CustomNewsTableView *MyPlanTableView;
@property(nonatomic,retain)UIView *buttonView;
@property(nonatomic,retain)CustomNewsTableView *PestsTableView;
@property(nonatomic,retain)CustomVerticallyCollectionView * ExpertView;
@property(nonatomic,retain)CustomVerticallyCollectionView * popularClassCollectionView;
@property(nonatomic,retain)CustomNewsTableView * TechnologyDigestView;
@property(nonatomic,retain)weatherModel * weatherModel;
@property (nonatomic, strong) CLLocationManager* locationManager;
@property (nonatomic, strong) CLLocation*currentLocation;
@property(nonatomic,retain)NSString* currentCity;
@property(nonatomic,retain)NSMutableArray *knowledgeListArr;
@property(nonatomic,retain)NSMutableArray *pestListArr;
@property(nonatomic,retain)NSMutableArray *expertListArr;
@property(nonatomic,retain)NSMutableArray *classListArr;

@property(nonatomic,assign)NSInteger catId;

@end

@implementation Agro_serviceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = colorH(248, 250, 251);
    [self initMethod];
    [self createScrollView];
    [self createNavigationBarView];
    [self startLocation];
    [self createWeatherView];
    [self createButtonView];
    [self createMyPlanView];
//    [self createPestControlView];
//    [self createHualangExpertView];
//    [self createHualangClassView];
//    [self createTechnologyDigestView];
//    [self createLastLabel];
    [self requestKnowledgeList];
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}
-(void)initMethod{
    self.currentCity = [[NSString alloc] init];
    self.pestListArr= [[NSMutableArray alloc] init];
    self.knowledgeListArr= [[NSMutableArray alloc] init];
    self.expertListArr= [[NSMutableArray alloc] init];
    self.classListArr= [[NSMutableArray alloc] init];

    self.catId=338;//病虫害防治
}
-(void)createScrollView{
   
    self.homeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, statusBarHeight, ScreenWidth, ScreenHeight)];
    self.homeScrollView.delegate = self;
    self.homeScrollView.contentSize = CGSizeMake(ScreenWidth, 1000);
    self.homeScrollView.showsVerticalScrollIndicator = NO;
    self.homeScrollView.userInteractionEnabled = YES;
//    [self.view addSubview:self.homeScrollView];
    [self.view addSubview:self.homeScrollView];
}
#pragma mark 创建导航栏
-(void)createNavigationBarView{
    UIView * naviView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    [self.homeScrollView addSubview:naviView];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0,0,ScreenWidth,40);
    label.numberOfLines = 0;
    label.text = @"作物医院";
    label.font = [UIFont fontWithName:@"PingFang SC" size: 17];
    label.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
    label.textAlignment = NSTextAlignmentCenter;
    [naviView addSubview:label];
    
    self.naviButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.naviButton.frame = CGRectMake(ScreenWidth-homeSpacing-17, label.center.y-14*0.5, 17, 14);
    [self.naviButton setImage:[UIImage imageNamed:@"菜单"] forState:UIControlStateNormal];
    [self.naviButton addTarget:self action:@selector(menuButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [naviView addSubview:self.naviButton];
    [self reloadScrollViewFrame:CGRectGetMaxY(naviView.frame)];
}
-(void)menuButtonMethod{
    
}
#pragma mark Location and Delegate
    - (void)startLocation
    {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        
    }
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (![CLLocationManager locationServicesEnabled]) {
        NSLog(@"定位服务当前可能尚未打开，请设置打开！");
        return;
    }
    if ([CLLocationManager authorizationStatus]==kCLAuthorizationStatusNotDetermined){
        [_locationManager requestWhenInUseAuthorization];
    }else if([CLLocationManager authorizationStatus]==kCLAuthorizationStatusAuthorizedWhenInUse){
        //设置代理
        _locationManager.delegate=self;
        //设置定位精度
        _locationManager.desiredAccuracy=kCLLocationAccuracyBest;
        //定位频率,每隔多少米定位一次
        CLLocationDistance distance=10.0;//十米定位一次
        _locationManager.distanceFilter=distance;
        //启动跟踪定位
        [_locationManager startUpdatingLocation];
    }
}
- (void)locationManager:(CLLocationManager *)manager
         didUpdateLocations:(NSArray *)locations
{
    CLLocation *newLocation = locations.lastObject;
    NSTimeInterval locationAge = -[newLocation.timestamp timeIntervalSinceNow];
    if (locationAge > 5.0) return;
    if (newLocation.horizontalAccuracy < 0) return;
        // Needed to filter cached and too old locations
        //NSLog(@"Location updated to = %@", newLocation);
    CLLocation *loc1 = [[CLLocation alloc] initWithLatitude:_currentLocation.coordinate.latitude longitude:_currentLocation.coordinate.longitude];
    CLLocation *loc2 = [[CLLocation alloc] initWithLatitude:newLocation.coordinate.latitude longitude:newLocation.coordinate.longitude];
    double distance = [loc1 distanceFromLocation:loc2];
    
    _currentLocation = newLocation;
    if(distance > 20){
        CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
             //反编码
        [geoCoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
               if (placemarks.count > 0) {
                   CLPlacemark *placeMark = placemarks[0];
                   self->_currentCity = placeMark.locality;
                   if (!self->_currentCity) {
                       self->_currentCity = @"无法定位当前城市";
                   }
                   [self getWeatherDataModel:newLocation.coordinate.latitude longitude:newLocation.coordinate.longitude];
               }
               else if (error == nil && placemarks.count == 0) {
                   NSLog(@"No location and error return");
               }
               else if (error) {
                   NSLog(@"location error: %@ ",error);
               }
         
           }];
         
    }else{
        [_locationManager stopUpdatingLocation];
    }
        //location updated
}
- (void)locationManager:(CLLocationManager *)manager
           didFailWithError:(NSError *)error{
    if (error.code == kCLErrorDenied) {
        // 提示用户出错原因，可按住Option键点击 KCLErrorDenied的查看更多出错信息，可打印error.code值查找原因所在
    }
}
-(void)getWeatherDataModel:(CGFloat)latitude longitude:(CGFloat)longitude{
    [[ChrysanthemumIndexView sharedMasterUser] show];
    weatherParser * parser = [[weatherParser alloc] init];
    parser.myDelegate = self;
    [parser requestWeather:latitude withLongitude:longitude];
}
-(void)successWeatherNows:(weatherModel *)model{
    [[ChrysanthemumIndexView sharedMasterUser] remove];
    NSLog(@"%@",model.textDesc);
    model.address = _currentCity;
    self.weatherModel = model;
    [self.wetherV reloadDataMethod:model];
    self.wetherV.frame = CGRectMake(0, 40, ScreenWidth, CGRectGetMaxY(self.wetherV.windView.frame));
    [self.wetherScrollview reloadDataMethod:model];

}
-(void)failedMethod:(NSString *)message{
    [[ChrysanthemumIndexView sharedMasterUser] remove];
    FBUtilShowTipView(self.view,message);
}
#pragma mark 创建天气View
-(void)createWeatherView{
    self.wetherV = [[wetherView alloc] initWithFrame:CGRectMake(0, 40, ScreenWidth, ScreenHeight*0.5434397) ];
    [self.homeScrollView addSubview:self.wetherV];
    [self reloadScrollViewFrame:CGRectGetMaxY(self.wetherV.frame)];

    self.wetherScrollview = [[weatherScrollview alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.wetherV.frame)+16, ScreenWidth, 204) weatherDayArr:self.weatherDayArr weatherMonthArr:self.weatherMonthArr ];
    self.wetherScrollview.model = self.weatherModel;
//    self.wetherScrollview.backgroundColor = [UIColor whiteColor];
    [self.homeScrollView addSubview:self.wetherScrollview];
 
    [self reloadScrollViewFrame:CGRectGetMaxY(self.wetherScrollview.frame)];

}
#pragma mark 创建buttonView
-(void)createButtonView{
    NSMutableArray * arr = [NSMutableArray arrayWithObjects:@"土壤检测",@"种植方案",@"用肥指导", nil];
    self.buttonView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.wetherScrollview.frame)+homeSpacing, ScreenWidth, (ScreenWidth-32-25)/3*0.4528302)];
    for (int i=0; i<3; i++) {
        hospitalButton * button = [hospitalButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:arr[i]] forState:UIControlStateNormal];
        button.frame = CGRectMake(homeSpacing+((ScreenWidth-32-25)/3+12.5)*i, 0, (ScreenWidth-32-25)/3, (ScreenWidth-32-25)/3*0.4528302);
        button.clipsToBounds = YES;
        button.layer.cornerRadius = 5;
        [button setTitle:arr[i] forState:UIControlStateNormal];
        button.titleLabel.font=[UIFont fontWithName:@"PingFang SC" size: 12];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor whiteColor];
        [self.buttonView addSubview:button];
    }
     [self.homeScrollView addSubview:self.buttonView];
    [self reloadScrollViewFrame:CGRectGetMaxY(self.buttonView.frame)];

}
#pragma mark 创建我的方案View
-(void)createMyPlanView{
    __weak CustomNewsTableView * tb = self.MyPlanTableView;

    self.MyPlanTableView = [[CustomNewsTableView alloc]initWithFrame:CGRectMake(homeSpacing,CGRectGetMaxY(self.buttonView.frame)+homeSpacing, self.homeScrollView.frame.size.width-2*homeSpacing, (self.homeScrollView.frame.size.width-2*homeSpacing)*0.174927114) headerHeight:0 style:UITableViewStylePlain rowCount:1 cellHeight:(self.homeScrollView.frame.size.width-2*homeSpacing)*0.174927114 cell:^UITableViewCell *(NSIndexPath *indexPath)  {
            // 创建你自定义的cell
            static NSString *identifier = @"MyPlanCell";
            MyPlanTableViewCell *cell = [tb dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[[UINib nibWithNibName:@"MyPlanTableViewCell" bundle:nil]instantiateWithOwner:self options:nil]lastObject];
            }
//        cell.backgroundColor = colorH(248, 250, 251);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }selectedCell:^(NSIndexPath *indexPath) {
            //点击cell执行此方法
            NSLog(@"网%ld",indexPath.row);
        } moreButtonClick:^(UIButton * _Nonnull button) {
            
        }];
    self.MyPlanTableView.clipsToBounds = YES;
    self.MyPlanTableView.layer.cornerRadius = 10;
    self.MyPlanTableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    [self.homeScrollView addSubview:self.MyPlanTableView];
    [self reloadScrollViewFrame:CGRectGetMaxY(self.MyPlanTableView.frame)];

}
-(CGFloat)createTitleView:(NSString*)title litleTitle:(NSString*)litleTitle frame:(CGRect)frame withTag:(CGFloat)tag{
     
    UILabel * titleL = [[UILabel alloc] initWithFrame:CGRectMake(15.5, frame.origin.y+frame.size.height+24, ScreenWidth-2*homeSpacing, 52)];
    titleL.text = title;
    titleL.numberOfLines=0;
    titleL.textColor = [UIColor blackColor];
//    titleL.backgroundColor = [UIColor orangeColor];
    titleL.font = [UIFont fontWithName:@"PingFang SC" size: 15];
    CGSize size = CGSizeMake(ScreenWidth-2*homeSpacing, MAXFLOAT);//设置高度宽度的最大限度
    CGRect rect = [title boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:20]} context:nil];
    titleL.frame = CGRectMake(15.5, CGRectGetMaxY(frame)+24, ScreenWidth-32, rect.size.height);
    [self.homeScrollView addSubview:titleL];
    [self reloadScrollViewFrame:CGRectGetHeight(titleL.frame)];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(ScreenWidth-homeSpacing-ScreenHeight*0.0248227*0.5714286, titleL.center.y-ScreenHeight*0.0248227*0.5, ScreenHeight*0.0248227*0.5714286, ScreenHeight*0.0248227);
    [button setImage:[UIImage imageNamed:@"大模块进入"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(enterButtonMethod:) forControlEvents:UIControlEventTouchUpInside];
    button.tag=tag;
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
-(void)requestKnowledgeList
{
    knowledgeListParser *parser = [[knowledgeListParser alloc] init];
    parser.myDelegate = self;
    [parser requestWithCat2Id:self.catId withCatId:0 withKeyWord:@"" withPageNum:1 withPageSize:10 withShowStatus:1 withCropId:0];
}
-(void)successGetList:(NSMutableArray *)arr total:(NSInteger)total{
      if (self.catId==338) {
          self.pestListArr = arr;

         self.PestsTableView.dataArr = arr;

        [self createPestControlView];

    }else if (self.catId==339){
        self.knowledgeListArr=arr;
        [self createTechnologyDigestView];
    }
//    [self.PestsTableView reloadData];
 }
#pragma mark 创建病虫害防治View
-(void)createPestControlView{
    CGFloat y = [self createTitleView:@"病虫害防治" litleTitle:@"" frame:self.MyPlanTableView.frame withTag:10000];
     __weak CustomNewsTableView * tb = self.PestsTableView;
    NSUInteger count =0;
    CGFloat height =0;
    if (_pestListArr.count<=4) {
        count= _pestListArr.count;
       height = 0.177305*ScreenHeight*_pestListArr.count;
    }else{
        count=4;
        height =0.8218085*ScreenHeight;

    }
    self.PestsTableView = [[CustomNewsTableView alloc]initWithFrame:CGRectMake(homeSpacing, y+13.5,self.homeScrollView.frame.size.width-2*homeSpacing, height) headerHeight:0.8218085*ScreenHeight*0.1370010787 style:UITableViewStylePlain rowCount:count cellHeight:0.177305*ScreenHeight cell:^UITableViewCell *(NSIndexPath *indexPath) {
            // 创建你自定义的cell
            static NSString *identifier = @"policyCell";
            policyTableViewCell *cell = [tb dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[[UINib nibWithNibName:@"policyTableViewCell" bundle:nil]instantiateWithOwner:self options:nil]lastObject];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            if(self.pestListArr.count!=0) {
                knowledgeListModel * model =  self->_pestListArr[indexPath.row];
                [cell.imageV sd_setImageWithURL:[NSURL URLWithString:model.pic]];
                cell.titleL.text = model.title;
                cell.textL.text = model.albumPics;
                cell.timeL.text = model.pubTime;
                cell.typeL.hidden = NO;
                if ([model.typeId integerValue]==1)/*防虫*/ {
                    cell.typeL.text = @"防虫";

                }else if ([model.typeId integerValue]==2)/*防病*/ {
                    cell.typeL.text = @"防病";

                }
             }
        return cell;
        }selectedCell:^(NSIndexPath *indexPath) {
            knowledgeListModel * model = self->_pestListArr[indexPath.row];
            knowledgeDetailViewController *detailVC = [[knowledgeDetailViewController alloc] init];
            detailVC.myId =model.myId;
            detailVC.titleStr = @"病虫害防治";

            [self.navigationController pushViewController:detailVC animated:YES];
        } moreButtonClick:^(UIButton * _Nonnull button) {
            
        }];
     
    self.PestsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.PestsTableView.scrollEnabled = NO;
    [self.homeScrollView addSubview:self.PestsTableView];
    [self reloadScrollViewFrame:CGRectGetMaxY(self.PestsTableView.frame)];
    [self requestExpertMethod];

}
-(void)requestExpertMethod{
    proficientParser * parser = [[proficientParser alloc] init];
    parser.myDelegate = self;
    [parser requestProficientList:0 pageNum:1 pageSize:10 proficientBelong:-1 proficientClassStatus:-1 proficientInStatus:-1 proficientOnlineStatus:-1 proficientType:0];
}
-(void)successGetProficientList:(NSMutableArray *)arr total:(NSInteger)total{
    self.expertListArr = arr;
     [self createHualangExpertView];

}
#pragma mark 创建化浪专家View
-(void)createHualangExpertView{
    float y= [self createTitleView:@"化浪专家" litleTitle:@""  frame:self.PestsTableView.frame withTag:20000];
    CGFloat height =0;
    if (_expertListArr.count<=4) {
        height =125;
    }else{
        height =125*2+14;

    }
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    self.ExpertView = [[CustomVerticallyCollectionView alloc] initWithFrame:CGRectMake(homeSpacing, y+24, ScreenWidth-2*homeSpacing, height) collectionViewLayout:flow];
    [self.ExpertView registerNib:[UINib nibWithNibName:NSStringFromClass([expertCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"expert"];
//    self.popularClassCollectionView.backgroundColor = [UIColor orangeColor];
    self.ExpertView.scrollEnabled = NO;
    self.ExpertView.showsVerticalScrollIndicator = NO;
    [self.ExpertView items:MIN(self.expertListArr.count, 8) withRowHeight:125 withRowWidth:(ScreenWidth-32-14*3)/4 withSpacing:14 isShowFooter:NO cellIdentify:@"expert" selectedCell:^(NSIndexPath * _Nonnull indexPath) {
        
    } moreButtonBlock:^(UIButton * _Nonnull button) {
        
    }];
    [self.homeScrollView addSubview:self.ExpertView];
    [self reloadScrollViewFrame:CGRectGetMaxY(self.ExpertView.frame)];
    self.ExpertView.listArr = self.expertListArr;

    [self requestClassList];

}
-(void)requestClassList{
    classListParser *parser = [[classListParser alloc] init];
    parser.myDelegate = self;
    [parser requestClaaList:0 catId:0 crop2Id:0 cropId:0 keyword:@"" orderBy:@"" pageNum:1 pageSize:10 proficientId:0 publishStatus:1];
}
-(void)successGetClassList:(NSMutableArray *)arr total:(NSInteger)total{
    self.classListArr = arr;
    [self createHualangClassView];
}
-(void)createHualangClassView{
    CGFloat y = [self createTitleView:@"化浪课程" litleTitle:@"专家云集，系统讲解" frame:self.ExpertView.frame withTag:30000];
    CGFloat height =0;
    if (_classListArr.count<=2) {
        height =(ScreenWidth-32-12)/2*1.2298157;
    }else if (_classListArr.count<=4){
        height =(ScreenWidth-32-12)/2*1.2298157*2+12;

    }else if (_classListArr.count<=6){
        height =(ScreenWidth-32-12)/2*1.2298157*3+12*2;
    }else{
        height =(ScreenWidth-32-12)/2*1.2298157*3+12*2+ScreenHeight*0.0744681;
    }
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    self.popularClassCollectionView = [[CustomVerticallyCollectionView alloc] initWithFrame:CGRectMake(homeSpacing, y+18, ScreenWidth-2*homeSpacing, height) collectionViewLayout:flow];
    [self.popularClassCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([VerticalCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"popularClass"];
//    self.popularClassCollectionView.backgroundColor = [UIColor orangeColor];
    self.popularClassCollectionView.scrollEnabled = NO;
    self.popularClassCollectionView.showsVerticalScrollIndicator = NO;
    [self.popularClassCollectionView items:MIN(self.classListArr.count, 6) withRowHeight:(ScreenWidth-32-12)/2*1.2298157 withRowWidth:(ScreenWidth-32-12)/2 withSpacing:12 isShowFooter:YES cellIdentify:@"popularClass" selectedCell:^(NSIndexPath * _Nonnull indexPath) {
        classDetailViewController * class = [[classDetailViewController alloc] init];
        [self.navigationController pushViewController:class animated:YES];
    } moreButtonBlock:^(UIButton * _Nonnull button) {
        classHomeViewController * class = [[classHomeViewController alloc] init];
        [self.navigationController pushViewController:class animated:YES];
    }];
    [self.homeScrollView addSubview:self.popularClassCollectionView];
    [self reloadScrollViewFrame:CGRectGetMaxY(self.popularClassCollectionView.frame)];
    self.popularClassCollectionView.listArr = self.classListArr;
    self.catId=339;
    [self requestKnowledgeList];
 }
#pragma mark 创建技术小文摘View
-(void)createTechnologyDigestView{
    float y = [self createTitleView:@"技术小文摘" litleTitle:@"" frame:self.popularClassCollectionView.frame withTag:40000];
     __weak CustomNewsTableView * tb = self.TechnologyDigestView;
    NSUInteger count =0;
    CGFloat height =0;
    if (_knowledgeListArr.count<=4) {
        count= _knowledgeListArr.count;
       height = 118*_knowledgeListArr.count;
    }else{
        count=4;
        height =118*4+0.074468*ScreenHeight;

    }
     self.TechnologyDigestView = [[CustomNewsTableView alloc]initWithFrame:CGRectMake(self.homeScrollView.frame.origin.x, y+15.5, self.homeScrollView.frame.size.width, height) headerHeight: 0.074468*ScreenHeight style:UITableViewStylePlain rowCount:count cellHeight:118 cell:^UITableViewCell *(NSIndexPath *indexPath) {
             // 创建你自定义的cell
             static NSString *identifier = @"policyCell";
         policyTableViewCell *cell = [tb dequeueReusableCellWithIdentifier:identifier];
             if (!cell) {
                 cell = [[[UINib nibWithNibName:@"policyTableViewCell" bundle:nil]instantiateWithOwner:self options:nil]lastObject];
             }
        cell.backgroundColor = colorH(248, 250, 251);
         cell.selectionStyle = UITableViewCellSelectionStyleNone;
         knowledgeListModel * model =  self->_knowledgeListArr[indexPath.row];
         [cell.imageV sd_setImageWithURL:[NSURL URLWithString:model.pic]];
         cell.titleL.text = model.title;
         cell.textL.text = model.albumPics;
         cell.viewsL.text = [NSString stringWithFormat:@"%@ views", model.viewNum];
         cell.timeL.text = model.pubTime;
              return cell;
         }selectedCell:^(NSIndexPath *indexPath) {
             knowledgeListModel * model = self.knowledgeListArr[indexPath.row];
             knowledgeDetailViewController *detailVC = [[knowledgeDetailViewController alloc] init];
             detailVC.myId =model.myId;
             detailVC.titleStr = @"技术小文摘";
             [self.navigationController pushViewController:detailVC animated:YES];
         } moreButtonClick:^(UIButton * _Nonnull button) {
             
         }];
 //    self.consultTableView.c
     self.TechnologyDigestView.backgroundColor = colorH(248, 250, 251);
     self.TechnologyDigestView.scrollEnabled = NO;
     self.TechnologyDigestView.separatorStyle = UITableViewCellSeparatorStyleNone;
      [self.homeScrollView addSubview:self.TechnologyDigestView];
     [self reloadScrollViewFrame:CGRectGetMaxY(self.TechnologyDigestView.frame)];
 
    [self createLastLabel];
}
-(void)createLastLabel{
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.TechnologyDigestView.frame)-10, ScreenWidth, 40)];
    label.text = @"~到底啦~";
    label.textColor = [UIColor colorWithRed:162/255.0 green:166/255.0 blue:172/255.0 alpha:1.0];
    label.font = [UIFont fontWithName:@"PingFang SC" size:12];
    label.textAlignment = NSTextAlignmentCenter;
    [self.homeScrollView addSubview:label];
    [self reloadScrollViewFrame:CGRectGetMaxY(label.frame)];
}
-(void)enterButtonMethod:(UIButton*)button{
    if (button.tag==10000)/*病虫害防治*/ {
        PestsAndDiseasesViewController * listVC = [[PestsAndDiseasesViewController alloc] init];
        [self.navigationController pushViewController:listVC animated:YES];
    }else if (button.tag==20000)/*化浪专家*/{
        
    }else if (button.tag==30000)/*课程*/{
        
    }else if (button.tag==40000)/*技术小文摘*/{
        knowledgeListViewController * listVc = [[knowledgeListViewController alloc] init];
        [self.navigationController pushViewController:listVc animated:YES];
    }
}
#pragma mark 刷新列表
-(void)reloadScrollViewFrame:(CGFloat)height{
    self.homeScrollView.contentSize= CGSizeMake(ScreenWidth, height) ;
}

@end
