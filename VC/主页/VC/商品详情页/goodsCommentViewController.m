//
//  goodsCommentViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/12.
//

#import "goodsCommentViewController.h"
#import "goodsCellThreeFrameModel.h"
#import "goodsDetailCommentModel.h"
#import "goodsCommentTableView.h"
@interface goodsCommentViewController ()<UIScrollViewDelegate>
@property(nonatomic,retain)goodsCommentTableView * commentTableView;
@property(nonatomic,retain)UIScrollView *homeScrollView;

@end

@implementation goodsCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createScrollView];
    [self createCommentView];
}
-(void)createScrollView{
   
    self.homeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    self.homeScrollView.delegate = self;
    self.homeScrollView.contentSize = CGSizeMake(ScreenWidth, 1000);
    self.homeScrollView.showsVerticalScrollIndicator = NO;
    self.homeScrollView.userInteractionEnabled = YES;
//    [self.view addSubview:self.homeScrollView];
    [self.view addSubview:self.homeScrollView];
}
-(void)createCommentView{
    goodsCellThreeFrameModel * threeModel = [[goodsCellThreeFrameModel alloc] init];
    threeModel.dModel = [[goodsDetailModel alloc] initWithData:[[NSDictionary alloc]init]];
    NSMutableArray * commentArr = [[NSMutableArray alloc] init];
    CGFloat height = 0;
    for (goodsDetailCommentModel * textModel in threeModel.dModel.goodsCommentArr) {
        threeModel.textModel = textModel;
        [threeModel setCellThreeFrames:textModel];
        [commentArr addObject:threeModel];
        height = height + threeModel.cellHeight;
    }
     self.commentTableView = [[goodsCommentTableView alloc] initWithFrame:CGRectMake(10 ,0, ScreenWidth-20, height+51) style:UITableViewStylePlain dataArr:commentArr showCount:0];
    [self.homeScrollView addSubview:self.commentTableView];
    [self reloadScrollViewFrame:CGRectGetMaxY(self.commentTableView.frame)];

}
-(void)reloadScrollViewFrame:(CGFloat)height{
    self.homeScrollView.contentSize= CGSizeMake(ScreenWidth, height+45+11.5) ;
}
@end
