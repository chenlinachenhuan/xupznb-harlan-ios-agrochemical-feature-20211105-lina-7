//
//  addressTextModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/28.
//

#import "addressTextModel.h"

@implementation addressTextModel
-(id)initWithData:(NSDictionary*)dic{
    if (self==[super init]) {
        self.name = dic[@"name"];
        self.phone = dic[@"phoneNumber"];
        self.address = dic[@"detailAddress"];
        self.province=dic[@"province"];
        self.defaultStatus=dic[@"defaultStatus"];
        self.city=dic[@"city"];
        self.region=dic[@"region"];
        self.myId=dic[@"id"];
        self.provinceId=dic[@"provinceId"];
        self.cityId=dic[@"cityId"];
        self.regionId=dic[@"areaId"];

    }
    return self;
}
@end
