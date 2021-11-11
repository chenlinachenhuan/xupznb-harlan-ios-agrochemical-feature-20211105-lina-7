//
//  productListCollectionView.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/1.
//

#import "productListCollectionView.h"
#import "productListCollectionViewCell.h"
#import "productListModel.h"
@implementation productListCollectionView

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
 
-(void)items:(NSInteger)items  withRowHeight:(CGFloat)rowHeight withRowWidth:(CGFloat)rowWidth withSpacing:(CGFloat)spacing  selectedCell:(SelectCell)selectBlock{
    
    self.items=items;
    self.spacing=spacing;
    self.rowHeight=rowHeight;
    self.rowWidth=rowWidth;
    self.selectBlock = selectBlock;

}
-(void)setListArr:(NSMutableArray *)ListArr{
    _ListArr = ListArr;
    [self reloadData];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.ListArr.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
  
    productListCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    productListModel * model =  _ListArr[indexPath.row];
    [cell.imageV  sd_setImageWithURL:[NSURL URLWithString:model.pic]];
    cell.title.text = model.name;
    cell.money.text = [NSString stringWithFormat:@"%@",model.mallMinPrice];
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
