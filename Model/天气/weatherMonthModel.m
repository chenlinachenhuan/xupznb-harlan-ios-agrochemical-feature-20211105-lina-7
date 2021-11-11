//
//  weatherMonthModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/18.
//

#import "weatherMonthModel.h"

@implementation weatherMonthModel
-(id)initWithData:(NSDictionary*)dic
{
    if (self==[super init]) {
        self.fxDate = [dic objectForKey:@"fxDate"];
        self.fxDateDesc = [dic objectForKey:@"fxDateDesc"];
        self.tempMax = [dic objectForKey:@"tempMax"];
        self.tempMin = [dic objectForKey:@"tempMin"];
        self.iconDay = [dic objectForKey:@"iconDay"];
        self.textDay = [dic objectForKey:@"textDay"];
         

    }
    return self;
}
@end
