//
//  exportListModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/10.
//

#import "exportListModel.h"

@implementation exportListModel
-(id)initWithData:(NSDictionary*)dic{
    if (self==[super init]) {
        self.memberId = dic[@"memberId"];
        self.nickname = dic[@"nickname"];
        self.harlanId = dic[@"harlanId"];
        self.proficientIcon = dic[@"proficientIcon"];
        self.proficientLevel = dic[@"proficientLevel"];
        self.cropId = dic[@"cropId"];
        self.cropName = dic[@"cropName"];
        self.proficientBelong = dic[@"proficientBelong"];
        self.proficientInStatus = dic[@"proficientInStatus"];
        self.proficientClassStatus = dic[@"proficientClassStatus"];
        self.proficientOnlineStatus = dic[@"proficientOnlineStatus"];
        self.proficientType = dic[@"proficientType"];
        self.proficientTypeName = dic[@"proficientTypeName"];

    }
    return self;
}
@end
