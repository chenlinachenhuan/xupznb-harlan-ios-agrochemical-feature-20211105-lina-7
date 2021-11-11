//
//  addGoodsToCarParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/2.
//

#import "addGoodsToCarParser.h"

@implementation addGoodsToCarParser
-(void)requestAddCar:(NSInteger)memberId productId:(NSInteger)productId productSkuId:(NSInteger)productSkuId quantity:(NSInteger)quantity{
    NSDictionary * dic = @{@"memberId":[NSNumber numberWithInteger:memberId],@"productId":[NSNumber numberWithInteger:productId],@"productSkuId":[NSNumber numberWithInteger:productSkuId],@"quantity":[NSNumber numberWithInteger:quantity]};
    [self PostRequestDataWithControlParam:dic url:Request_productCartAdd BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        [self.myDelegate successAddToCar];
    }];
}
@end
