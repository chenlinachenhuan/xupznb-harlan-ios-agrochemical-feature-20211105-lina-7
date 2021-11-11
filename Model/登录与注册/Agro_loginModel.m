//
//  Agro_loginModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/7.
//

#import "Agro_loginModel.h"

@implementation Agro_loginModel
- (id)initWithData:(NSDictionary *)data
{
    self = [super init];
    
    if (self)
    {
        self.proficientLevel = [NSString stringWithFormat:@"%@",[data objectForKey:@"proficientLevel"]];
        self.harlanId = [data objectForKey:@"harlanId"];
        self.token = [data objectForKey:@"token"];
        self.avatar = [data objectForKey:@"avatar"];
        self.shopStatus = [data objectForKey:@"shopStatus"];
        self.nickName = [data objectForKey:@"nickName"];
        self.tokenHead = [data objectForKey:@"tokenHead"];
        self.username = [data objectForKey:@"username"];
        self.userSig = [data objectForKey:@"userSig"];
        self.myId = [data objectForKey:@"id"];
    }
    
    return self;
}
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.proficientLevel forKey:@"proficientLevel"];
    [aCoder encodeObject:self.harlanId forKey:@"harlanId"];
    [aCoder encodeObject:self.token forKey:@"token"];
    [aCoder encodeObject:self.avatar forKey:@"avatar"];
    [aCoder encodeObject:self.shopStatus forKey:@"shopStatus"];
    [aCoder encodeObject:self.nickName forKey:@"nickName"];
    [aCoder encodeObject:self.tokenHead forKey:@"tokenHead"];
    [aCoder encodeObject:self.username forKey:@"username"];
    [aCoder encodeObject:self.userSig forKey:@"userSig"];
    [aCoder encodeObject:self.myId forKey:@"myId"];

}
-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super init]) {
        self.proficientLevel = [aDecoder decodeObjectForKey:@"proficientLevel"];
        self.harlanId = [aDecoder decodeObjectForKey:@"harlanId"];
        self.token = [aDecoder decodeObjectForKey:@"token"];
        self.avatar = [aDecoder decodeObjectForKey:@"avatar"];
        self.shopStatus = [aDecoder decodeObjectForKey:@"shopStatus"];
        self.nickName = [aDecoder decodeObjectForKey:@"nickName"];
        self.tokenHead = [aDecoder decodeObjectForKey:@"tokenHead"];
        self.username = [aDecoder decodeObjectForKey:@"username"];
        self.userSig = [aDecoder decodeObjectForKey:@"userSig"];
        self.myId = [aDecoder decodeObjectForKey:@"myId"];

    }
    return self;
}
@end
