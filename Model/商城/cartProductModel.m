//
//  cartProductModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/2.
//

#import "cartProductModel.h"

@implementation cartProductModel
-(id)initWithData:(NSDictionary*)dic{
    if (self==[super init]) {
        self.mallPrice = dic[@"mallPrice"];
        self.name = dic[@"name"];
        self.pic = dic[@"pic"];
        self.productId = dic[@"productId"];
        self.productSkuId = dic[@"productSkuId"];
        self.quantity = dic[@"quantity"];
        self.spec1 = dic[@"spec1Val"];
        self.myId = dic[@"id"];
        self.shopId = dic[@"shopId"];


    }
    return self;
}
@end
