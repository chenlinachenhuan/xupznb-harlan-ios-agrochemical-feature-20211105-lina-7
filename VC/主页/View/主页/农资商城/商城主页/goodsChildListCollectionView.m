//
//  goodsChildListCollectionView.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/1.
//

#import "goodsChildListCollectionView.h"
#import "childListCollectionViewCell.h"
#import "goodsChildrenListModel.h"
#import "parentCollectionViewCell.h"
#import "goodsParentListModel.h"
@implementation goodsChildListCollectionView
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
 
-(void)items:(NSInteger)items  withRowHeight:(CGFloat)rowHeight withRowWidth:(CGFloat)rowWidth withSpacing:(CGFloat)spacing  withIdentify:(NSString *)identify selectedCell:(SelectCell)selectBlock{
    
    self.items=items;
    self.spacing=spacing;
    self.rowHeight=rowHeight;
    self.rowWidth=rowWidth;
    self.selectBlock = selectBlock;
    self.identify = identify;
}
-(void)setListArr:(NSMutableArray *)ListArr{
    _ListArr = ListArr;
//    [self reloadData];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.ListArr.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell;
    if ([self.identify isEqualToString:@"cell"]) {
        childListCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        goodsChildrenListModel *modle = self.ListArr[indexPath.row];
        [cell.imageV sd_setImageWithURL:[NSURL URLWithString:modle.pic]];
        cell.name.text = modle.name;
        cell.englishName.text = [NSString stringWithFormat:@"%@",modle.remark];
        return cell;

    }else if ([self.identify isEqualToString:@"parentCell"]) {
        parentCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"parentCell" forIndexPath:indexPath];
        goodsParentListModel *modle = self.ListArr[indexPath.row];
        cell.nameL.frame = CGRectMake(10, 10, self.rowWidth-20, 40);
        cell.nameL.text = modle.name;
        return cell;
        
    }
     
    return cell;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.identify isEqualToString:@"cell"]) {
        return CGSizeMake(_rowWidth, _rowHeight);

    }else if ([self.identify isEqualToString:@"parentCell"]) {
        goodsParentListModel * model = self.ListArr[indexPath.row];
        return CGSizeMake([commonMethod widthAuto:model.name fontSize:15 contentheight:20]+20, _rowHeight);

    }
        
    return CGSizeMake(_rowWidth, _rowHeight);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    self.selectBlock(indexPath);
}
 
 
@end
