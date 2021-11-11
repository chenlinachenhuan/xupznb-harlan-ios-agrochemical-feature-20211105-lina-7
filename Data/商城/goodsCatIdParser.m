//
//  goodsCatIdParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/1.
//

#import "goodsCatIdParser.h"
#import "goodsParentListModel.h"
@implementation goodsCatIdParser
-(void)requestWithParentId{
    NSDictionary * dic = @{@"parentId":@348};
    NSMutableArray * arr = [[NSMutableArray alloc] init];
    [self GetRequestDataWithControlParam:dic url:Request_ParentList BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        for (NSDictionary*dic in dataDic[@"data"]) {
            goodsParentListModel * model = [[goodsParentListModel alloc]initWithData:dic];
            [arr addObject:model];
        }
        [self.myDelegate successGetCatParentList:arr];
    }];
}
@end
