//
//  commentTableView.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/23.
//

#import "commentTableView.h"
#import "commentTableViewCell.h"
#import "trendListCommentModel.h"
@implementation commentTableView

-(id)init{
    if (self=[super init]) {
        self.delegate = self;
        self.dataSource = self;
        self.scrollEnabled = NO;
        
//         self.backgroundColor = [UIColor orangeColor];
    }
    return self;
}
-(void)CommentArr:(NSMutableArray *)arr{
    self.commontArr =arr;
    [self reloadData];
}
 
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    commentTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"] ;
    if (cell==nil) {
        cell = [[commentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    trendListCommentModel * model = self.commontArr[indexPath.row];
    cell.contentView.userInteractionEnabled = YES;
    cell.nameL.frame = CGRectMake(0, 0, [commonMethod widthAuto:model.nickname fontSize:12 contentheight:20], 20);
    cell.nameL.text = model.nickname;
    cell.textL.frame = CGRectMake(CGRectGetMaxX(cell.nameL.frame)+12, 0, self.frame.size.width-CGRectGetMaxX(cell.nameL.frame)-28-16, 20);
    cell.textL.text = model.content;
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor blackColor];
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = 0;
    return cell;
}
 
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.commontArr.count>=3) {
        [_commentDelegate didselectCell:self.tag];

    }
 }
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.commontArr.count>3) {
        return 3;
    }
    return self.commontArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 20;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (self.commontArr.count>=3) {
        return 30;
    }
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.commontArr.count>0) {
        return 20;
    }
    return 0;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 45, 20)];
//    view.backgroundColor = [UIColor redColor];
    [self addSubview:view];
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [commonMethod widthAuto:[NSString stringWithFormat:@"共%lu条评论",(unsigned long)self.commontArr.count] fontSize:12 contentheight:20], 20)];
    label.font =  [UIFont fontWithName:@"PingFang SC" size: 12];
    label.text = [NSString stringWithFormat:@"共%lu条评论",(unsigned long)self.commontArr.count];
    label.textColor =[UIColor colorWithRed:162/255.0 green:166/255.0 blue:172/255.0 alpha:1.0];
    [view addSubview:label];

    return view;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * view;
//    if (self.commontArr.count>=3) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 45, 30)];
    //    view.backgroundColor = [UIColor redColor];
        [self addSubview:view];
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 45, 20);
        [button setTitleColor:[UIColor colorWithRed:98/255.0 green:191/255.0 blue:180/255.0 alpha:1.0] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size: 10];
        [button addTarget:self action:@selector(moreButtonMethod) forControlEvents:UIControlEventTouchUpInside];
         [button setTitle:@"查看更多" forState:UIControlStateNormal];
        [view addSubview:button];
//    }else{
//        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 45, 10)];
//        [self addSubview:view];
//    }
     

    return view;
}
-(void)moreButtonMethod{
    [_commentDelegate didselectCell:self.tag];
}
 
@end
