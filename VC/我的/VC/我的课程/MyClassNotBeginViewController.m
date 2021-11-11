//
//  MyClassNotBeginViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/28.
//

#import "MyClassNotBeginViewController.h"
#import "CustomNewsTableView.h"
#import "MyClassTableViewCell.h"
@interface MyClassNotBeginViewController ()
@property(nonatomic,retain)CustomNewsTableView * classTableView;

@end

@implementation MyClassNotBeginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BackGroundColor;
    [self createClassListView];
    
}

-(void)createClassListView{
    __weak CustomNewsTableView * tb = self.classTableView;
   self.classTableView = [[CustomNewsTableView alloc]initWithFrame:CGRectMake(0, 16, ScreenWidth, ScreenHeight-55) headerHeight:0 style:UITableViewStylePlain rowCount:14 cellHeight:0.36*ScreenWidth cell:^UITableViewCell *(NSIndexPath *indexPath) {
           // 创建你自定义的cell
           static NSString *identifier = @"MyClassCell";
           MyClassTableViewCell *cell = [tb dequeueReusableCellWithIdentifier:identifier];
           if (!cell) {
               cell = [[[UINib nibWithNibName:@"MyClassTableViewCell" bundle:nil]instantiateWithOwner:self options:nil]lastObject];
           }
       cell.typeL.text = @"还未进行学习";
       cell.imageV.clipsToBounds = YES;
       cell.imageV.layer.cornerRadius = 10;
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
   [self.view addSubview:self.classTableView];
}

@end
