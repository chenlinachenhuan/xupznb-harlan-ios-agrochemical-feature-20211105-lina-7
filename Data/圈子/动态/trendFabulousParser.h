//
//  trendFabulousParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/26.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol trendFabulousParserDelegate;
@interface trendFabulousParser : BaseDataParser
@property(nonatomic,weak)id<trendFabulousParserDelegate>myDelegate;
-(void)getTrendFabulous:(NSInteger)myId;

@end
@protocol trendFabulousParserDelegate <NSObject>

-(void)successFabulousTrend;
-(void)failedMethod:(NSString*)message;

@end
NS_ASSUME_NONNULL_END
