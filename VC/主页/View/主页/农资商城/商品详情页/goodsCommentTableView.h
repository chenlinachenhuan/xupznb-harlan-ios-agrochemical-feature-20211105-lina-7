//
//  goodsCommentTableView.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface goodsCommentTableView : UITableView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain)NSMutableArray * dataArr;
@property(nonatomic,assign)NSInteger rowCount;

-(instancetype)initWithFrame:(CGRect)frame  style:(UITableViewStyle)style   dataArr:(NSMutableArray*)dataArr showCount:(NSInteger)rowCount;
@end

NS_ASSUME_NONNULL_END
