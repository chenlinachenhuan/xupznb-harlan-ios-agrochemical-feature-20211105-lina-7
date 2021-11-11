//
//  knowledgeListModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import "knowledgeListModel.h"

@implementation knowledgeListModel
- (id)initWithData:(NSDictionary *)data{
    if (self==[super init]) {
        self.albumPics = [data objectForKey:@"albumPics"];
        self.cat2Name =[data objectForKey:@"cat2Name"];
        self.pic =[data objectForKey:@"pic"] ;
        self.pubTime =[data objectForKey:@"pubTime"];
        self.title =[data objectForKey:@"title"];
        self.viewNum =[NSString stringWithFormat:@"%@",[data objectForKey:@"viewNum"]];
        self.myId = [NSString stringWithFormat:@"%@",[data objectForKey:@"id"]];
        self.cropId = [NSString stringWithFormat:@"%@",[data objectForKey:@"cropId"]];
        self.cropName = [data objectForKey:@"cropName"];
        self.typeId = [data objectForKey:@"typeId"];

    }
    return self;
}
@end
