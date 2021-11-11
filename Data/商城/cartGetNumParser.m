//
//  cartGetNumParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/2.
//

#import "cartGetNumParser.h"

@implementation cartGetNumParser
-(void)crequestGetCarGoodsNum{
    [self GetRequestDataWithControlParam:[[NSDictionary alloc]init] url:Request_productCartgetNum BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
            
    }];
}
@end
