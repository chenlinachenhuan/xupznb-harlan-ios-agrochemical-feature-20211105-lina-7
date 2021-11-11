//
//  newsListView.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/9.
//

#import "newsListView.h"
#import "policyTableViewCell.h"
#import "NewsTextMedel.h"
@implementation newsListView

-(id)initWithFrame:(CGRect)frame{
    if (self==[super initWithFrame:frame]) {
        self.frame = frame;
        self.backgroundColor = SelectColor;
        [self createTableView];
    }
    return self;
}
-(void)setMyArr:(NSMutableArray *)myArr{
    _myArr = myArr;
    self.frame =CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width,  self.myTab.rowHeight*myArr.count);
    self.myTab.frame = CGRectMake(0, 0, self.frame.size.width,  self.myTab.rowHeight*myArr.count);
    [self.myTab reloadData];
}
-(void)createTableView{
    self.myTab = [[UITableView alloc] initWithFrame:self.frame style:UITableViewStylePlain];
    self.myTab.delegate = self;
    self.myTab.dataSource = self;
    self.myTab.rowHeight = 0.9146666667*ScreenWidth*0.306122449 ;
    self.myTab.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.myTab.scrollEnabled = NO;
    self.myTab.userInteractionEnabled = YES;
    [self addSubview:self.myTab];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.myArr.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    policyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"policyCell"];
    if (!cell) {
        cell = [[[UINib nibWithNibName:@"policyTableViewCell" bundle:nil]instantiateWithOwner:self options:nil]lastObject];
    }
    NewsTextMedel * model = self.myArr[indexPath.row];
    [cell.imageV sd_setImageWithURL:[NSURL URLWithString:model.pic]];
    cell.titleL.text = model.title;
    cell.textL.text = model.albumPics;
    cell.viewsL.text = [NSString stringWithFormat:@"%@ views",model.viewNum];
    cell.timeL.text = [model.pubTime substringToIndex:10];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.myDelegate didSelectCell:indexPath];
}

@end
