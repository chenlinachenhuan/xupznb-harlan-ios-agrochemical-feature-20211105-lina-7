//
//  Agro_loginParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/7.
//

#import "Agro_loginParser.h"

@implementation Agro_loginParser
- (void)loginWithUsername:(NSString *)username password:(NSString *)password 
{
    NSDictionary * dic=@{@"password":password,@"name":username};
    
    [self PostRequestDataWithControlParam:dic url:Request_login BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        if ([dataDic[@"code"] intValue]==200) {
            NSLog(@"%@",dataDic);
            Agro_loginModel * model = [[Agro_loginModel alloc] initWithData:dataDic[@"data"]];
            [self.myDelegate successLoginMethod:model];
        }else{
            [[ChrysanthemumIndexView sharedMasterUser] remove];
            [self.myDelegate failedMethod:dataDic[@"message"]];
        }
    }];
}
@end
