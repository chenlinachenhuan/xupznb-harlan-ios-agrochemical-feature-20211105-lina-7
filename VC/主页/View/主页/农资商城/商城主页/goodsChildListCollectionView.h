//
//  goodsChildListCollectionView.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^SelectCell)(NSIndexPath *  indexPath);

@interface goodsChildListCollectionView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,assign)NSInteger items;
@property(nonatomic,assign)NSInteger column;
@property(nonatomic,assign)CGFloat rowHeight;
@property(nonatomic,assign)CGFloat rowWidth;
@property(nonatomic,assign)CGFloat spacing;
@property(nonatomic,retain)NSMutableArray* ListArr;
@property(nonatomic,retain)NSString* identify;

//声明自定义类型变量/
@property (nonatomic,copy)SelectCell selectBlock;
-(void)items:(NSInteger)items  withRowHeight:(CGFloat)rowHeight withRowWidth:(CGFloat)rowWidth withSpacing:(CGFloat)spacing  withIdentify:(NSString *)identify selectedCell:(SelectCell)selectBlock;
@end

NS_ASSUME_NONNULL_END
