//
//  productSKUModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/2.
//

#import "productSKUModel.h"

@implementation productSKUModel
-(id)initWithData:(NSDictionary*)dic{
    if (self==[super init]) {
        self.myId = dic[@"id"];
        self.productId = dic[@"productId"];
        self.skuCode = dic[@"skuCode"];
        self.freight = dic[@"freight"];
        self.marketPrice = dic[@"marketPrice"];
        self.mallPrice = dic[@"mallPrice"];
        self.pic = dic[@"pic"];
        self.spec1Val = dic[@"spec1Val"];
        self.spec2Val = dic[@"spec2Val"];
        self.spec3Val = dic[@"spec3Val"];
        self.saleNum = dic[@"saleNum"];
        self.lockStock = dic[@"lockStock"];
        self.stock = dic[@"stock"];

    }
    return self;
}
@end
