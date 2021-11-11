//
//  childrenByPidParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import "childrenByPidParser.h"
#import "knowledgeCatListModel.h"
@implementation childrenByPidParser
-(void)requestKnowledgeCatList{
    NSDictionary * dic =@{@"parentId":[NSNumber numberWithInteger:333]};
    [self GetRequestDataWithControlParam:dic url:Request_childrenByPid BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        NSMutableArray * arr = [[NSMutableArray alloc] init];
        for (NSDictionary*dic in dataDic[@"data"]) {
            knowledgeCatListModel * model = [[knowledgeCatListModel alloc] initWithData:dic];
            [arr addObject:model];
        }
        [self.myDelegate successGetKnowledgeCatList:arr];
    }];
}
-(void)requestNewsCatList{
    NSDictionary * dic =@{@"parentId":[NSNumber numberWithInteger:325]};
    [self GetRequestDataWithControlParam:dic url:Request_childrenByPid BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        NSMutableArray * arr = [[NSMutableArray alloc] init];
        for (NSDictionary*dic in dataDic[@"data"]) {
            knowledgeCatListModel * model = [[knowledgeCatListModel alloc] initWithData:dic];
            [arr addObject:model];
        }
        [self.myDelegate successGetNewsCatList:arr];
    }];
}
-(void)requestPolicyCatList{
    NSDictionary * dic =@{@"parentId":[NSNumber numberWithInteger:324]};
    [self GetRequestDataWithControlParam:dic url:Request_childrenByPid BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        NSMutableArray * arr = [[NSMutableArray alloc] init];
        for (NSDictionary*dic in dataDic[@"data"]) {
            knowledgeCatListModel * model = [[knowledgeCatListModel alloc] initWithData:dic];
            [arr addObject:model];
        }
        [self.myDelegate successGetPolicyCatList:arr];
    }];
}
@end
