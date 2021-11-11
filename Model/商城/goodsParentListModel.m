//
//  goodsParentListModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/1.
//

#import "goodsParentListModel.h"
#import "goodsChildrenListModel.h"
@implementation goodsParentListModel
-(id)initWithData:(NSDictionary*)dic{
    if (self==[super init]) {
        
        self.myId = [dic objectForKey:@"id"];
        self.name = [dic objectForKey:@"dictValue"];
        self.childArr = [[NSMutableArray alloc] init];
        for (NSDictionary * dics in [dic objectForKey:@"children"]) {
            goodsChildrenListModel * model = [[goodsChildrenListModel alloc] initWithData:dics];
            [self.childArr addObject:model];
        }
        
    }
    return self;
}
@end
