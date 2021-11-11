//
//  policyDetailModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import "policyDetailModel.h"

@implementation policyDetailModel
-(id)initWithData:(NSDictionary*)dic{
    if (self==[super init]) {
        self.myId = dic[@"id"];
        self.title = dic[@"title"];
        self.pic = dic[@"pic"];
        self.albumPics = dic[@"albumPics"];
        self.viewNum = dic[@"viewNum"];
        self.pubTime = dic[@"pubTime"];
        self.cat2Id = dic[@"cat2Id"];
        self.cat2Name = dic[@"cat2Name"];
        self.cropId = dic[@"cropId"];
        self.cropName = dic[@"cropName"];
        self.provinceId = dic[@"provinceId"];
        self.provinceDesc = dic[@"provinceDesc"];
        self.cityId = dic[@"cityId"];
        self.cityDesc = dic[@"cityDesc"];
        self.areaId = dic[@"areaId"];
        self.areaDesc = dic[@"areaDesc"];
        self.catId = dic[@"catId"];
        self.typeId = dic[@"typeId"];
        self.followNum = dic[@"followNum"];
        self.fabulousNum = dic[@"fabulousNum"];
        self.shareNum = dic[@"shareNum"];
        self.commentNum = dic[@"commentNum"];
        self.showStatus = dic[@"showStatus"];
        self.pubTime = dic[@"pubTime"];
        self.updateTime = dic[@"updateTime"];
        self.content = dic[@"content"];
        self.catName = dic[@"catName"];
        self.cat2Name = dic[@"cat2Name"];
        self.cropName = dic[@"cropName"];

    }
    return self;
}
@end
