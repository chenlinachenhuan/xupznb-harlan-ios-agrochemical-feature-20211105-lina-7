//
//  trendCommentChildListParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/27.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol trendCommentChildListParserDelegate;
@interface trendCommentChildListParser : BaseDataParser
@property(nonatomic,assign)id<trendCommentChildListParserDelegate>myDelegate;
-(void)requestTrendCommentChildListId:(int64_t)myId orderStatus:(int32_t)orderStatus pageNum:(int32_t)pageNum pageSize:(int32_t)pageSize parentId:(int64_t)parentId pubTimeStatus:(int32_t)pubTimeStatus showStatus:(int32_t)showStatus;
@end
@protocol trendCommentChildListParserDelegate <NSObject>

-(void)successTrendCommentChildListArr:(NSMutableArray*)commentArr withTotal:(NSString*)total;
//-(void)successTrendCommentTwoListArr:(NSMutableArray*)commentArr;

-(void)failedMethod:(NSString*)message;
@end
NS_ASSUME_NONNULL_END
