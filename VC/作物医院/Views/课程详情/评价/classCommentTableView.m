//
//  classCommentTableView.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/28.
//

#import "classCommentTableView.h"
#import "classCommentTableViewCell.h"
@implementation classCommentTableView

-(instancetype)initWithFrame:(CGRect)frame headerHeight:(CGFloat)headerHeight style:(UITableViewStyle)style rowCount:(NSInteger)rows cellHeight:(CGFloat)height dataArr:(NSMutableArray*)dataArr
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.backgroundColor = BackGroundColor;
        self.showsVerticalScrollIndicator = NO;
        self.dataSource = self;
        self.delegate = self;
        self.rows = rows;
        self.height = height;
        self.headerHeight = headerHeight;
        self.dataArr = dataArr;
    }
    return self;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    classCommentTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell =  [[classCommentTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
         
    }
    tableView.separatorStyle = NO;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = BackGroundColor;
    classCommentDataModel * model =self.dataArr[indexPath.row];
    cell.imageV.frame = model.commentHeadImageFrame;
    cell.imageV.image = model.commentModel.headImage;
    cell.textL.frame = model.commentTextFrame;
    NSLog(@"%f",cell.textL.frame.size.height);
    cell.textL.text = model.commentModel.textStr;
    cell.nameL.frame = model.commentNameFrame;
    cell.nameL.text = model.commentModel.nameStr;
    cell.dateL.frame = model.commentDateFrame;
    cell.dateL.text = model.commentModel.dateStr;
    cell.lineV.frame = CGRectMake(16, model.commentCellHeight-0.5, ScreenWidth-32, 0.5);
    cell.StarV.frame = model.commentScoreFrame;
    [self addStarView:cell.StarV withModel:model];
    return cell;
}
-(void)addStarView:(UIView*)starView withModel:(classCommentDataModel*)model{
    NSInteger fullStars =[model.commentModel.scoreStr floatValue]*10/10;
    NSInteger halfStars = [model.commentModel.scoreStr floatValue]*10;
    BOOL halfStar = halfStars%10 !=0?YES:NO;
    for (int i=0; i<5; i++) {
        UIImageView * imageV = [[UIImageView alloc] initWithFrame:CGRectMake(19*i, 0, 15, 15)];
        imageV.tag = 10000+i;
        imageV.image = [UIImage imageNamed:@"空星"];
        [starView addSubview:imageV];
        if (i<fullStars) {
            imageV.image = [UIImage imageNamed:@"全星"];
        }else if (i==fullStars&&halfStar==YES){
            imageV.image = [UIImage imageNamed:@"半星"];

        }
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _rows;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    classCommentDataModel * model =self.dataArr[indexPath.row];
    return  model.commentCellHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return self.headerHeight;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.headerHeight)];
//    view.backgroundColor = [UIColor redColor];
    [self addSubview:view];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(16.5, 0, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame))];
    label.text = [NSString stringWithFormat:@"评论详情（%lu个人评价）",(unsigned long)self.dataArr.count];
    label.textColor = CommonColor;
    label.font = FontSize(15);
    [view addSubview:label];
    
    UIView * lineV = [[UIView alloc] initWithFrame:CGRectMake(16, view.frame.size.height-0.5, ScreenWidth-32, 0.5)];
    lineV.backgroundColor =  [UIColor colorWithRed:218/255.0 green:221/255.0 blue:225/255.0 alpha:1.0];
    [view addSubview:lineV];
    return view;
}

@end
