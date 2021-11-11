//
//  policyCommentListModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import "policyCommentListModel.h"

@implementation policyCommentListModel
-(id)initWithData:(NSDictionary*)dic{
    if (self==[super init]) {
        self.avatar = dic[@"avatar"];
        self.content = dic[@"content"];
        self.fabulousNum = dic[@"fabulousNum"];
        self.fabulousStatus = dic[@"fabulousStatus"];
        self.myId = dic[@"id"];
        self.memberId = dic[@"memberId"];
        self.nickname = dic[@"nickname"];
        self.pubTime = dic[@"pubTime"];
        self.pubTimeOffsetDesc = dic[@"pubTimeOffsetDesc"];

    }
    return self;
}
@end
