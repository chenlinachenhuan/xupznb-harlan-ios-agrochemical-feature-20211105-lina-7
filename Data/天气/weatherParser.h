//
//  weatherParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/19.
//

#import "BaseDataParser.h"
#import "weatherModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol weatherParserDelegate;
@interface weatherParser : BaseDataParser
@property(nonatomic,assign)id< weatherParserDelegate> myDelegate;
-(void)requestWeather:(CGFloat)latitude withLongitude:(CGFloat)longitude;
@end
@protocol weatherParserDelegate <NSObject>

-(void)successWeatherNows:(weatherModel*)model;
-(void)failedMethod:(NSString*)message;
@end
NS_ASSUME_NONNULL_END
