//
//  orderProductCollectionView.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/4.
//

#import "orderProductCollectionView.h"
#import "goodsOrderModel.h"
#import "orderCollectionViewCell.h"
@implementation orderProductCollectionView

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    if (self==[super initWithFrame:frame collectionViewLayout:layout]) {
        //注册Item
        [self removeFromSuperview];
        self.dataSource = self;
        self.delegate = self;
        self.backgroundColor = [UIColor clearColor];
        self.frame = frame;
    }
    return self;
}
 
-(void)items:(NSInteger)items  withRowHeight:(CGFloat)rowHeight withRowWidth:(CGFloat)rowWidth withSpacing:(CGFloat)spacing withHeaderTitle:(NSString*)title cellIdentify:(NSString*)identify shopModel:(shopOrderModel*)shopModel selectedCell:(SelectCell)selectBlock{
    
    self.items=items;
    self.spacing=spacing;
    self.rowHeight=rowHeight;
    self.rowWidth=rowWidth;
    self.identify = identify;
    self.title = title;
    self.selectBlock = selectBlock;
//    [self createheadView];
    self.shopModel = shopModel;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.items;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    orderCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    goodsOrderModel * model = self.shopModel.cartList[indexPath.row];
    [cell.imageV sd_setImageWithURL:[NSURL URLWithString:model.pic]];
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
