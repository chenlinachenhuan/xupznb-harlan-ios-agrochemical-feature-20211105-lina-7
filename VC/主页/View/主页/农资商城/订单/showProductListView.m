//
//  showProductListView.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/4.
//

#import "showProductListView.h"
#import "orderProductListTableViewCell.h"
#import "goodsOrderModel.h"
@implementation showProductListView

-(id)initWithFrame:(CGRect)frame{
    if (self==[super initWithFrame:frame ]) {
        self.frame = frame;
        [self createCellView];
    }
    return self;
}
-(void)createCellView{
    self.shadowView = [[UIView alloc] initWithFrame:self.frame];
    self.shadowView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    [self addSubview:self.shadowView];
    UITapGestureRecognizer * rec = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMethod)];
    [self.shadowView addGestureRecognizer:rec];
    _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, ScreenWidth, 0.720982*ScreenHeight)];
    _bgView.backgroundColor = [UIColor whiteColor];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_bgView.bounds
                                                   byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(10, 10)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = _bgView.bounds;
    maskLayer.path = maskPath.CGPath;
    _bgView.layer.mask = maskLayer;
    [self addSubview:_bgView];
    [UIView animateWithDuration:0.5 animations:^{
        self->_bgView.frame = CGRectMake(0, self.frame.size.height-0.720982*ScreenHeight, ScreenWidth, 0.720982*ScreenHeight);
    }];
}
-(void)tapMethod{
    [UIView animateWithDuration:0.5 animations:^{
        self->_bgView.frame = CGRectMake(0, self.frame.size.height, ScreenWidth, 0.720982*ScreenHeight);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        
    }];
    
}
-(void)setListArr:(NSMutableArray *)listArr{
    _listArr = listArr;
    [self createTableView];
}
-(void)createTableView{
    self.myTab = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, self.bgView.frame.size.height) style:UITableViewStyleGrouped];
    self.myTab.delegate = self;
    self.myTab.dataSource = self;
    self.myTab.rowHeight=122;
    self.myTab.showsVerticalScrollIndicator = NO;
//    self.myTab.scrollEnabled = NO;
    self.myTab.separatorStyle = 0;
    [self.bgView addSubview:self.myTab];
    self.myTab.backgroundColor = [UIColor clearColor];
//    self.myTab.userInteractionEnabled=NO;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listArr.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    orderProductListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell = [[[UINib nibWithNibName:@"orderProductListTableViewCell" bundle:nil] instantiateWithOwner:self options:nil] lastObject];
    }
    cell.selectionStyle =0;
    goodsOrderModel * model = self.listArr[indexPath.row];
    [cell.cellImageV sd_setImageWithURL:[NSURL URLWithString:model.pic]];
    cell.titleL.text = model.name;
    cell.typeNameL.text = model.spec1Val;
    cell.moneyL.text = [NSString stringWithFormat:@"%@",model.mallPrice];
    cell.countL.text = [NSString stringWithFormat:@"x%@",model.quantity];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(16.5, 20, [commonMethod widthAuto:@"商品清单" fontSize:17 contentheight:16]+10, 16)];
    label.text = @"商品清单";
    label.textColor = UIColorFromRGB(0x333333);
    label.font = [UIFont fontWithName:@"PingFangSC-Medium" size:17];
    [view addSubview:label];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame =CGRectMake(ScreenWidth-16.5-14, label.center.y-7, 14, 14);
    [button setBackgroundImage:[UIImage imageNamed:@"关闭灰色"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(tapMethod) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    
    UILabel * countL = [[UILabel alloc] initWithFrame:CGRectMake(button.frame.origin.x-14.5-[commonMethod widthAuto:[NSString stringWithFormat:@"共%lu件",(unsigned long)self.listArr.count] fontSize:14 contentheight:14], button.center.y-7, [commonMethod widthAuto:[NSString stringWithFormat:@"共%lu件",(unsigned long)self.listArr.count] fontSize:14 contentheight:14], 14)];
    countL.text =[NSString stringWithFormat:@"共%lu件",(unsigned long)self.listArr.count];
    countL.textColor = UIColorFromRGB(0x333333);
    countL.font = FontSize(14);
    [view addSubview:countL];
    return view;
}
@end
