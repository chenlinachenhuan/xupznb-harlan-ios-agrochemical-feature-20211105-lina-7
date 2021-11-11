//
//  PublishCollectionView.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/22.
//

#import "PublishCollectionView.h"
#import "publishCollectionViewCell.h"
@implementation PublishCollectionView
-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    if (self==[super initWithFrame:frame collectionViewLayout:layout]) {
        //注册Item
        [self removeFromSuperview];
        self.dataSource = self;
        self.delegate = self;
        self.backgroundColor = [UIColor clearColor];
//        [self getNewsDataParser];
    }
    return self;
}
 
 
-(void)RowHeight:(CGFloat)rowHeight withRowWidth:(CGFloat)rowWidth withSpacing:(CGFloat)spacing withArr:(NSMutableArray *)arr selectedCell:(SelectCell)selectBlock{
    
    self.cat2NameArr = arr;
    self.spacing=spacing;
    self.rowHeight=rowHeight;
    self.rowWidth=rowWidth;
    self.selectBlock = selectBlock;
//    [self createheadView];

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (_cat2NameArr.count==0) {
        return 1;
    }
    return self.cat2NameArr.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
   
    publishCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"listCell" forIndexPath:indexPath];
    if (self.cat2NameArr.count==0) {
        cell.imageV.frame = CGRectMake(cell.center.x-17, cell.center.y-17, 34, 34);
        cell.imageV.image = [UIImage imageNamed:@"添加"];
    }else{
        cell.imageV.frame = CGRectMake(0, 0, self.rowWidth, self.rowHeight);
        cell.imageV.image = self.cat2NameArr[indexPath.row];
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
