//
//  classDetailIntroduceModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/28.
//

#import "classDetailIntroduceModel.h"
#import "classContentModel.h"
@implementation classDetailIntroduceModel
- (id)initWithData:(NSDictionary *)data
{
    if (self==[super init]) {
        self.myId = data[@"id"];
        self.proficientId = data[@"proficientId"];
        self.proficientName = data[@"proficientName"];
        self.harlanId = data[@"harlanId"];
        self.cropId = data[@"cropId"];
        self.crop2Id = data[@"crop2Id"];
        self.catId = data[@"catId"];
        self.cat2Id = data[@"cat2Id"];
        self.title = data[@"title"];
        self.pic = data[@"pic"];
        self.remark = data[@"remark"];
        self.viewNum = data[@"viewNum"];
        self.curriculumNum = data[@"curriculumNum"];
        self.mallPrice = data[@"mallPrice"];
        self.publishStatus = data[@"publishStatus"];
        self.suitable = data[@"suitable"];
        self.tag = data[@"tag"];
        self.marketPrice = data[@"marketPrice"];
        self.saleNum = data[@"saleNum"];
        self.score = data[@"score"];
        self.shareNum = data[@"shareNum"];
        self.commentNum = data[@"commentNum"];
        self.pubTime = data[@"pubTime"];
        self.updateTime = data[@"updateTime"];
        self.proficientIcon = data[@"proficientIcon"];
        if ([data[@"proficientContent"] isKindOfClass:[NSNull class]]) {
            self.proficientContent =@"";
        }else{
            self.proficientContent = data[@"proficientContent"];

        }
         self.proficientBelong = data[@"proficientBelong"];
        self.proficientOnlineStatus = data[@"proficientOnlineStatus"];
        self.fabulousStatus = data[@"fabulousStatus"];
        self.payStatus = data[@"payStatus"];
        self.isSelf = data[@"isSelf"];
    }
    return self;
}
@end
