//
//  carTableView.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/26.
//

#import "carTableView.h"
#import "carCellTableViewCell.h"
#import "cartListProductModel.h"
#import "cartProductModel.h"
@implementation carTableView
-(id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self==[super initWithFrame:frame style:UITableViewStyleGrouped]) {
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = [UIColor clearColor];
        self.rowHeight = 120;
        self.separatorStyle = 0;
        self.dataArray  = [[NSMutableArray alloc] init];
//        NSMutableArray* goodArr =[[NSMutableArray alloc] init];
//        for (int i=0; i<9; i++) {
//            [goodArr removeAllObjects];
//            carCellTextModel * model = [[carCellTextModel alloc] init];
//            for (int j=0; j<5; j++) {
//                carGoodsTextModel * model1 = [[carGoodsTextModel alloc] init];
//                model1.money=@"200";
//                [goodArr addObject:model1];
//            }
//            model.goodsArray = goodArr;
//            [self.dataArray addObject:model];
//        }
        
    }
    return self;
}
-(void)setDataArray:(NSMutableArray *)dataArray{
    _dataArray = dataArray;
    [self reloadData];
}
#pragma mark --- UITableViewDataSource & UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    cartListProductModel *model = [self.dataArray objectAtIndex:section];
    return model.productArr.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    carCellTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell = [[[UINib nibWithNibName:@"carCellTableViewCell" bundle:nil]instantiateWithOwner:self options:nil]lastObject];
    }
    cartListProductModel *model = [self.dataArray objectAtIndex:indexPath.section];
    cartProductModel * model1 = model.productArr[indexPath.row];
    cell.contentView.backgroundColor = [UIColor whiteColor];
    cell.selectButton.clipsToBounds = YES;
    cell.selectButton.layer.cornerRadius = 8;
    cell.selectButton.layer.borderWidth = 0.5;
//    button.backgroundColor = SelectColor;
    cell.selectButton.layer.borderColor = UIColorFromRGB(0xCCCCCC).CGColor;
    [cell.selectButton addTarget:self action:@selector(selectMethod:) forControlEvents:UIControlEventTouchUpInside];
    cell.selectButton.indexPath = indexPath;
    cell.titleL.text = model1.name;
    cell.typeNameL.text = model1.spec1;
    cell.moneyL.text = [NSString stringWithFormat:@"%@",model1.mallPrice];
    cell.countL.text = [NSString stringWithFormat:@"%@",model1.quantity];
    return cell;
}
-(void)selectMethod:(UIButton*)button{
 
    
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
       // 圆角角度
         CGFloat radius = 10.f;
         // 设置cell 背景色为透明
         cell.backgroundColor = UIColor.clearColor;
         // 创建两个layer
         CAShapeLayer *normalLayer = [[CAShapeLayer alloc] init];
         CAShapeLayer *selectLayer = [[CAShapeLayer alloc] init];
         // 获取显示区域大小
         CGRect bounds = CGRectInset(cell.bounds, 10, 0);
         // 获取每组行数
         NSInteger rowNum = [tableView numberOfRowsInSection:indexPath.section];
         // 贝塞尔曲线
         UIBezierPath *bezierPath = nil;
      if (rowNum == 1) {
          // 一组只有一行（四个角全部为圆角）
          bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds
                                             byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight
                                                   cornerRadii:CGSizeMake(radius, radius)];
      } else {
          if (indexPath.row == 0) {
              // 每组第一行（添加左上和右上的圆角）
//              bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds
//                                                 byRoundingCorners:(UIRectCornerBottomLeft|UIRectCornerBottomRight)
//                                                       cornerRadii:CGSizeMake(radius, radius)];
              
          } else if (indexPath.row == rowNum - 1) {
              // 每组最后一行（添加左下和右下的圆角）
              bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds
                                                 byRoundingCorners:(UIRectCornerBottomLeft|UIRectCornerBottomRight)
                                                       cornerRadii:CGSizeMake(radius, radius)];
          } else {
              // 每组不是首位的行不设置圆角
              bezierPath = [UIBezierPath bezierPathWithRect:bounds];
          }
      }
      // 把已经绘制好的贝塞尔曲线路径赋值给图层，然后图层根据path进行图像渲染render
      normalLayer.path = bezierPath.CGPath;
      selectLayer.path = bezierPath.CGPath;
      
      
      UIView *nomarBgView = [[UIView alloc] initWithFrame:bounds];
      // 设置填充颜色
      normalLayer.fillColor = [UIColor colorWithWhite:1 alpha:1.0].CGColor;
      // 添加图层到nomarBgView中
      [nomarBgView.layer insertSublayer:normalLayer atIndex:0];
      nomarBgView.backgroundColor = UIColor.clearColor;
      cell.backgroundView = nomarBgView;
      
}
 
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView * view =[[ UIView alloc] initWithFrame:CGRectMake(10, 0, ScreenWidth-20, 40)];
    view.backgroundColor = SelectColor;
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 48;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//
//    return 1;
//}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
     
}
 
@end
