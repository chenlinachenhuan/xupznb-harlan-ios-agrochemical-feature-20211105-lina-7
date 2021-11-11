//
//  newsDetailTextView.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/18.
//

#import "newsDetailTextModel.h"

@implementation newsDetailTextModel
- (id)initWithData:(NSDictionary *)data{
    if (self==[super init]) {
        self.content = [data objectForKey:@"content"];
        self.cat2Name =[data objectForKey:@"cat2Name"];
        self.catName =[data objectForKey:@"catName"];
        self.title =[data objectForKey:@"title"];
//        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//        NSString *dateString =[data objectForKey:@"updateTime"];
//        NSTimeZone *timezone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
//        [formatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
//        NSDate *someDay = [formatter dateFromString:dateString];
//        NSLog(@"%@", someDay);


        self.updateTime =[data objectForKey:@"updateTime"];
    }
    return self;
}

@end
