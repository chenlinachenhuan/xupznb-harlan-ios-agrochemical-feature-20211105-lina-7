//
//  resetPasswordParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/21.
//

#import "resetPasswordParser.h"

@implementation resetPasswordParser
- (void)resetPasswordWithUsername:(NSString *)username password:(NSString *)password authCode:(NSString*)authCode
{
    NSDictionary * dic=@{@"password":password,@"name":username,@"authCode":authCode};
    [self PostRequestDataWithControlParam:dic url:Request_resetPassword BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        if ([dataDic[@"code"] intValue]==200) {
            NSLog(@"%@",dataDic);
            [self.myDelegate resetPasswordSuccess];
        }else{
            [[ChrysanthemumIndexView sharedMasterUser] remove];
            [self.myDelegate failedMethod:dataDic[@"message"]];
        }
    }];
}
@end
