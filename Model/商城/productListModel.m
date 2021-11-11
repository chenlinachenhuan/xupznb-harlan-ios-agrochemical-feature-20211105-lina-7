//
//  productListModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/1.
//

#import "productListModel.h"

@implementation productListModel
-(id)initWithData:(NSDictionary*)dic{
    if (self==[super init]) {
        self.myId = [dic objectForKey:@"id"];
        self.name = [dic objectForKey:@"name"];
        self.pic = [dic objectForKey:@"pic"];
        self.departure = [dic objectForKey:@"departure"];
        self.minFreight = [dic objectForKey:@"minFreight"];
        self.maxFreight = [dic objectForKey:@"maxFreight"];
        self.mallMinPrice = [dic objectForKey:@"mallMinPrice"];
        self.mallMaxPrice = [dic objectForKey:@"mallMaxPrice"];
        self.marketMinPrice = [dic objectForKey:@"marketMinPrice"];
        self.marketMaxPrice = [dic objectForKey:@"marketMaxPrice"];
        self.saleNum = [dic objectForKey:@"saleNum"];

    }
    return self;
}
@end
