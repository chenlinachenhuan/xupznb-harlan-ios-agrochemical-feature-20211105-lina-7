//
//  WSLWaterFlowLayout.h
//  collectionView
//
//  Created by 王双龙 on 2017/10/16.
//  Copyright © 2017年 https://www.jianshu.com/u/e15d1f644bea All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
typedef void(^SelectCell)(NSIndexPath *  indexPath);
typedef UICollectionViewCell *_Nullable(^collectionCell)(NSIndexPath *indexPath);

@interface CustomHorizontalCollectionView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,assign)NSInteger items;
@property(nonatomic,assign)NSInteger column;
@property(nonatomic,assign)CGFloat rowHeight;
@property(nonatomic,assign)CGFloat rowWidth;
@property(nonatomic,assign)CGFloat spacing;
@property(nonatomic,retain)NSString * title;
@property(nonatomic,retain)UIView*tvHeaderView;
@property(nonatomic,retain)NSString * identify;
@property(nonatomic,retain)NSMutableArray * listArr;

//声明自定义类型变量/
@property (nonatomic,copy)SelectCell selectBlock;
//声明自定义类型变量/
@property(nonatomic,copy)collectionCell  createCell;
-(void)items:(NSInteger)items  withRowHeight:(CGFloat)rowHeight withRowWidth:(CGFloat)rowWidth withSpacing:(CGFloat)spacing withHeaderTitle:(NSString*)title cellIdentify:(NSString*)identify selectedCell:(SelectCell)selectBlock;
@end
NS_ASSUME_NONNULL_END
