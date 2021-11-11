//
//  newsCommentListParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/18.
//

#import "newsCommentListParser.h"

@implementation newsCommentListParser
-(void)requestWithMyId:(UInt64)myId withOrderStatus:(UInt32)orderStatus withPageNum:(UInt32)pageNum pageSize:(UInt32)pageSize parentId:(UInt64)parentId pubTimeStatus:(UInt32)pubTimeStatus showStatus:(UInt32)showStatus{
    NSDictionary * dic =@ {@"newsId":[commonMethod transIntToNSNumber64:myId],@"orderStatus":[commonMethod transIntToNSNumber32:orderStatus],@"pageNum":[commonMethod transIntToNSNumber32:pageNum],@"pageSize":[commonMethod transIntToNSNumber32:pageSize],@"parentId":[commonMethod transIntToNSNumber64:parentId],@"pubTimeStatus":[commonMethod transIntToNSNumber32:pubTimeStatus],@"showStatus":[commonMethod transIntToNSNumber32:showStatus]};
    NSMutableArray * dataArr =[[NSMutableArray alloc] init];
    [self PostRequestDataWithControlParam:dic url:Request_newsCommentList BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        if ([dataDic[@"code"] intValue]==200) {
            NSMutableArray * arr = [[dataDic objectForKey:@"data"] objectForKey:@"list"];
            for (NSDictionary * dic in arr) {
            newsCommentListTextModel * model = [[newsCommentListTextModel alloc] initWithData:dic];
            [dataArr addObject:model];
            }
            [self.myDelegate successFornewsCommentList:dataArr total:[dataDic[@"data"][@"total"] integerValue]];
        }else{
            [self.myDelegate failedMethod:dataDic[@"message"]];
 
        }
    }];
}
@end
