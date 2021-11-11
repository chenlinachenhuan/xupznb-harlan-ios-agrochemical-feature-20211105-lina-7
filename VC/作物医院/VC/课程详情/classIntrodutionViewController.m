//
//  classIntrodutionViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/27.
//

#import "classIntrodutionViewController.h"
#import "classDetailCellView.h"
#import "classDetailDataModel.h"
#import "classItemParser.h"
 @interface classIntrodutionViewController ()<UIScrollViewDelegate,classDetailCellViewDelegate,UIGestureRecognizerDelegate,classItemParserDelegate>
@property(nonatomic,retain)classDetailCellView * cellView;
@property(nonatomic,retain)UIScrollView * homeScrollView;
@property(nonatomic,retain)classDetailIntroduceModel *model;

@end

@implementation classIntrodutionViewController
 
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BackGroundColor;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    [self createScrollView];
    [self createCellView];
    
}

-(void)createScrollView{
   
    self.homeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 1, ScreenWidth, ScreenHeight-ScreenWidth*0.56-49-10)];
    self.homeScrollView.delegate = self;
    self.homeScrollView.contentSize = CGSizeMake(ScreenWidth, 1000);
    self.homeScrollView.showsVerticalScrollIndicator = NO;
    
    self.homeScrollView.userInteractionEnabled = YES;
//    [self.view addSubview:self.homeScrollView];
    [self.view addSubview:self.homeScrollView];
}
-(void)createCellView{
    self.cellView = [[classDetailCellView alloc] init];
    classDetailDataModel *momentFrame = [[classDetailDataModel alloc] init];
    momentFrame.model = self.textModel;
    self.cellView.delegate = self;
    self.cellView.frame = CGRectMake(0, 0, ScreenWidth, momentFrame.cellHeight);
    [self.homeScrollView addSubview:self.cellView];
    [self.cellView createCellView:momentFrame];
    [self reloadScrollViewFrame:momentFrame.cellHeight+40];
 }
-(void)tapLabelAction:(classDetailDataModel*)model{
    
    self.cellView.frame = CGRectMake(0, 0, ScreenWidth, model.cellHeight);
    [self reloadScrollViewFrame:model.cellHeight+40];

}
#pragma mark 刷新列表
-(void)reloadScrollViewFrame:(CGFloat)height{
    self.homeScrollView.contentSize= CGSizeMake(ScreenWidth, height) ;
}
@end
