//
//  classCommentCellView.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/28.
//

#import <UIKit/UIKit.h>
#import "classCommentDataModel.h"
#import "classCommentTableView.h"
NS_ASSUME_NONNULL_BEGIN

@interface classCommentCellView : UIView
@property(nonatomic,retain)classCommentDataModel * dataModel;
@property(nonatomic,retain)classCommentTableView * commentTableView;
@property(nonatomic,retain)NSMutableArray * commentArr;
-(void)createCellView:(NSMutableArray *)dataArr;
@end

NS_ASSUME_NONNULL_END
