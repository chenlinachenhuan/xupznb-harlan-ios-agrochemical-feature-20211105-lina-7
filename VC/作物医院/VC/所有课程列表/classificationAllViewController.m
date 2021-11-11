//
//  classificationAllViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/27.
//

#import "classificationAllViewController.h"
#import "CustomVerticallyCollectionView.h"
#import "VerticalCollectionViewCell.h"
#import "classDetailViewController.h"
@interface classificationAllViewController ()<UIGestureRecognizerDelegate,UIScrollViewDelegate>
@property(nonatomic,retain)UIScrollView *homeScrollView;
@property(nonatomic,retain)CustomVerticallyCollectionView *allClassView;

@end

@implementation classificationAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BackGroundColor;
    [self createNaviView];
    [self createScrollView];
    [self createAllClassView];
}
-(void)createNaviView{
    bigButton *backButton = [bigButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 44, 44);
    [backButton addTarget:self action:@selector(backButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [backButton setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
     UIBarButtonItem * leftB = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = leftB;
   
    UILabel * title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100,navBarHeight)];
    title.text = @"分类标题";
    title.font = [UIFont fontWithName:@"PingFang SC" size: 17];
    title.numberOfLines = 0;
    title.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView=title ;
    
    UIButton * classificationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    classificationButton.frame = CGRectMake(ScreenWidth-16-17, 0, 17, 17);
    [classificationButton setBackgroundImage:[UIImage imageNamed:@"菜单"] forState:UIControlStateNormal];
    [classificationButton addTarget:self action:@selector(classificationButtonMethod) forControlEvents:UIControlEventTouchUpInside];
     UIBarButtonItem * rightB = [[UIBarButtonItem alloc] initWithCustomView:classificationButton];
    self.navigationItem.rightBarButtonItem = rightB;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;

}
#pragma mark 返回
-(void)backButtonMethod{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark 分类按钮
-(void)classificationButtonMethod{
    
}
-(void)createScrollView{
   
    self.homeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, TopHeight, ScreenWidth, ScreenHeight)];
    self.homeScrollView.delegate = self;
    self.homeScrollView.contentSize = CGSizeMake(ScreenWidth, 1000);
    self.homeScrollView.showsVerticalScrollIndicator = NO;
    self.homeScrollView.userInteractionEnabled = YES;
//    [self.view addSubview:self.homeScrollView];
    [self.view addSubview:self.homeScrollView];
}
#pragma mark 所有课程
-(void)createAllClassView{
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    self.allClassView = [[CustomVerticallyCollectionView alloc] initWithFrame:CGRectMake(homeSpacing, 20, ScreenWidth-2*homeSpacing, (ScreenWidth-32-11)/2*1.22891566*3+11*2) collectionViewLayout:flow];
    self.allClassView.scrollEnabled = NO;
    self.allClassView.showsVerticalScrollIndicator = NO;
    [self.allClassView registerNib:[UINib nibWithNibName:NSStringFromClass([VerticalCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"popularClass"];
    [self.allClassView items:6 withRowHeight:(ScreenWidth-32-11)/2*1.22891566 withRowWidth:(ScreenWidth-32-11)/2 withSpacing:11 isShowFooter:NO cellIdentify:@"popularClass" selectedCell:^(NSIndexPath * _Nonnull indexPath) {
        classDetailViewController * class = [[classDetailViewController alloc] init];
        [self.navigationController pushViewController:class animated:YES];
    } moreButtonBlock:^(UIButton * _Nonnull button) {
        
    }];
    [self.homeScrollView addSubview:self.allClassView];
    [self reloadScrollViewFrame:CGRectGetMaxY(self.allClassView.frame)];
}
#pragma mark 刷新列表
-(void)reloadScrollViewFrame:(CGFloat)height{
    self.homeScrollView.contentSize= CGSizeMake(ScreenWidth, height+30) ;
}
@end
