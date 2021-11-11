//
//  trendDeleteParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/25.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol trendDeleteParserDelegate;
@interface trendDeleteParser : BaseDataParser
@property(nonatomic,weak)id<trendDeleteParserDelegate>myDelegate;
-(void)requestWithMyId:(NSInteger)myId;
@end
@protocol trendDeleteParserDelegate <NSObject>

-(void)successDeleteTrend;
-(void)failedMethod:(NSString*)message;

@end
NS_ASSUME_NONNULL_END
