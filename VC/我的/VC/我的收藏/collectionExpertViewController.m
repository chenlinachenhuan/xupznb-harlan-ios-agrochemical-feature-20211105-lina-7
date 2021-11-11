//
//  collectionExpertViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/27.
//

#import "collectionExpertViewController.h"
#import "collectionExpertTableViewCell.h"
#import "CustomNewsTableView.h"
@interface collectionExpertViewController ()
@property(nonatomic,retain)CustomNewsTableView * expertTableView;

@end

@implementation collectionExpertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BackGroundColor;
    [self createClassListView];
}
-(void)createClassListView{
    __weak CustomNewsTableView * tb = self.expertTableView;
   self.expertTableView = [[CustomNewsTableView alloc]initWithFrame:CGRectMake(0, 16.5, ScreenWidth, ScreenHeight-60) headerHeight:0 style:UITableViewStylePlain rowCount:14 cellHeight:ScreenWidth*0.282666667 cell:^UITableViewCell *(NSIndexPath *indexPath) {
           // 创建你自定义的cell
           static NSString *identifier = @"expertCell";
           collectionExpertTableViewCell *cell = [tb dequeueReusableCellWithIdentifier:identifier];
           if (!cell) {
               cell = [[[UINib nibWithNibName:@"collectionExpertTableViewCell" bundle:nil]instantiateWithOwner:self options:nil]lastObject];
           }
       
       cell.selectionStyle = UITableViewCellSelectionStyleNone;
       NSLog(@"%f",cell.imageV.frame.size.width);
       cell.imageV.clipsToBounds = YES;
       cell.imageV.layer.cornerRadius =(ScreenWidth*0.282666667-32)/2;
           return cell;
       }selectedCell:^(NSIndexPath *indexPath) {
           //点击cell执行此方法
           NSLog(@"网%ld",indexPath.row);
       } moreButtonClick:^(UIButton * _Nonnull button) {
           
       }];
    self.expertTableView.showsVerticalScrollIndicator = NO;
    self.expertTableView.clipsToBounds = YES;
    self.expertTableView.layer.cornerRadius =10;
   self.expertTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.classTableView.scrollEnabled = NO;
   [self.view addSubview:self.expertTableView];
}

@end
