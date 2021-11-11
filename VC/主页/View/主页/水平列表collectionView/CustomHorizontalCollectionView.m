//
//  WSLWaterFlowLayout.m
//  collectionView
//
//  Created by 王双龙 on 2017/10/16.
//  Copyright © 2017年 https://www.jianshu.com/u/e15d1f644bea All rights reserved.
//

#import "CustomHorizontalCollectionView.h"
#import "waterCollectionViewCell.h"
#import "newsListCollectionViewCell.h"
#import "knowledgeListModel.h"
@interface CustomHorizontalCollectionView ()
 
@end

@implementation CustomHorizontalCollectionView
-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    if (self==[super initWithFrame:frame collectionViewLayout:layout]) {
        //注册Item
        [self removeFromSuperview];
        self.dataSource = self;
        self.delegate = self;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
-(void)createheadView{
    CGFloat header_y = 40;
    self.contentInset = UIEdgeInsetsMake(header_y, 0, 0, 0);
    _tvHeaderView = [[UIView alloc] init];
    _tvHeaderView.frame = CGRectMake(0, -header_y, self.frame.size.width, header_y);
    [self addSubview:_tvHeaderView];
    [self setContentOffset:CGPointMake(0, -header_y)];
    UILabel * titleL = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, ScreenWidth, 40)];
    titleL.text = _title;
    titleL.textColor = [UIColor blackColor];
    [_tvHeaderView addSubview:titleL];
    
    
}
-(void)setListArr:(NSMutableArray *)listArr{
    _listArr = listArr;
    [self reloadData];
}
-(void)items:(NSInteger)items  withRowHeight:(CGFloat)rowHeight withRowWidth:(CGFloat)rowWidth withSpacing:(CGFloat)spacing withHeaderTitle:(NSString*)title cellIdentify:(NSString*)identify selectedCell:(SelectCell)selectBlock{
    
    self.items=items;
    self.spacing=spacing;
    self.rowHeight=rowHeight;
    self.rowWidth=rowWidth;
    self.identify = identify;
    self.title = title;
    self.selectBlock = selectBlock;
//    [self createheadView];

}
 
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.listArr.count>=5) {
        return 5;
    }
    return self.listArr.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell;
    if ([self.identify isEqualToString:@"ItemID"]) {
      waterCollectionViewCell *  cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ItemID" forIndexPath:indexPath];
        knowledgeListModel * model = self.listArr[indexPath.row];
        [cell.headerImageV sd_setImageWithURL:[NSURL URLWithString:model.pic]];
        cell.titleLabel.text = model.title;
        cell.textLabel.text = model.albumPics;
        cell.timeLabel.text = model.pubTime;
        return cell;
    }else  if ([self.identify isEqualToString:@"listCell"]) {
       newsListCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"listCell" forIndexPath:indexPath];
        return cell;
    }
      
    return cell;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(_rowWidth, _rowHeight);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    self.selectBlock(indexPath);
}
 
 
@end
