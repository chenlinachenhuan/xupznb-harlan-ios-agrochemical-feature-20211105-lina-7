//
//  trendCreateParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/21.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol trendCreateParserDelegate;
@interface trendCreateParser : BaseDataParser
@property(nonatomic,weak)id<trendCreateParserDelegate>myDelegate;
-(void)requestAlbumPics:(NSString*)albumPics content:(NSString*)content typeId:(NSInteger)typeId title:(NSString*)title;
@end
@protocol trendCreateParserDelegate <NSObject>

-(void)successCreateTrend;
-(void)failedMethod:(NSString*)message;

@end
NS_ASSUME_NONNULL_END
