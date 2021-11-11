//
//  cartListProductModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/2.
//

#import "cartListProductModel.h"
#import "cartProductModel.h"
@implementation cartListProductModel
-(id)initWithData:(NSDictionary*)dic{
    if (self==[super init]) {
        self.shopId = dic[@"shopId"];
        self.shopIcon = dic[@"shopIcon"];
        self.shopName = dic[@"shopName"];
        self.productArr = [[NSMutableArray alloc] init];
        self.selectArr = [[NSMutableArray alloc] init];
        for (NSDictionary*dicc in dic[@"cartList"]) {
            cartProductModel * model = [[cartProductModel alloc]initWithData:dicc];
            [self.productArr addObject:model];
        }

    }
    return self;
}
@end
