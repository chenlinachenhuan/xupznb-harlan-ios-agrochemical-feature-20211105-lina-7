//
//  classContentModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/8.
//

#import "classContentModel.h"

@implementation classContentModel
- (id)initWithData:(NSDictionary *)data
{
    self = [super init];
    
    if (self)
    {
        self.myId = data[@"id"];
        self.title = data[@"title"];
        self.curriculumId = data[@"curriculumId"];
        self.fileType = data[@"fileType"];
        self.studyStatus = data[@"studyStatus"];
        self.viewStatus = data[@"viewStatus"];
        self.playStatus = data[@"playStatus"];

     }
    
    return self;
}
@end
