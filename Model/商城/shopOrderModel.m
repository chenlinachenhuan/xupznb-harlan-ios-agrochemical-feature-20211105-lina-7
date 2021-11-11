//
//  shopOrderModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/4.
//

#import "shopOrderModel.h"
#import "goodsOrderModel.h"
@implementation shopOrderModel
-(id)initWithDAta:(NSDictionary*)dic{
    if (self==[super init]) {
        self.shopId = dic[@"shopId"];
        self.shopIcon = dic[@"shopIcon"];
        self.shopName = dic[@"shopName"];
        self.freightAmount = dic[@"calcAmount"][@"freightAmount"];
        self.cartList = [[NSMutableArray alloc] init];
        for (NSDictionary*dicc in dic[@"cartList"]) {
            goodsOrderModel * model = [[goodsOrderModel alloc] initWithDAta:dicc];
            [self.cartList addObject:model];
        }

    }
    return self;
}
@end
