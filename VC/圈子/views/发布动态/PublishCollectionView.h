//
//  PublishCollectionView.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^SelectCell)(NSIndexPath *  indexPath);
typedef UICollectionViewCell *_Nullable(^collectionCell)(NSIndexPath *indexPath);

@interface PublishCollectionView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,assign)NSInteger items;
@property(nonatomic,assign)NSInteger column;
@property(nonatomic,assign)CGFloat rowHeight;
@property(nonatomic,assign)CGFloat rowWidth;
@property(nonatomic,assign)CGFloat spacing;
@property(nonatomic,retain)NSString * title;
@property(nonatomic,retain)UIView*tvHeaderView;
@property(nonatomic,retain)NSString * identify;
@property(nonatomic,retain)NSMutableArray * dataArr;
@property(nonatomic,retain)NSMutableArray * cat2NameArr;
//声明自定义类型变量/
@property (nonatomic,copy)SelectCell selectBlock;
//声明自定义类型变量/
@property(nonatomic,copy)collectionCell  createCell;
-(void)RowHeight:(CGFloat)rowHeight withRowWidth:(CGFloat)rowWidth withSpacing:(CGFloat)spacing withArr:(NSMutableArray *)arr selectedCell:(SelectCell)selectBlock;
@end

NS_ASSUME_NONNULL_END
