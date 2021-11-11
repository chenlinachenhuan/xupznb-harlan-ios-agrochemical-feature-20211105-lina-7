//
//  sendMsgParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/21.
//

#import "sendMsgParser.h"

@implementation sendMsgParser
-(void)requestWithName:(NSString*)name type:(NSInteger)type{
    NSDictionary * dic = @{@"name":name,@"type":[NSNumber numberWithInteger:type]};
    [self PostRequestDataWithControlParam:dic url:Request_sendMsg BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        if ([dataDic[@"code"] intValue]==200) {
            [self.myDelegate successSendMsg];
        }else{
            [[ChrysanthemumIndexView sharedMasterUser] remove];
            [self.myDelegate failedMethod:dataDic[@"message"]];
        }
    }];
}
@end
