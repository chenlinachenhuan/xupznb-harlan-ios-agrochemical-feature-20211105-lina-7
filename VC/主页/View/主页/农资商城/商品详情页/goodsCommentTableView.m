//
//  goodsCommentTableView.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/13.
//

#import "goodsCommentTableView.h"
#import "goodsCommentTableViewCell.h"
#import "goodsCellThreeFrameModel.h"
#import "goodsImageView.h"
@implementation goodsCommentTableView

-(instancetype)initWithFrame:(CGRect)frame  style:(UITableViewStyle)style   dataArr:(NSMutableArray*)dataArr showCount:(NSInteger)rowCount
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.backgroundColor = BackGroundColor;
        self.showsVerticalScrollIndicator = NO;
        self.dataSource = self;
        self.delegate = self;
        self.scrollEnabled = NO;
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 10;
        self.rowCount = rowCount;
        self.dataArr = dataArr;
    }
    return self;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    goodsCommentTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell =  [[goodsCommentTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
         
    }
    tableView.separatorStyle = NO;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.contentView.backgroundColor = [UIColor whiteColor];
    
    goodsCellThreeFrameModel * model =self.dataArr.count==0?nil:self.dataArr[indexPath.row];
    cell.headImageV.frame = model.headImgVFrame;
    cell.headImageV.image = model.textModel.headImg;
    cell.nameL.frame = model.nameLFrame;
    cell.nameL.text = model.textModel.nameStr;
    cell.dateL.frame = model.dateLFrame;
    cell.dateL.text = model.textModel.dateStr;
    cell.textL.frame = model.textLFrame;
    cell.textL.text = model.textModel.textStr;
    cell.typeL.frame = model.typeLFrame;
    cell.typeL.text = model.textModel.typeStr;
    cell.imageV.frame = model.imageVFrame;
    goodsImageView * imageV = [[goodsImageView alloc] initWithFrame:CGRectMake(0, 0, model.imageVFrame.size.width, model.imageVFrame.size.height) withImageArr:model.textModel.imageArr];
//    imageV.backgroundColor = SelectColor;
    [cell.imageV addSubview:imageV];
    return cell;
}
 
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.rowCount>0) {
        return self.rowCount;
    }
    return self.dataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    goodsCellThreeFrameModel * model =self.dataArr[indexPath.row];
    return  model.cellHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 51;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 51)];
    view.backgroundColor = [UIColor whiteColor];
    [self addSubview:view];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(11, 0, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame))];
    label.text = [NSString stringWithFormat:@"宝贝评价(%lu)",(unsigned long)self.dataArr.count];
//    label.textColor = CommonColor;
    label.font = FontSize(16);
    [view addSubview:label];
    
    UIButton * moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    moreButton.frame = CGRectMake(view.frame.size.width-10-72, CGRectGetMaxY(label.frame)-CGRectGetHeight(label.frame)/2-7, 72, 14);
    [moreButton setTitle:@"查看全部" forState:UIControlStateNormal];
    [moreButton setTitleColor:[UIColor colorWithRed:255/255.0 green:179/255.0 blue:12/255.0 alpha:1.0] forState:UIControlStateNormal];
    moreButton.titleLabel.font = FontSize(14);
    [moreButton setImage:[UIImage imageNamed:@"进入黄色"] forState:UIControlStateNormal];
    moreButton.titleLabel.textColor =[UIColor colorWithRed:255/255.0 green:179/255.0 blue:12/255.0 alpha:1.0];
    moreButton.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    moreButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -120);
    [moreButton addTarget:self action:@selector(moreButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:moreButton];
    return view;
}
-(void)moreButtonMethod{
    
}
@end
