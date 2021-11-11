//
//  collectionClassViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/27.
//

#import "collectionClassViewController.h"
#import "CustomNewsTableView.h"
#import "ClassificationOneTableViewCell.h"
@interface collectionClassViewController ()<UIGestureRecognizerDelegate>
@property(nonatomic,retain)CustomNewsTableView * classTableView;

@end

@implementation collectionClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BackGroundColor;
    [self createClassListView];
 
}
-(void)createClassListView{
    __weak CustomNewsTableView * tb = self.classTableView;
   self.classTableView = [[CustomNewsTableView alloc]initWithFrame:CGRectMake(0, 16.5, ScreenWidth, ScreenHeight-50) headerHeight:0 style:UITableViewStylePlain rowCount:14 cellHeight:131 cell:^UITableViewCell *(NSIndexPath *indexPath) {
           // 创建你自定义的cell
           static NSString *identifier = @"ClassificationTwoCell";
           ClassificationOneTableViewCell *cell = [tb dequeueReusableCellWithIdentifier:identifier];
           if (!cell) {
               cell = [[[UINib nibWithNibName:@"ClassificationOneTableViewCell" bundle:nil]instantiateWithOwner:self options:nil]lastObject];
           }
       
       cell.selectionStyle = UITableViewCellSelectionStyleNone;

           return cell;
       }selectedCell:^(NSIndexPath *indexPath) {
           //点击cell执行此方法
           NSLog(@"网%ld",indexPath.row);
       } moreButtonClick:^(UIButton * _Nonnull button) {
           
       }];
    self.classTableView.showsVerticalScrollIndicator = NO;
    self.classTableView.clipsToBounds = YES;
    self.classTableView.layer.cornerRadius =10;
   self.classTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.classTableView.scrollEnabled = NO;
   [self.view addSubview:self.classTableView];
}
@end
