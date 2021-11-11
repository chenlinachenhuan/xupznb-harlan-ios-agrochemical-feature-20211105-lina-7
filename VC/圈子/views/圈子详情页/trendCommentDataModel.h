//
//  trendCommentDataModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/30.
//

#import <Foundation/Foundation.h>
#import "trendCommentModel.h"
#import "showCommentButton.h"
NS_ASSUME_NONNULL_BEGIN

@interface trendCommentDataModel : NSObject
//评论
@property(nonatomic,retain)NSMutableArray * commentCellHeightArr;
@property(nonatomic,assign)CGFloat commentTableViewHeight;
@property(nonatomic,assign)CGFloat commentCellHeight;
@property(nonatomic,assign)CGRect commentTextFrame;
@property(nonatomic,assign)CGRect commentHeadImageFrame;
@property(nonatomic,assign)CGRect commentNameFrame;
@property(nonatomic,assign)CGRect commentDateFrame;
@property(nonatomic,assign)CGRect commentButtonFrame;
@property(nonatomic,assign)CGRect reportButtonFrame;
@property(nonatomic,assign)CGRect moreButtonFrame;
@property (nonatomic, assign) BOOL showComment;
@property(nonatomic,retain)trendCommentModel * model;
@property(nonatomic,retain)NSMutableArray * commentTwoArr ;
@property(nonatomic,retain)showCommentButton * showCommentB;

-(CGFloat)setCommentFrames:(trendCommentModel*)commentModel;

@end

NS_ASSUME_NONNULL_END
