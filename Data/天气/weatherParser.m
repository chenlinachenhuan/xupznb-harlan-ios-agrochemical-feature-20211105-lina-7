//
//  weatherParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/19.
//

#import "weatherParser.h"

@implementation weatherParser
-(void)requestWeather:(CGFloat)latitude withLongitude:(CGFloat)longitude{
    NSDictionary * dic = @{@"location":[NSString stringWithFormat:@"%.2f,%.2f",longitude,latitude]};
    [self PostRequestDataWithControlParam:dic url:Request_weatherNew BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        if ([dataDic[@"code"] intValue]==200) {
            weatherModel * model = [[weatherModel alloc] initWithData:dataDic[@"data"]];
            [self.myDelegate successWeatherNows:model];
        }else{
            [self.myDelegate failedMethod:dataDic[@"message"]];
           

        }
    }];
}
@end
