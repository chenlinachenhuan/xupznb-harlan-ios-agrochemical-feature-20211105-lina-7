//
//  trendDetailDataModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/26.
//

#import <Foundation/Foundation.h>
#import "trendModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface trendDetailDataModel : NSObject
@property (nonatomic ,strong) trendModel *moment;
@property (nonatomic ,assign) CGRect momentsBodyFrame;

//昵称Frame
@property (nonatomic ,assign) CGRect bodyNameFrame;
//头像Frame
@property (nonatomic ,assign) CGRect bodyIconFrame;
//时间Frame
@property (nonatomic ,assign) CGRect bodyTimeFrame;
//
@property (nonatomic ,assign) CGRect bodyRemoveButtonFrame;
@property (nonatomic ,assign) CGRect bodycollectButtonFrame;

//
@property (nonatomic ,assign) CGRect bodyTitleFrame;

//正文Frame
@property (nonatomic ,assign) CGRect bodyTextFrame;
//图片Frame
@property (nonatomic ,assign) CGRect bodyPhotoFrame;

/**
 *  工具条Frame
 */
@property (nonatomic, assign) CGRect momentsToolBarFrame;
@property (nonatomic, assign) CGRect momentsFrame;

//点赞Frame
@property (nonatomic ,assign) CGRect toolLikeFrame;
//评论Frame
@property (nonatomic ,assign) CGRect toolCommentFrame;
//转发Frame
@property (nonatomic ,assign) CGRect toolForwardFrame;
//查看更多Button
//@property (nonatomic ,assign) CGRect moreButtonFrame;

/**
 *  cell高度
 */
@property (nonatomic ,assign) CGRect commentHeaderFrame;
@property (nonatomic ,assign) CGRect detailCommentButtonFrame;
@property (nonatomic ,assign) CGRect detailReportButtonFrame;
@property (nonatomic ,assign) CGRect detailCommentTextFrame;
@property (nonatomic ,assign) CGRect detailShowCommentButtonFrame;

@end

NS_ASSUME_NONNULL_END
