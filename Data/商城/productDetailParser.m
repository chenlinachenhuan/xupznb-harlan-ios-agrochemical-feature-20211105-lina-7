//
//  productDetailParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/2.
//

#import "productDetailParser.h"
@implementation productDetailParser
-(void)requestProductDetail:(NSInteger)myId{
    NSDictionary * dic = @{@"id":[NSNumber numberWithInteger:myId]};
    [self GetRequestDataWithControlParam:dic url:[NSString stringWithFormat:@"%@%ld",Request_productDetail,(long)myId] BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        productDetailModel * model = [[productDetailModel alloc] initWithData:dataDic[@"data"]];
        [self.myDelegate successGetProductDetailInfo:model];
    }];
    
}
@end
