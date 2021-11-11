//
//  weChatPay.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/5.
//

#import "weChatPay.h"

@implementation weChatPay
-(void)requestWechatPay:(NSInteger)orderId returnUrl:(NSString*)returnUrl{
    NSDictionary * dic = @{@"orderId":[NSNumber numberWithInteger:orderId],@"returnUrl":returnUrl};
    [self PostRequestDataWithControlParam:dic url:Request_wechatPay BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        weChatPayModel * model = [[weChatPayModel alloc] initWithData:dataDic[@"data"]];
        [self.myDelegate successWechatPay:model];
    }];
}
@end
