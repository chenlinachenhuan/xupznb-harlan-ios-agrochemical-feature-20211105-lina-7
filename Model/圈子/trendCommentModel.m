//
//  trendCommentModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/30.
//

#import "trendCommentModel.h"

@implementation trendCommentModel
- (id)initWithData:(NSDictionary *)data
{
    self = [super init];
    
    if (self)
    {
        self.commentArr = [[NSMutableArray alloc] init];
        self.timeStr = [data objectForKey:@"pubTimeOffsetDesc"];
        self.textStr = [data objectForKey:@"content"];
        self.avatar = [data objectForKey:@"avatar"];
        self.nameStr = [data objectForKey:@"nickname"];
        self.myId =[data objectForKey:@"id"];
        self.parentId =[data objectForKey:@"parentId"];

        for (NSDictionary*dic in [data objectForKey:@"commentList"]) {
            trendTwoCommentModel * cModel = [[trendTwoCommentModel alloc] initWithData:dic];
            [self.commentArr addObject:cModel];
            
        }
     }
    
    return self;
}
@end
