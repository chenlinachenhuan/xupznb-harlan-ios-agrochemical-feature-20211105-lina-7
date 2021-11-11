//
//  trendCollectionView.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/22.
//

#import <UIKit/UIKit.h>
#import "trendDataModel.h"
#import "trendImageView.h"
#import "commentTableView.h"
#import "trendProtocol.h"
NS_ASSUME_NONNULL_BEGIN
typedef void(^SelectCell)(NSIndexPath *  indexPath);

@interface trendCollectionView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource>
 
 
@property(nonatomic,assign)NSInteger items;
@property(nonatomic,assign)NSInteger column;
@property(nonatomic,assign)CGFloat rowHeight;
@property(nonatomic,assign)CGFloat rowWidth;
@property(nonatomic,assign)CGFloat spacing;
@property(nonatomic,retain)NSString * title;
@property(nonatomic,assign)NSInteger count;
@property(nonatomic,retain)UIView*tvHeaderView;
@property (nonatomic,strong) NSMutableArray *momentFrames; //ViewModel(包含cell子控件的Frame)
@property (nonatomic,strong) NSMutableArray *moments;      //数据模型
@property(nonatomic,weak)id<trendProtocolDelegate> commentDelegate;

//声明自定义类型变量/
@property (nonatomic,copy)SelectCell selectBlock;
-(void)items:(NSInteger)items  withRowHeight:(CGFloat)rowHeight withRowWidth:(CGFloat)rowWidth withSpacing:(CGFloat)spacing isShowFooter:(BOOL)show dataModelArr:(NSMutableArray*)dataModelArr selectedCell:(SelectCell)selectBlock delegate:(id)delegate;
@end

NS_ASSUME_NONNULL_END
