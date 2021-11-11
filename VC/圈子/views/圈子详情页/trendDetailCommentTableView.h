//
//  trendDetailCommentTableView.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/26.
//

#import <UIKit/UIKit.h>
#import "trendCommentDataModel.h"
#import "commentTwoTableViewCell.h"
#import "trendCommentTwoFrameModel.h"
#import "trendProtocol.h"
#import "trendDetailCommentParser.h"
NS_ASSUME_NONNULL_BEGIN
typedef void(^SelectCell)(NSIndexPath * indexPath);
typedef commentTwoTableViewCell *_Nullable(^CreateCell)(NSIndexPath *indexPath);
@interface trendDetailCommentTableView : UITableView<UITableViewDelegate,UITableViewDataSource,trendDetailCommentParserDelegate,UIGestureRecognizerDelegate>
 
{
    NSMutableDictionary *dic;//创建一个字典进行判断收缩还是展开
}
@property (nonatomic)NSInteger rows;
 
//
@property(nonatomic,retain)NSMutableArray *  commentArr;
@property(nonatomic,retain)NSMutableArray *  commentTwoArr;
@property(nonatomic,weak)id<trendProtocolDelegate> commentDelegate;

//声明自定义类型变量/
@property (nonatomic,copy)SelectCell selectBlock;
//声明自定义类型变量/
@property(nonatomic,copy)CreateCell createCell;
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIButton *commentButton;
@property (nonatomic, strong) UIButton *reportButton;
@property (nonatomic,strong) trendCommentDataModel *momentFrames;
 
-(void)commentArr:(NSMutableArray*)arr  cell:(CreateCell)cell selectedCell:(SelectCell)selectBlock;
-(void)reloadTableViewHeight;
@end

NS_ASSUME_NONNULL_END
