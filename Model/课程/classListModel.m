//
//  classListModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/10.
//

#import "classListModel.h"

@implementation classListModel
-(id)initWithData:(NSDictionary*)dic{
    if (self==[super init]) {
        self.myId = dic[@"id"];
        self.proficientId = dic[@"proficientId"];
        self.proficientName = dic[@"proficientName"];
        self.harlanId = dic[@"harlanId"];
        self.proficientType = dic[@"proficientType"];
        self.proficientTypeName = dic[@"proficientTypeName"];
        self.title = dic[@"title"];
        self.pic = dic[@"pic"];
        self.remark = dic[@"remark"];
        self.viewNum = dic[@"viewNum"];
        self.curriculumNum = dic[@"curriculumNum"];
        self.mallPrice = dic[@"mallPrice"];
        self.publishStatus = dic[@"publishStatus"];

    }
    return self;
}
@end
