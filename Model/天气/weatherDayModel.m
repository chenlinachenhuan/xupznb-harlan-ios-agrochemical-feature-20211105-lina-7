//
//  weatherDayModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/18.
//

#import "weatherDayModel.h"

@implementation weatherDayModel
-(id)initWithData:(NSDictionary*)dic
{
    if (self==[super init]) {
        self.fxTime = [dic objectForKey:@"fxTime"];
        self.temp = [dic objectForKey:@"temp"];
        self.icon = [dic objectForKey:@"icon"];
        
         

    }
    return self;
}
@end
