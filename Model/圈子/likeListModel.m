//
//  likeListModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/27.
//

#import "likeListModel.h"

@implementation likeListModel
- (id)initWithData:(NSDictionary *)data
{
    self = [super init];
    
    if (self){
        self.memberId = data[@"memberId"];
        self.avatar = data[@"avatar"];
        self.nickname = data[@"nickname"];
        self.followStatus = data[@"followStatus"];
        self.sortTrend = data[@"sortTrend"];
        self.sortNum = data[@"sortNum"];

    }
    return self;
}
@end
