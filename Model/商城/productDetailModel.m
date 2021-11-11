//
//  productDetailModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/2.
//

#import "productDetailModel.h"
#import "productSKUModel.h"
#import "guaranteeBaseListModel.h"
@implementation productDetailModel
-(id)initWithData:(NSDictionary*)dic{
    if (self==[super init]) {
        self.name = dic[@"product"][@"name"];
        self.shopId = dic[@"product"][@"shopId"];
        self.albumPics = dic[@"product"][@"albumPics"];
        self.marketMinPrice = dic[@"product"][@"marketMinPrice"];
        self.marketMaxPrice = dic[@"product"][@"marketMaxPrice"];
        self.mallMinPrice = dic[@"product"][@"mallMinPrice"];
        self.mallMaxPrice = dic[@"product"][@"mallMaxPrice"];
        self.departure = dic[@"product"][@"departure"];
        self.isSelf = dic[@"product"][@"isSelf"];
        if ([self.isSelf isKindOfClass:[NSNull class]] ) {
            self.isSelf=@"";
        }
        self.collectionStatus = dic[@"product"][@"collectionStatus"];
        self.appraiseNum = dic[@"product"][@"appraiseNum"];
        self.saleNum =dic[@"product"][@"saleNum"];
        self.shopName =dic[@"shop"][@"shopName"];
        self.productNum =dic[@"shop"][@"productNum"];
        self.productNewNum =dic[@"shop"][@"productNewNum"];
        self.collectionNum =dic[@"shop"][@"collectionNum"];
        self.typeArr = [[NSMutableArray alloc]init];
        for (NSDictionary *dicc in dic[@"skuStockList"]) {
            productSKUModel * model = [[productSKUModel alloc] initWithData:dicc];
            [self.typeArr addObject:model];
        }
        self.spec1List =dic[@"spec1List"];
        self.spec2List =dic[@"spec2List"];
        self.spec3List =dic[@"spec3List"];
        self.guaranteeBaseList = [[NSMutableArray alloc] init];
        for (NSDictionary * dicc in dic[@"guaranteeBaseList"]) {
            guaranteeBaseListModel * model = [[guaranteeBaseListModel alloc] initWithData:dicc];
            [self.guaranteeBaseList addObject:model];
        }
        self.attributeList = [[NSMutableArray alloc] init];
        for (NSDictionary * dicc in dic[@"attributeList"]) {
//            guaranteeBaseListModel * model = [[guaranteeBaseListModel alloc] initWithData:dicc];
//            [self.guaranteeBaseList addObject:model];
        }
    }
    return self;
}
@end
