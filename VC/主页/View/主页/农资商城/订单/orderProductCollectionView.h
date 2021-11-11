//
//  orderProductCollectionView.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/4.
//

#import <UIKit/UIKit.h>
#import "shopOrderModel.h"
NS_ASSUME_NONNULL_BEGIN
typedef void(^SelectCell)(NSIndexPath *  indexPath);
typedef UICollectionViewCell *_Nullable(^collectionCell)(NSIndexPath *indexPath);

@interface orderProductCollectionView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,assign)NSInteger items;
@property(nonatomic,assign)NSInteger column;
@property(nonatomic,assign)CGFloat rowHeight;
@property(nonatomic,assign)CGFloat rowWidth;
@property(nonatomic,assign)CGFloat spacing;
@property(nonatomic,retain)NSString * title;
@property(nonatomic,retain)UIView*tvHeaderView;
@property(nonatomic,retain)NSString * identify;
@property(nonatomic,retain)shopOrderModel * shopModel;

//声明自定义类型变量/
@property (nonatomic,copy)SelectCell selectBlock;
//声明自定义类型变量/
@property(nonatomic,copy)collectionCell  createCell;
-(void)items:(NSInteger)items  withRowHeight:(CGFloat)rowHeight withRowWidth:(CGFloat)rowWidth withSpacing:(CGFloat)spacing withHeaderTitle:(NSString*)title cellIdentify:(NSString*)identify shopModel:(shopOrderModel*)shopModel selectedCell:(SelectCell)selectBlock;
@end

NS_ASSUME_NONNULL_END
