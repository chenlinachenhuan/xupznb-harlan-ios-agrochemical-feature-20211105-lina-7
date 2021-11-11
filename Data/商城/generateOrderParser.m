//
//  generateOrderParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/4.
//

#import "generateOrderParser.h"

@implementation generateOrderParser
-(void)requestOrder:(NSArray*)cartIds memberReceiveAddressId:(NSInteger)memberReceiveAddressId payLineType:(NSInteger)payLineType payType:(NSInteger)payType quantity:(NSInteger)quantity shippingType:(NSInteger)shippingType shopParams:(NSMutableArray*)arr skuId:(NSInteger)skuId sourceType:(NSInteger)sourceType{
    NSDictionary * dic = @{@"cartIds":cartIds,@"memberReceiveAddressId":[NSNumber numberWithInteger:memberReceiveAddressId],@"payLineType":[NSNumber numberWithInteger:payLineType],@"quantity":[NSNumber numberWithInteger:quantity],@"payType":[NSNumber numberWithInteger:payType],@"shippingType":[NSNumber numberWithInteger:shippingType],@"skuId":[NSNumber numberWithInteger:skuId],@"sourceType":[NSNumber numberWithInteger:sourceType],@"shopParams":arr};
    [self PostRequestDataWithControlParam:dic url:Request_generateOrder BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        [self.myDelegate successGenerateOrderId:[dataDic[@"data"] integerValue]];
    }];
}
@end
