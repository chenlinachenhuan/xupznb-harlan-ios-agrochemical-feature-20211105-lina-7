//
//  classCommentDataModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/28.
//

#import <Foundation/Foundation.h>
#import "classCommentModel.h"
#import "classDetailIntroduceModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface classCommentDataModel : NSObject
@property(nonatomic,retain)classDetailIntroduceModel * model;
@property(nonatomic,retain)classCommentModel * commentModel;

//评论
@property(nonatomic,retain)NSMutableArray * commentCellHeightArr;
@property(nonatomic,assign)CGFloat commentTableViewHeight;
@property(nonatomic,assign)CGFloat commentCellHeight;
@property(nonatomic,assign)CGRect commentTextFrame;
@property(nonatomic,assign)CGRect commentHeadImageFrame;
@property(nonatomic,assign)CGRect commentNameFrame;
@property(nonatomic,assign)CGRect commentDateFrame;
@property(nonatomic,assign)CGRect commentScoreFrame;
-(CGFloat)setCommentFrames:(classCommentModel*)commentModel;
@end

NS_ASSUME_NONNULL_END
