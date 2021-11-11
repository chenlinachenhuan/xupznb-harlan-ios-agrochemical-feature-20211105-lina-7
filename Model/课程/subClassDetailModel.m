//
//  subClassDetailModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/10.
//

#import "subClassDetailModel.h"

@implementation subClassDetailModel
- (id)initWithData:(NSDictionary *)data
{
    self = [super init];
    
    if (self)
    {
        self.myId = data[@"id"];
        self.title = data[@"title"];
        self.curriculumId = data[@"curriculumId"];
        self.fileType = data[@"fileType"];
        self.fileUrl = data[@"fileUrl"];
        self.viewStatus = data[@"viewStatus"];
        self.playStatus = data[@"playStatus"];
        self.fileId = data[@"fileId"];
        self.viewStatus = data[@"viewStatus"];
        self.viewNum = data[@"viewNum"];
        self.sort = data[@"sort"];
        self.pubTime = data[@"pubTime"];
        self.updateTime = data[@"updateTime"];
        self.playStatus = data[@"playStatus"];
        self.appId = data[@"appId"];
        self.psign = data[@"psign"];

     }
    
    return self;
}
@end
