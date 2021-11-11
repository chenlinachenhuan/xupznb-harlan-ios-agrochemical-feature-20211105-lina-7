//
//  CustomNewsTableView.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^SelectCell)(NSIndexPath * indexPath);
typedef void(^MoreButtonBlock)(UIButton*button);

typedef UITableViewCell *_Nullable(^CreateCell)(NSIndexPath *indexPath);
@interface CustomNewsTableView : UITableView<UITableViewDelegate,UITableViewDataSource>
//rows/
@property (nonatomic)NSInteger rows;
//cell的高度/
@property(nonatomic,assign)CGFloat height;
//
@property(nonatomic,assign)CGFloat   headerHeight;
//声明自定义类型变量/
@property (nonatomic,copy)SelectCell selectBlock;
//声明自定义类型变量/
@property(nonatomic,copy)CreateCell createCell;
@property(nonatomic,copy)MoreButtonBlock moreButtonBlock;
@property(nonatomic,retain)NSMutableArray * dataArr;
@property(nonatomic,retain)NSString * identfy;

-(instancetype)initWithFrame:(CGRect)frame headerHeight:(CGFloat)headerHeight style:(UITableViewStyle)style rowCount:(NSInteger)rows cellHeight:(CGFloat)height cell:(CreateCell)cell selectedCell:(SelectCell)selectBlock moreButtonClick:(MoreButtonBlock)moreButtonBlock;
 
 
@end

NS_ASSUME_NONNULL_END
