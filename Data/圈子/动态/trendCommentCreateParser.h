//
//  trendCommentCreateParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/20.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol trendCommentCreateParserDelegate;
@interface trendCommentCreateParser : BaseDataParser
@property(nonatomic,weak)id<trendCommentCreateParserDelegate>myDelegate;
-(void)requestTrendCommentCreateId:(int64_t)newsId parentId:(int64_t)parentId content:(NSString*)content;
@end
@protocol trendCommentCreateParserDelegate <NSObject>

-(void)successTrendCommentCreate;
-(void)failedMethod:(NSString*)message;

@end

NS_ASSUME_NONNULL_END
