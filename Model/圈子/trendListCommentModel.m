//
//  trendListCommentModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/19.
//

#import "trendListCommentModel.h"

@implementation trendListCommentModel
- (id)initWithData:(NSDictionary *)data{
    if (self==[super init]) {
        self.nickname = [data objectForKey:@"nickname"];
        self.content = [data objectForKey:@"content"];
        
        
    }
    return self;
     
}
@end
