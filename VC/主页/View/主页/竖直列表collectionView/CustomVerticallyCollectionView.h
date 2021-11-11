//
//  CustomVerticallyCollectionView.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^SelectCell)(NSIndexPath *  indexPath);
typedef void(^MoreButtonBlock)(UIButton *  button);

@interface CustomVerticallyCollectionView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,assign)NSInteger items;
@property(nonatomic,assign)NSInteger column;
@property(nonatomic,assign)CGFloat rowHeight;
@property(nonatomic,assign)CGFloat rowWidth;
@property(nonatomic,assign)CGFloat spacing;
@property(nonatomic,retain)NSString * title;
@property(nonatomic,retain)NSString * identify;
@property(nonatomic,retain)NSMutableArray * listArr;

@property(nonatomic,retain)UIView*tvHeaderView;
//声明自定义类型变量/
@property (nonatomic,copy)SelectCell selectBlock;
@property (nonatomic,copy)MoreButtonBlock moreButtonBlock;

-(void)items:(NSInteger)items  withRowHeight:(CGFloat)rowHeight withRowWidth:(CGFloat)rowWidth withSpacing:(CGFloat)spacing isShowFooter:(BOOL)show cellIdentify:(NSString*)identify selectedCell:(SelectCell)selectBlock moreButtonBlock:(MoreButtonBlock)moreButtonBlock;
@end

NS_ASSUME_NONNULL_END
