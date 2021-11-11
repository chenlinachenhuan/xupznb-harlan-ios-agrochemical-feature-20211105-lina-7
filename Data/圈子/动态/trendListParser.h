//
//  trendListParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/19.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol trendListParserDelegate;
@interface trendListParser : BaseDataParser
@property(nonatomic,weak)id<trendListParserDelegate>myDelegate;
-(void)requestWithCatId:(int64_t)catId keyword:(NSString*)keyword pageNum:(int32_t)pageNum pageSize:(int32_t)pageSize showStatus:(int32_t)showStatus;
@end
@protocol trendListParserDelegate <NSObject>

-(void)successTrendListMethod:(NSMutableArray *)listArr withTotal:(NSString*)total;
-(void)failedMethod:(NSString*)message;
@end
NS_ASSUME_NONNULL_END
