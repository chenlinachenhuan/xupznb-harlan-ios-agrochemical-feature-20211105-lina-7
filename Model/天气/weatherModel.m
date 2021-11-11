//
//  weatherModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/17.
//

#import "weatherModel.h"

@implementation weatherModel
-(id)initWithData:(NSDictionary*)dic
{
    if (self==[super init]) {
        self.text = [dic objectForKey:@"text"];
        self.textDesc = [dic objectForKey:@"textDesc"];
        self.icon = [dic objectForKey:@"icon"];
        self.windScale = [dic objectForKey:@"windScale"];
        self.windDir = [dic objectForKey:@"windDir"];
        self.uvDescription = [dic objectForKey:@"uvDescription"];
        self.humidity = [dic objectForKey:@"humidity"];
        self.warnTitle = [dic objectForKey:@"warnTitle"];
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yyyy/MM/dd"];//yyyy年MM月dd日
        NSString *dateString = [dic objectForKey:@"updateTime"];
        NSRange range = NSMakeRange(0, 10);
        dateString = [dateString substringWithRange:range];//误区** 字符串长度必须与formatter长度对应一致 不然date就是nil
        NSDate *date = [formatter dateFromString:dateString];
//                    [formatter setDateFormat:@"yyyy年MM月dd日"];
         self.updateTime = [formatter stringFromDate:date];
        self.aqi = [[dic objectForKey:@"aqi"] objectForKey:@"category"];
        self.dayListArr =[[NSMutableArray alloc] init]  ;
        for (NSDictionary*dic1 in [dic objectForKey:@"dayList"]) {
            weatherMonthModel * model = [[weatherMonthModel alloc] initWithData:dic1];
            [self.dayListArr addObject:model];
        }
        self.hourListArr =[[NSMutableArray alloc] init]  ;
        for (NSDictionary*dic1 in [dic objectForKey:@"hourList"]) {
            weatherDayModel * model = [[weatherDayModel alloc] initWithData:dic1];
            [self.hourListArr addObject:model];
        }
        self.temp = [dic objectForKey:@"temp"];
    }
    return self;
}
@end
