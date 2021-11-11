//
//  trendDetailCommentTableView.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/26.
//

#import "trendDetailCommentTableView.h"
@implementation trendDetailCommentTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.frame = frame;
    }
    return self;
}
 
 
-(void)setCommentArr:(NSMutableArray *)commentArr{
    _commentArr = commentArr;
    [self creatCell];
    [self reloadData];
}
-(void)creatCell{
    CGFloat height =0;
    for (trendCommentDataModel * model in self.commentArr) {
        height = height+model.commentCellHeight;
    }
    
    self.frame =CGRectMake(0,self.frame.origin.y, ScreenWidth, height);
    self.dataSource = self;
    self.delegate = self;
    self.scrollEnabled = NO;
    self.showsVerticalScrollIndicator = NO;
    self.tableHeaderView = [[UIView alloc] initWithFrame:CGRectZero];
    self.backgroundColor = BackGroundColor;
    self.commentTwoArr = [[NSMutableArray alloc] init];
    dic = [NSMutableDictionary dictionary];
    self.estimatedRowHeight = 0;//预估计高度
    [self reloadData];
    [self reloadTableViewHeight];

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    commentTwoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
    cell = [[commentTwoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    trendCommentDataModel * dModel = _commentArr[indexPath.section];
    trendCommentTwoFrameModel * model = dModel.commentTwoArr[indexPath.row];
    cell.textL.frame = model.nameAndTextFrame;
    cell.textL.text = [NSString stringWithFormat:@"%@ %@",model.model.nameStr,model.model.textStr];
    NSMutableAttributedString * aStr = [[NSMutableAttributedString alloc] initWithString:cell.textL.text];
    [aStr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, model.model.nameStr.length)];
    cell.textL.attributedText = aStr;
//    [cell.textL sizeThatFits:cell.textL.frame.size];
    cell.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = 0;
    self.separatorStyle = 0;
//    cell.textL.backgroundColor = SelectColor;
    return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return _commentArr.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.selectBlock(indexPath);
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    trendCommentDataModel * dModel = _commentArr[section];
    NSString *string = [NSString stringWithFormat:@"%ld",section];
    if ([dic[string] integerValue] == 1 ) {  //打开cell返回数组的count
        return dModel.commentTwoArr.count;
    }else{
        return 0;
    }

 }
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    trendCommentDataModel * dModel = _commentArr[indexPath.section];
    trendCommentTwoFrameModel * model = dModel.commentTwoArr[indexPath.row];
    return model.cellHeight;
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    trendCommentDataModel * model = _commentArr[section];
    return model.commentCellHeight;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    trendCommentDataModel * model = self.commentArr[section];

    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width,  model.commentCellHeight)];
    view.backgroundColor = [UIColor whiteColor];
    [self addSubview:view];
    UILabel * linL = [[UILabel alloc] init];
    linL.frame = CGRectMake(16, 0, ScreenWidth-32, 0.5);
    linL.backgroundColor = UIColorFromRGB(0xDADDE1);
    [view addSubview:linL];
    // 头像
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.frame = model.commentHeadImageFrame;
    iconView.contentMode = 2;
    [iconView sd_setImageWithURL:[NSURL URLWithString:model.model.avatar]];
    iconView.clipsToBounds = YES;
    iconView.layer.cornerRadius = iconView.frame.size.width/2;
    [view addSubview:iconView];
     
    
    // 昵称
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.frame = model.commentNameFrame;
    nameLabel.text = model.model.nameStr;
    [view addSubview:nameLabel];
    nameLabel.font = circleCellNameFont;
    // 时间
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.font = FontSize(10);
    timeLabel.frame = model.commentDateFrame;
    timeLabel.text = model.model.timeStr;
    timeLabel.textColor = [UIColor colorWithRed:162/255.0 green:166/255.0 blue:172/255.0 alpha:1.0];
    [view addSubview:timeLabel];
    
    // 文本
    UILabel *textL = [[UILabel alloc] init];
    textL.font = FontSize(14);
    textL.frame = model.commentTextFrame;
    textL.text = model.model.textStr;
    textL.numberOfLines=0;
