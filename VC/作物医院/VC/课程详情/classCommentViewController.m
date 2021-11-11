//
//  classCommentViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/27.
//

#import "classCommentViewController.h"
#import "classCommentCellView.h"
#import "classDetailIntroduceModel.h"
#import "classDetailDataModel.h"
#import "classCommentModel.h"
#import "classCommentDataModel.h"
@interface classCommentViewController ()
@property(nonatomic,retain)classCommentCellView * commentCellView;
@property(nonatomic,retain)NSMutableArray * dataModelArr;

@end

@implementation classCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.dataModelArr = [[NSMutableArray alloc] init];
//    self.commentCellView = [[classCommentCellView alloc] init];
//    classDetailDataModel *momentFrame = [[classDetailDataModel alloc] init];
//    momentFrame.model = [[classDetailIntroduceModel alloc] initWithData:[[NSDictionary alloc]init]];
//    for (classCommentModel * model in momentFrame.model.commentArr) {
//        classCommentDataModel * commentModel = [[classCommentDataModel alloc] init];
//        commentModel.commentModel = model;
//        [self.dataModelArr addObject:commentModel];
//    }
//    self.commentCellView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight-0.56*ScreenWidth-49);
//    [self.commentCellView createCellView:self.dataModelArr];
//
//    [self.view addSubview:self.commentCellView];
  
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
