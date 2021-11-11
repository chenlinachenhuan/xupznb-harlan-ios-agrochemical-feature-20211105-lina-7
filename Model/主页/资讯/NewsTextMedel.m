//
//  NewsTextMedel.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/15.
//

#import "NewsTextMedel.h"

@implementation NewsTextMedel
- (id)initWithData:(NSDictionary *)data{
    if (self==[super init]) {
        self.albumPics = [data objectForKey:@"albumPics"];
        self.cat2Name =[data objectForKey:@"cat2Name"];
        self.pic =[data objectForKey:@"pic"] ;
        self.pubTime =[data objectForKey:@"pubTime"];
        self.title =[data objectForKey:@"title"];
        self.viewNum =[NSString stringWithFormat:@"%@",[data objectForKey:@"viewNum"]];
        self.myId = [NSString stringWithFormat:@"%@",[data objectForKey:@"id"]];
    }
    return self;
}
@end
