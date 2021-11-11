//
//  newsCommentFrameModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/18.
//

#import <Foundation/Foundation.h>
#import "newsCommentListTextModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface newsCommentFrameModel : NSObject
//评论
@property(nonatomic,retain)NSMutableArray * commentCellHeightArr;
@property(nonatomic,assign)CGFloat commentCellHeight;
@property(nonatomic,assign)CGRect commentTextFrame;
@property(nonatomic,assign)CGRect commentHeadImageFrame;
@property(nonatomic,assign)CGRect commentNameFrame;
@property(nonatomic,assign)CGRect commentDateFrame;
@property(nonatomic,assign)CGRect commentButtonFrame;
@property(nonatomic,assign)CGRect reportButtonFrame;
@property(nonatomic,assign)CGRect lineLFrame;
@property (nonatomic, assign) BOOL showComment;
@property(nonatomic,retain)newsCommentListTextModel * model;

-(CGFloat)setCommentFrames:(newsCommentListTextModel*)commentModel;

@end

NS_ASSUME_NONNULL_END
