//
//  ossModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/26.
//

#import "ossModel.h"

@implementation ossModel
- (id)initWithData:(NSDictionary *)data
{
    self = [super init];
    
    if (self)
    {
        self.securityToken = data[@"securityToken"];
        self.accessKeySecret = data[@"accessKeySecret"];
        self.accessKeyId= data[@"accessKeyId"];
//        self.expiration = data[@"expiration"];
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yyyy-MM-dd"];//yyyy年MM月dd日
        NSString *dateString = [data objectForKey:@"expiration"];
        NSRange range = NSMakeRange(0, 10);
        dateString = [dateString substringWithRange:range];//误区** 字符串长度必须与formatter长度对应一致 不然date就是nil
        NSDate *date = [formatter dateFromString:dateString];
//                    [formatter setDateFormat:@"yyyy年MM月dd日"];
         self.expiration = date;
     }
    
    return self;
}
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.securityToken forKey:@"securityToken"];
    [aCoder encodeObject:self.accessKeySecret forKey:@"accessKeySecret"];
    [aCoder encodeObject:self.accessKeyId forKey:@"accessKeyId"];
    [aCoder encodeObject:self.expiration forKey:@"expiration"];
     
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super init]) {
        self.securityToken = [aDecoder decodeObjectForKey:@"securityToken"];
        self.accessKeySecret = [aDecoder decodeObjectForKey:@"accessKeySecret"];
        self.accessKeyId = [aDecoder decodeObjectForKey:@"accessKeyId"];
        self.expiration = [aDecoder decodeObjectForKey:@"expiration"];
        
    }
    return self;
}
@end
