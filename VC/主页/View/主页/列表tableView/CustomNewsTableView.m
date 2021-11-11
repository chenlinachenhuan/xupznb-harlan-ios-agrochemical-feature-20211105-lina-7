//
//  CustomNewsTableView.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/8.
//

#import "CustomNewsTableView.h"
 
 
@implementation CustomNewsTableView

-(instancetype)initWithFrame:(CGRect)frame headerHeight:(CGFloat)headerHeight style:(UITableViewStyle)style rowCount:(NSInteger)rows cellHeight:(CGFloat)height cell:(CreateCell)cell selectedCell:(SelectCell)selectBlock moreButtonClick:(MoreButtonBlock)moreButtonBlock
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.backgroundColor = BackGroundColor;
        self.dataSource = self;
        self.delegate = self;
        self.rows = rows;
        self.height = height;
        self.createCell = cell;
         self.selectBlock = selectBlock;
        self.headerHeight = headerHeight;
        self.rowHeight = height;
        self.moreButtonBlock = moreButtonBlock;
    }
    return self;
}
-(void)setDataArr:(NSMutableArray *)dataArr{
    _dataArr=dataArr;
//    if (_dataArr.count<=4) {
//        _rows= _dataArr.count;
//        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, 0.177305*ScreenHeight*dataArr.count);
//    }else{
//        _rows=4;
//        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, 0.8218085*ScreenHeight);
//
//    }
//     
    [self reloadData];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = self.createCell(indexPath);
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.selectBlock(indexPath);
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _rows;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return _height;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (self.dataArr.count<=4  ) {
        return 0;
    }
    return self.headerHeight;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
     
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.headerHeight)];
//    view.backgroundColor = [UIColor redColor];
    [self addSubview:view];
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(self.frame.size.width/2-0.426666667*ScreenWidth*0.5, CGRectGetMaxY(view.frame)-0.2362205*CGRectGetHeight(view.frame)-0.426666667*ScreenWidth*0.1625, 0.426666667*ScreenWidth, 0.426666667*ScreenWidth*0.1625);
    [button setBackgroundColor:[UIColor colorWithRed:98/255.0 green:191/255.0 blue:180/255.0 alpha:1.0]];
    button.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size: 12];
    button.clipsToBounds = YES;
    button.layer.cornerRadius = 10;
    [button setTitle:@"查看更多" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(checkMoreMethod:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    
    return view;
}
 
-(void)checkMoreMethod:(UIButton*)button{
    self.moreButtonBlock(button);
}
@end
