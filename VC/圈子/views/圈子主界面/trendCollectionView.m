//
//  trendCollectionView.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/22.
//

#import "trendCollectionView.h"
#import "trendCollectionViewCell.h"
@implementation trendCollectionView

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
    CGFloat height = self.collectionViewLayout.collectionViewContentSize.height;
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2-0.426666667*ScreenWidth*0.5, height, 0.426666667*ScreenWidth, 40)];
    label.text = @"~下面没有啦~";
    label.textColor = [UIColor colorWithRed:162/255.0 green:166/255.0 blue:172/255.0 alpha:1.0];
    label.font = [UIFont fontWithName:@"PingFang SC" size:12];
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];

}
-(void)items:(NSInteger)items  withRowHeight:(CGFloat)rowHeight withRowWidth:(CGFloat)rowWidth withSpacing:(CGFloat)spacing isShowFooter:(BOOL)show dataModelArr:(NSMutableArray*)dataModelArr selectedCell:(SelectCell)selectBlock delegate:(id)delegate{
    self.items=items;
    self.spacing=spacing;
    self.rowHeight=rowHeight;
    self.rowWidth=rowWidth;
    self.momentFrames = dataModelArr;
     self.selectBlock = selectBlock;
    self.commentDelegate = delegate;
//    if (show==YES) {
//        [self createFooterView];
//    }
}
-(void)setMomentFrames:(NSMutableArray *)momentFrames{
    _momentFrames = momentFrames;
    self.dataSource = self;
    self.delegate = self;
    self.backgroundColor = [UIColor clearColor];
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
    return self.momentFrames.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    trendCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"trendCollectionViewCell" forIndexPath:indexPath];
    trendDataModel * model = self.momentFrames[indexPath.row];
    MomentsBodyView *bodyView = [[MomentsBodyView alloc] init];
    bodyView.momentFrames.moment = model.moment;
    bodyView.frame = model.momentsBodyFrame;
    bodyView.myDelegate =  self.commentDelegate;
    [bodyView setChildView:model];
//    bodyView.myDelegate = self;
    [cell addSubview:bodyView];
     bodyView.comment.tag = indexPath.row;
    bodyView.tag = indexPath.row;
    bodyView.comment.commentDelegate = _commentDelegate;
    return cell;
}
 
 

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
 
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    trendDataModel * model = self.momentFrames[indexPath.row];
     
    return CGSizeMake(self.rowWidth, model.cellHeight);
}
 
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    self.selectBlock(indexPath);
}

@end
