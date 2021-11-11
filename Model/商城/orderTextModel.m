//
//  orderTextModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/4.
//

#import "orderTextModel.h"
#import "shopOrderModel.h"
@implementation orderTextModel
-(id)initWithDAta:(NSDictionary*)dic{
    if (self==[super init]) {
        self.totalAmount = dic[@"calcAmount"][@"totalAmount"];
        self.freightAmount = dic[@"calcAmount"][@"freightAmount"];
        self.promotionAmount = dic[@"calcAmount"][@"promotionAmount"];
        self.payAmount = dic[@"calcAmount"][@"payAmount"];
        self.cartPromotionItemList = [[NSMutableArray alloc] init];
        for (NSDictionary*dicc in dic[@"cartPromotionItemList"]) {
            shopOrderModel*modle = [[shopOrderModel alloc] initWithDAta:dicc];
            [self.cartPromotionItemList addObject:modle];
        }
    }
    return self;
}
@end
