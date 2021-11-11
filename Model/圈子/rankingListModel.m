//
//  rankingListModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/27.
//

#import "rankingListModel.h"

@implementation rankingListModel
- (id)initWithData:(NSDictionary *)data
{
    self = [super init];
    
    if (self){
        self.myId = data[@"id"];
        self.title = data[@"title"];
        self.showStatus = data[@"showStatus"];
    }
    return self;
}
@end
