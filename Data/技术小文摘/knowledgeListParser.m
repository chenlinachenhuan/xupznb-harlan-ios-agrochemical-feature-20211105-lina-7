//
//  knowledgeListParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import "knowledgeListParser.h"
#import "knowledgeListModel.h"

@implementation knowledgeListParser
-(void)requestWithCat2Id:(UInt64)cat2Id withCatId:(UInt64)catId withKeyWord:(NSString*)keyWord withPageNum:(UInt32)pageNum withPageSize:(UInt32)pageSize withShowStatus:(UInt32)showStatus withCropId:(UInt64)cropId{
    NSDictionary * dic=@{@"cat2Id":[commonMethod transIntToNSNumber64:cat2Id],@"catId":[commonMethod transIntToNSNumber64:catId],@"keyword":keyWord,@"pageNum":[commonMethod transIntToNSNumber32:pageNum],@"pageSize":[commonMethod transIntToNSNumber32:pageSize],@"showStatus":[commonMethod transIntToNSNumber32:showStatus],@"cropId":[commonMethod transIntToNSNumber64:cropId]};
    NSMutableArray * dataArr = [[NSMutableArray alloc] init];
    [self PostRequestDataWithControlParam:dic url:Request_knowledgeList BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        [dataDic objectForKey:@"data"];
        for (NSDictionary * dic in [[dataDic objectForKey:@"data"] objectForKey:@"list"]) {
            knowledgeListModel * model = [[knowledgeListModel alloc] initWithData:dic];
            [dataArr addObject:model];
        }
        [self.myDelegate successGetList:dataArr total:[dataDic[@"data"][@"total"] integerValue]];
    }];
}
@end
