//
//  trendDetailParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/20.
//

#import "BaseDataParser.h"
#import "trendCommentModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol trendDetailCommentParserDelegate;
@interface trendDetailCommentParser : BaseDataParser
 
@property(nonatomic,weak)id<trendDetailCommentParserDelegate>myDelegate;
-(void)requestTrendDetailCommentId:(int64_t)myId orderStatus:(int32_t)orderStatus pageNum:(int32_t)pageNum pageSize:(int32_t)pageSize parentId:(int64_t)parentId pubTimeStatus:(int32_t)pubTimeStatus showStatus:(int32_t)showStatus;
@end
@protocol trendDetailCommentParserDelegate <NSObject>

-(void)successTrendCommentListArr:(NSMutableArray*)commentArr withTotal:(NSString*)total;
-(void)successTrendCommentTwoListArr:(NSMutableArray*)commentArr;

-(void)failedMethod:(NSString*)message;
@end
NS_ASSUME_NONNULL_END
