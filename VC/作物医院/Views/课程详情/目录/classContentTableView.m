//
//  classContentTableView.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/8.
//

#import "classContentTableView.h"

@implementation classContentTableView

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
    classContentViewTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell =  [[classContentViewTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
         
    }
    tableView.separatorStyle = NO;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor whiteColor];
    classContentViewDataModel * dataModel = self.dataArr[indexPath.row];
    cell.textL.frame = dataModel.contentTextFrame;
    cell.textL.text =[[commonMethod addLabelToTitle:dataModel.contentModel.title typeStr:dataModel.contentModel.fileType] string];
     
    if ([dataModel.contentModel.fileType isEqualToString:@"video"]) {
        cell.textL.attributedText = [commonMethod addLabelToTitle:dataModel.contentModel.title typeStr:@"视频"];
        if ([dataModel.contentModel.playStatus integerValue]==0) {
            cell.typeImgV.hidden = YES;
            cell.typeL.hidden = YES;
        }else if ([dataModel.contentModel.playStatus integerValue]==1) {
            cell.typeImgV.hidden = YES;
            cell.typeL.hidden = NO;
            cell.typeL.frame = dataModel.LockTextFrame;
            cell.typeL.text = @"可试看";
        }else if ([dataModel.contentModel.playStatus integerValue]==2) {
            cell.typeImgV.hidden = NO;
            cell.typeL.hidden = YES;
            cell.typeImgV.frame = dataModel.LockImageVFrame;
            cell.typeImgV.image = [UIImage imageNamed:@"锁"];
        }
        
    }else if ([dataModel.contentModel.fileType isEqualToString:@"pdf"]){
        cell.textL.attributedText = [commonMethod addLabelToTitle:dataModel.contentModel.title typeStr:@"PDF"];
        if ([dataModel.contentModel.viewStatus integerValue]==0) {
            cell.typeL.hidden = NO;
            cell.typeImgV.hidden = YES;
            cell.typeL.frame = dataModel.LockTextFrame;
            cell.typeL.text = @"可试看";
        }else{
            cell.typeImgV.hidden = NO;
            cell.typeL.hidden = YES;
            cell.typeImgV.frame = dataModel.LockImageVFrame;
            cell.typeImgV.image = [UIImage imageNamed:@"锁"];
        }
        
    }
    return cell;
}
 
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    classContentViewDataModel * dataModel = self.dataArr[indexPath.row];
    if ([dataModel.contentModel.fileType isEqualToString:@"video"]) {
        if ([dataModel.contentModel.playStatus integerValue]==0||[dataModel.contentModel.playStatus integerValue]==1) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadVideo" object:nil userInfo:@{@"myId":dataModel.contentModel.myId}];
        }
    }else{
        if ([dataModel.contentModel.viewStatus integerValue]==0) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadVideo" object:nil userInfo:@{@"myId":dataModel.contentModel.myId}];
        }
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _rows;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    classContentViewDataModel * model =self.dataArr[indexPath.row];
    return  model.contentCellHeight;
}
 
 

@end
