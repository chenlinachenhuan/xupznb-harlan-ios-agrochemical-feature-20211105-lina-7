//
//  newsCommentListTextModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/18.
//

#import "newsCommentListTextModel.h"

@implementation newsCommentListTextModel
- (id)initWithData:(NSDictionary *)data{
    if (self==[super init]) {
        self.content = [data objectForKey:@"content"];
        self.fabulousNum = [data objectForKey:@"fabulousNum"];
        self.nickname = [data objectForKey:@"nickname"];
        self.pubTimeOffsetDesc = [data objectForKey:@"pubTimeOffsetDesc"];
        self.myId = [[data objectForKey:@"id"] integerValue];
        self.fabulousStatus = [[data objectForKey:@"fabulousStatus"] integerValue];
    }
    return self;
}

@end
