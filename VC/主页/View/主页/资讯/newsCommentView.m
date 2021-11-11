//
//  newsCommentView.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/18.
//

#import "newsCommentView.h"

@implementation newsCommentView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        self.scrollEnabled = NO;
        self.showsVerticalScrollIndicator = NO;
        self.backgroundColor = BackGroundColor;
        self.commentArr = [[NSMutableArray alloc] init];
         self.estimatedRowHeight = 0;//预估计高度
        self.separatorStyle = 0;
    }
    return self;
}
-(void)commentArr:(NSMutableArray*)arr  cell:(CreateCell)cell selectedCell:(SelectCell)selectBlock{
    self.createCell = cell;
     self.selectBlock = selectBlock;
    self.commentArr = arr;
    NSLog(@"%f",self.contentSize.height);
 
}
 
 
 

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     
     
    return self.createCell(indexPath);
}
 
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.selectBlock(indexPath);
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.commentArr.count;
 }
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    newsCommentFrameModel * model = self.commentArr[indexPath.row];
    return model.commentCellHeight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    view.backgroundColor = [UIColor whiteColor];
    UILabel * titleL = [[UILabel alloc] initWithFrame:CGRectMake(16.5, 0, ScreenWidth, 40)];
    titleL.text = @"最新评论";
    titleL.textColor = CommonColor;
    titleL.font = FontSize(15);
    [view addSubview:titleL];
    
    UILabel * lineL = [[UILabel alloc] initWithFrame:CGRectMake(16.5, CGRectGetMaxY(titleL.frame)-0.5, ScreenWidth-33, 0.5)];
    lineL.backgroundColor = UIColorFromRGB(0xDADDE1);
    [view addSubview:lineL];
    return view;
}
-(void)commentButtonMethod{
    
}
-(void)reloadDataMethod{
    [self reloadData];
}
 
-(void)reloadTableViewHeight{
    [self layoutIfNeeded];
    CGFloat height = self.contentSize.height;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadFrame" object:nil userInfo:@{@"height":[NSNumber numberWithFloat:height]}];
}

@end
