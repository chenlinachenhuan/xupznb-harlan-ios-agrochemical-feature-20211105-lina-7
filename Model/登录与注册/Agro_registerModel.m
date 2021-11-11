//
//  Agro_registerModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/7.
//

#import "Agro_registerModel.h"

@implementation Agro_registerModel
- (id)initWithData:(NSDictionary *)data
{
    self = [super init];
    
    if (self)
    {
        self.checkStatus = [NSString stringWithFormat:@"%@",[data objectForKey:@"checkStatus"]];
        self.harlanId = [data objectForKey:@"harlanId"];
        self.token = [data objectForKey:@"token"];
        self.icon = [data objectForKey:@"icon"];
        self.Agro_id = [data objectForKey:@"Agro_id"];
        self.nickName = [data objectForKey:@"nickName"];
        self.phone = [data objectForKey:@"phone"];
        self.tokenHead = [data objectForKey:@"tokenHead"];
        self.userName = [data objectForKey:@"userName"];
        self.userSig = [data objectForKey:@"userSig"];

    }
    
    return self;
}
@end
