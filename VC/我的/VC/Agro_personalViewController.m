//
//  Agro_personalViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/6.
//

#import "Agro_personalViewController.h"
#import "PersonalTableViewCell.h"
#import "collectionViewController.h"
#import "MyClassViewController.h"
#import "addressViewController.h"
@interface Agro_personalViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain)UIScrollView *homeScrollView;
@property(nonatomic,retain)UIView *naviView;
@property(nonatomic,retain)UITableView * myTableView;
@property(nonatomic,retain)NSMutableArray * imageArr;
@property(nonatomic,retain)NSMutableArray * titleArr;

@end

@implementation Agro_personalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor colorWithRed:248/255.0 green:250/255.0 blue:251/255.0 alpha:1.0];
    _titleArr = [NSMutableArray arrayWithObjects:@"农事记录",@"我的方案",@"我的订单",@"我的课程",@"关注收藏",@"收货地址",@"设置",@"关于我们", nil];
    [self createScrollView];
    [self createNaviView];
    [self createTableView];
} 
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;

}
-(void)createScrollView{
    
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];//隐藏导航栏底部线条
    self.homeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, TopHeight, ScreenWidth, ScreenHeight)];
    self.homeScrollView.delegate = self;
    self.homeScrollView.contentSize = CGSizeMake(ScreenWidth, 1000);
    self.homeScrollView.showsVerticalScrollIndicator = NO;
    self.homeScrollView.userInteractionEnabled = YES;
    [self.view addSubview:self.homeScrollView];
//    [self.tabBarController.view addSubview:self.homeScrollView];
}
-(void)createNaviView{
 
    UILabel * title = [[UILabel alloc] initWithFrame:CGRectMake(16.5, 0, ScreenWidth,navBarHeight)];
    title.text = @"  我的信息";
    title.font = [UIFont fontWithName:@"PingFang SC" size: 17];
    title.numberOfLines = 0;
//    title.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView=title ;

    UIButton * dateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    dateButton.frame = CGRectMake(ScreenWidth-15.5-22.5, title.center.y-11, 22.5, 22);
    [dateButton addTarget:self action:@selector(dateButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [dateButton setImage:[UIImage imageNamed:@"签到"] forState:UIControlStateNormal];
    UIBarButtonItem * barB = [[UIBarButtonItem alloc] initWithCustomView:dateButton];
    self.navigationItem.rightBarButtonItem = barB;
 }
 
 
- (void)selectCellWithItem:(NSInteger)index {
 
}
 
-(void)dateButtonMethod{
    
}
-(void)createTableView{
    
    self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 1, ScreenWidth, 0.952128*ScreenHeight) style:UITableViewStylePlain];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.showsVerticalScrollIndicator=NO;
//    self.myTableView.rowHeight = ScreenHeight * 0.22695;
    [self.homeScrollView addSubview:self.myTableView];
    [self reloadScrollViewFrame:CGRectGetMaxY(self.myTableView.frame)];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return ScreenHeight * 0.22695;
    }
    return 52;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==3) {
        return 4;
    }
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section>0) {
        return 9;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 9)];
    view.backgroundColor = [UIColor colorWithRed:248/255.0 green:250/255.0 blue:251/255.0 alpha:1.0];
    return view;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PersonalTableViewCell *cell;
    if (indexPath.section==0) {
        static NSString *identifier = @"headerCell";
        cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[[UINib nibWithNibName:@"PersonalTableViewCell" bundle:nil]instantiateWithOwner:self options:nil]firstObject];
        }
        cell.headImageV.clipsToBounds = YES;
        cell.headImageV.layer.cornerRadius = cell.headImageV.frame.size.width/2;
    }else{
        static NSString *identifier = @"tableCell";
        cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[[UINib nibWithNibName:@"PersonalTableViewCell" bundle:nil]instantiateWithOwner:self options:nil]lastObject];
        }
        if (indexPath.section<4) {
            cell.imageV.image = [UIImage imageNamed:_titleArr[indexPath.row+indexPath.section-1]];
            cell.titleL.text = _titleArr[indexPath.row+indexPath.section-1];
        }else{
            cell.imageV.image = [UIImage imageNamed:_titleArr[indexPath.row+indexPath.section+2]];
            cell.titleL.text = _titleArr[indexPath.row+indexPath.section+2];
        }
        
        cell.recordL.hidden = YES;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    self.myTableView.frame = CGRectMake(0, 1, ScreenWidth, 52*7+5*9+ScreenHeight * 0.22695);
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        
    }else if (indexPath.section==1){
        
    }else if (indexPath.section==2){
        
    }else if (indexPath.section==3){
        if (indexPath.row==0) {
            
        }else if (indexPath.row==1) {
            MyClassViewController * myClass = [[MyClassViewController alloc] init];
            [self.navigationController pushViewController:myClass animated:YES];
        }else if (indexPath.row==2){
            collectionViewController * collection = [[collectionViewController alloc] init];
            [self.navigationController pushViewController:collection animated:YES];
        }else{
            addressViewController * address = [[addressViewController alloc] init];
            [self.navigationController pushViewController:address animated:YES];
        }
    }else if (indexPath.section==4){
        
    }else if (indexPath.section==5){
        
    } }
#pragma mark 刷新列表
-(void)reloadScrollViewFrame:(CGFloat)height{
    self.homeScrollView.contentSize= CGSizeMake(ScreenWidth, height) ;
}
@end
