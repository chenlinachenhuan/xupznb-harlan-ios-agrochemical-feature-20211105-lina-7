//
//  knowledgeCatListModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import "knowledgeCatListModel.h"

@implementation knowledgeCatListModel
- (id)initWithData:(NSDictionary *)data{
    if (self==[super init]) {
         
        self.myId = [NSString stringWithFormat:@"%@",[data objectForKey:@"id"]];
        self.dictValue = [data objectForKey:@"dictValue"];

    }
    return self;
}
@end
