//
//  newsCommentView.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/18.
//

#import <UIKit/UIKit.h>
#import "newsCommentTableViewCell.h"
#import "newsCommentFrameModel.h"
NS_ASSUME_NONNULL_BEGIN
typedef void(^SelectCell)(NSIndexPath * indexPath);
typedef newsCommentTableViewCell *_Nullable(^CreateCell)(NSIndexPath *indexPath);
@interface newsCommentView : UITableView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain)NSMutableArray * commentArr;
//声明自定义类型变量/
@property (nonatomic,copy)SelectCell selectBlock;
//声明自定义类型变量/
@property(nonatomic,copy)CreateCell createCell;
-(void)commentArr:(NSMutableArray*)arr  cell:(CreateCell)cell selectedCell:(SelectCell)selectBlock;
-(void)reloadDataMethod;
@end

NS_ASSUME_NONNULL_END
