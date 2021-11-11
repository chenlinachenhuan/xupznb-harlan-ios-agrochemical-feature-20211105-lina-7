//
//  CustomVerticallyCollectionView.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/15.
//

#import "CustomVerticallyCollectionView.h"
#import "VerticalCollectionViewCell.h"
#import "expertCollectionViewCell.h"
#import "exportListModel.h"
#import "classListModel.h"

@implementation CustomVerticallyCollectionView
-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    if (self==[super initWithFrame:frame collectionViewLayout:layout]) {
        //注册Item
        self.dataSource = self;
        self.delegate = self;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
-(void)createFooterView{
//    CGFloat header_y = CGRectGetHeight(self.frame)*0.20588235;
//    self.contentInset = UIEdgeInsetsMake(0, 0, -header_y, 0);
//    _tvHeaderView = [[UIView alloc] init];
//    _tvHeaderView.frame = CGRectMake(0, CGRectGetHeight(self.frame)-header_y, self.frame.size.width, header_y);
//    [self addSubview:_tvHeaderView];
//    [self setContentOffset:CGPointMake(0, header_y)];
//    _tvHeaderView.backgroundColor = [UIColor orangeColor];
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(self.frame.size.width/2-0.426666667*ScreenWidth*0.5, CGRectGetHeight(self.frame)-0.426666667*ScreenWidth*0.1625, 0.426666667*ScreenWidth, 0.426666667*ScreenWidth*0.1625);
    [button setBackgroundColor:[UIColor colorWithRed:98/255.0 green:191/255.0 blue:180/255.0 alpha:1.0]];
    button.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size: 12];
    button.clipsToBounds = YES;
    button.layer.cornerRadius = 10;
    [button setTitle:@"查看更多" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(moreButtonMethed:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    
}
-(void)moreButtonMethed:(UIButton*)button{
    self.moreButtonBlock(button);
}
-(void)items:(NSInteger)items  withRowHeight:(CGFloat)rowHeight withRowWidth:(CGFloat)rowWidth withSpacing:(CGFloat)spacing isShowFooter:(BOOL)show cellIdentify:(NSString*)identify selectedCell:(SelectCell)selectBlock moreButtonBlock:(MoreButtonBlock)moreButtonBlock{
    self.items=items;
    self.spacing=spacing;
    self.rowHeight=rowHeight;
    self.rowWidth=rowWidth;
    self.identify = identify;
     self.selectBlock = selectBlock;
    self.moreButtonBlock=moreButtonBlock;
    if (show==YES&&self.items>6) {
        [self createFooterView];
    }
}
-(void)setListArr:(NSMutableArray *)listArr{
    _listArr = listArr;
    [self reloadData];
}
// 两行cell之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return self.spacing;
}
 
// 两列cell之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return self.spacing;
}
 
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _items;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell*cell;
    if ([self.identify isEqualToString:@"expert"]) {
        expertCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"expert" forIndexPath:indexPath];
        exportListModel * model = self.listArr[indexPath.row];
        [cell.headImageV sd_setImageWithURL:[NSURL URLWithString:model.proficientIcon] placeholderImage:placeHolderImage];
        cell.nameL.text = model.nickname;
        cell.typeL.text = [NSString stringWithFormat:@"领域: %@",model.cropName];
        return cell;
    }else if ([self.identify isEqualToString:@"popularClass"]) {
        VerticalCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"popularClass" forIndexPath:indexPath];
        classListModel * model = self.listArr[indexPath.row];
        [cell.imageV sd_setImageWithURL:[NSURL URLWithString:model.pic]];
        cell.viewsL.text = [NSString stringWithFormat:@" %@已加入学习",model.viewNum];
        cell.titleL.text = model.title;
        cell.textL.text = model.remark;
        cell.nameL.text = [NSString stringWithFormat:@"%@·%@",model.proficientName,model.proficientTypeName];
        cell.moneyL.text =[NSString stringWithFormat:@"%@讲/¥%@",model.curriculumNum,model.mallPrice];
        return cell;
    }
    
    
    return cell;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.rowWidth, self.rowHeight);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    self.selectBlock(indexPath);
}
 
@end
