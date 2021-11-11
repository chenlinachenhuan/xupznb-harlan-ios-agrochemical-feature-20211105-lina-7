//
//  commentTableView.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/23.
//

#import <UIKit/UIKit.h>
#import "classDetailViewController.h"
#import "trendProtocol.h"
NS_ASSUME_NONNULL_BEGIN
@interface commentTableView : UITableView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain)NSMutableArray * commontArr;
@property(nonatomic,weak)id<trendProtocolDelegate> commentDelegate;
-(void)CommentArr:(NSMutableArray*)arr;
-(instancetype)initWithViewProtocol:(id)delegate;
@end
 
NS_ASSUME_NONNULL_END
