//
//  newsCollectionView.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/15.
//

#import "newsCollectionView.h"

@implementation newsCollectionView

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    if (self==[super initWithFrame:frame collectionViewLayout:layout]) {
        //注册Item
        [self removeFromSuperview];
        self.backgroundColor = [UIColor clearColor];
//        [self getNewsDataParser];
    }
    return self;
}
-(void)getNewsDataParser{
    if (!self.newsP) {
        self.newsP = [[newsParser alloc] init];
    }
    [self.newsP requestWithCat2Id:0 withCatId:0 withKeyWord:@"" withPageNum:1 withPageSize:10 withShowStatus:1 ]  ;
       
   
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
-(void)RowHeight:(CGFloat)rowHeight withRowWidth:(CGFloat)rowWidth withSpacing:(CGFloat)spacing withArr:(NSMutableArray *)arr selectedCell:(SelectCell)selectBlock{
    
    self.cat2NameArr = arr;
    self.spacing=spacing;
    self.rowHeight=rowHeight;
    self.rowWidth=rowWidth;
    self.selectBlock = selectBlock;
//    [self createheadView];

}
-(void)setCat2NameArr:(NSMutableArray *)cat2NameArr{
    _cat2NameArr = cat2NameArr;
    self.dataSource = self;
    self.delegate = self;
    [self reloadData];
    
}
 
-(void)setBorderColor:(UIColor *)borderColor{
    _borderColor = borderColor;
//    [self reloadData];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _cat2NameArr.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
   
    newsListCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"listCell" forIndexPath:indexPath];
    cell.selectTextL.text = self.cat2NameArr[indexPath.row];
    cell.selectTextL.clipsToBounds = YES;
    cell.selectTextL.layer.cornerRadius = 16;
//    cell.clipsToBounds = YES;
   
    if (self.selectCell==nil) {
        cell.selectTextL.layer.borderWidth=0.5;
        cell.selectTextL.layer.borderColor = _borderColor.CGColor;
        if (indexPath.row==0) {
            cell.selectTextL.backgroundColor = UIColorFromRGB(0xFEC146);
            cell.selectTextL.textColor = [UIColor whiteColor];
            cell.selectTextL.layer.borderWidth=0;
            self.selectCell = cell;
        }
    }else{
        if (cell==self.selectCell) {
            cell.selectTextL.layer.borderWidth=0;
        }else{
            cell.selectTextL.layer.borderWidth=0.5;
        }
     }
    return cell;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake([commonMethod widthAuto:self.cat2NameArr[indexPath.row] fontSize:15 contentheight:32]+40, _rowHeight);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    self.selectBlock(indexPath);
    self.selectCell.selectTextL.layer.borderWidth = 0.5;
    self.selectCell.selectTextL.backgroundColor = [UIColor whiteColor];
    self.selectCell.selectTextL.textColor = [UIColor blackColor];
    newsListCollectionViewCell * cell =(newsListCollectionViewCell*) [collectionView cellForItemAtIndexPath:indexPath];
    cell.selectTextL.backgroundColor = UIColorFromRGB(0xFEC146);
    cell.selectTextL.textColor = [UIColor whiteColor];
    cell.selectTextL.layer.borderWidth=0;
    self.selectCell = cell;
}
 
 

@end
