//
//  likeListParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/27.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol likeListParserDelegate;
@interface likeListParser : BaseDataParser
@property(nonatomic,weak)id<likeListParserDelegate>myDelegate;
-(void)requestLikeList:(NSInteger)rankingId;
@end
@protocol likeListParserDelegate  <NSObject>

-(void)successGetLikeList:(NSMutableArray*)arr;
-(void)failedMethod:(NSString*)message;
@end
NS_ASSUME_NONNULL_END
