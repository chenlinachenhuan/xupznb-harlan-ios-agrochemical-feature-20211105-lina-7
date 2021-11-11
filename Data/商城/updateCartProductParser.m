//
//  updateCartProductParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/2.
//

#import "updateCartProductParser.h"

@implementation updateCartProductParser
-(void)requestUpdate:(NSInteger)myId quantity:(NSInteger)quantity{
    NSDictionary * dic = @{@"id":[NSNumber numberWithInteger:myId],@"quantity":[NSNumber numberWithInteger:quantity]};
    [self PostRequestDataWithControlParam:dic url:Request_productCartList BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        [self.myDelegate successUpdateCarGoods];
    }];
}
@end
