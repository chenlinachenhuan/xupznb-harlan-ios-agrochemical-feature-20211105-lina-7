//
//  goodsOrderModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/4.
//

#import "goodsOrderModel.h"

@implementation goodsOrderModel
-(id)initWithDAta:(NSDictionary*)dic{
    if (self==[super init]) {
        self.myId = dic[@"id"];
        self.shopId = dic[@"shopId"];
        self.productId = dic[@"productId"];
        self.productSkuId = dic[@"productSkuId"];
        self.quantity = dic[@"quantity"];
        self.mallPrice = dic[@"mallPrice"];
        self.totalAmount = dic[@"totalAmount"];
        self.pic = dic[@"pic"];
        self.name = dic[@"name"];
        self.productCategoryId = dic[@"productCategoryId"];
        self.spec1 = dic[@"spec1"];
        self.productSkuCode = dic[@"productSkuCode"];
        self.freight = dic[@"freight"];
        self.spec1Val = dic[@"spec1Val"];
        self.reduceAmount = dic[@"reduceAmount"];
        self.realStock = dic[@"realStock"];
        self.integration = dic[@"integration"];
        self.growth = dic[@"growth"];

    }
    return self;
}
@end
