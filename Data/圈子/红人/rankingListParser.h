//
//  rankingListParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/27.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol rankingListParserDelegate;
@interface rankingListParser : BaseDataParser
@property(nonatomic,weak)id<rankingListParserDelegate>myDelegate;
-(void)requestRankingList;
@end
@protocol rankingListParserDelegate  <NSObject>

-(void)successGetRankingList:(NSMutableArray*)arr;
-(void)failedMethod:(NSString*)message;
@end
NS_ASSUME_NONNULL_END
