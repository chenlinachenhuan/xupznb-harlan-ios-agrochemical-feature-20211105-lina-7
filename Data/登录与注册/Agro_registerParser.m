//
//  Agro_registerParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/7.
//

#import "Agro_registerParser.h"
@implementation Agro_registerParser
- (void)registerWithUsername:(NSString *)username password:(NSString *)password authCode:(NSString*)authCode
{
    NSDictionary * dic=@{@"password":password,@"name":username,@"authCode":authCode};
    [self PostRequestDataWithControlParam:dic url:Request_register BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        if ([dataDic[@"code"] intValue]==200) {
            NSLog(@"%@",dataDic);
            [self.myDelegate registerSuccess];
        }else{
            [[ChrysanthemumIndexView sharedMasterUser] remove];
            [self.myDelegate failedMethod:dataDic[@"message"]];
            
        }
    }];
}
@end