//    textL.textColor = [UIColor colorWithRed:162/255.0 green:166/255.0 blue:172/255.0 alpha:1.0];
    [view addSubview:textL];
    
    UIButton * commentButton = [[UIButton alloc] init];
    [commentButton setBackgroundImage:[UIImage imageNamed:@"评论"] forState:UIControlStateNormal];
    commentButton.tag = section;
    [commentButton addTarget:self action:@selector(commentButtonMethod:) forControlEvents:UIControlEventTouchUpInside];
     [view addSubview:commentButton];
    commentButton.frame = model.commentButtonFrame;
    
    UIButton * reportButton = [[UIButton alloc] init];
    [reportButton setBackgroundImage:[UIImage imageNamed:@"举报"] forState:UIControlStateNormal];
    reportButton.frame = model.reportButtonFrame;
    [view addSubview:reportButton];
    
//    // 时间
//    UILabel *commentTextL = [[UILabel alloc] init];
//    commentTextL.font = circleCellTextFont;
//    commentTextL.frame = _momentFrames.detailCommentTextFrame;
//    commentTextL.textColor = [UIColor blackColor];
//    commentTextL.numberOfLines=0;
//    commentTextL.text = _momentFrames.moment.textStr;
//    [view addSubview:commentTextL];
    if (model.commentTwoArr.count!=0) {
        model.showCommentB = [[showCommentButton alloc] init];
        [model.showCommentB setTitleColor:SelectColor forState:UIControlStateNormal];
        model.showCommentB.titleLabel.font = FontSize(12);
        [model.showCommentB addTarget:self action:@selector(showCommentButtonMethod:) forControlEvents:UIControlEventTouchUpInside];
        model.showCommentB.frame = model.moreButtonFrame;
        model.showCommentB.tag = section;
        [view addSubview:model.showCommentB];
        NSString *str = [NSString stringWithFormat:@"%ld",section ];
        if ([dic[str] integerValue] == 1) {
            [model.showCommentB setTitle:@"收起回复" forState:UIControlStateNormal];
        }else{//反之关闭cell
            [model.showCommentB setTitle:@"展开回复" forState:UIControlStateNormal];
        }
    }
    
     return view;
}

-(void)commentButtonMethod:(UIButton*)button{
    [self.commentDelegate didselectcommentButton:200+button.tag];
}
-(void)showCommentButtonMethod:(showCommentButton*)button{
    NSString *str = [NSString stringWithFormat:@"%ld",button.tag ];
    if ([dic[str] integerValue] == 0) {//如果是0，就把1赋给字典,打开cell
        [dic setObject:@"1" forKey:str];
    }else{//反之关闭cell
        [dic setObject:@"0" forKey:str];
    }
    [self reloadSections:[NSIndexSet indexSetWithIndex:button.tag]withRowAnimation:UITableViewRowAnimationFade];//有动画的刷新
    [self reloadTableViewHeight];
}
 
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 40;
//}
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//
//    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
//    view.backgroundColor = [UIColor whiteColor];
//    [self addSubview:view];
//    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(18, 0, 100, 40);
//    [button setTitleColor:UIColorFromRGB(0x62BFB4) forState:UIControlStateNormal];
//    button.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size: 12];
//    button.tag = section;
//    button.titleLabel.textAlignment = NSTextAlignmentLeft;
//    [button setTitle:@"加载更多" forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(checkMoreMethod:) forControlEvents:UIControlEventTouchUpInside];
//    [view addSubview:button];
//    
//    return view;
//
//}
-(void)checkMoreMethod:(UIButton*)button{
    
}
-(void)reloadTableViewHeight{
    [self layoutIfNeeded];
    CGFloat height = self.contentSize.height;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadFrame" object:nil userInfo:@{@"height":[NSNumber numberWithFloat:height]}];
}
@end
