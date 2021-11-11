//
//  verifyAuthCodeParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/21.
//

#import "verifyAuthCodeParser.h"

@implementation verifyAuthCodeParser
-(void)requestWithAuthCode:(NSString*)authCode name:(NSString*)name type:(NSInteger)type{
    NSDictionary*dic = @{@"authCode":authCode,@"name":name,@"type":[NSNumber numberWithInteger:type]};
    [self PostRequestDataWithControlParam:dic url:Request_verifyAuthCode BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        if ([dataDic[@"code"] intValue]==200) {
            [self.myDelegate successVerifyAuthCode:dataDic[@"data"]];
        }else{
            [[ChrysanthemumIndexView sharedMasterUser] remove];

        }
    }];
}
@end
