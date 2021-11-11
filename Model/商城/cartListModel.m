//
//  cartListModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/2.
//

#import "cartListModel.h"
#import "cartListProductModel.h"
@implementation cartListModel
-(id)initWithData:(NSDictionary*)dic{
    if (self==[super init]) {
        self.shopName = dic[@"shopName"];
        self.cartList = [[NSMutableArray alloc] init];
        for (NSDictionary*dics in dic[@"cartList"]) {
            cartListProductModel * model = [[cartListProductModel alloc] initWithData:dics];
            [self.cartList addObject:model];
        }
    }
    return self;
}
@end
