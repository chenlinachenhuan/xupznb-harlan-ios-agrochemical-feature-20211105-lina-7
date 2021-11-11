//
//  policyCommentListParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import "policyCommentListParser.h"
#import "newsCommentListTextModel.h"
@implementation policyCommentListParser
-(void)requestPolicyComment:(UInt64)myId withOrderStatus:(UInt32)orderStatus withPageNum:(UInt32)pageNum pageSize:(UInt32)pageSize parentId:(UInt64)parentId pubTimeStatus:(UInt32)pubTimeStatus showStatus:(UInt32)showStatus{
    NSDictionary * dic =@ {@"newsId":[commonMethod transIntToNSNumber64:myId],@"orderStatus":[commonMethod transIntToNSNumber32:orderStatus],@"pageNum":[commonMethod transIntToNSNumber32:pageNum],@"pageSize":[commonMethod transIntToNSNumber32:pageSize],@"parentId":[commonMethod transIntToNSNumber64:parentId],@"pubTimeStatus":[commonMethod transIntToNSNumber32:pubTimeStatus],@"showStatus":[commonMethod transIntToNSNumber32:showStatus]};
    [self PostRequestDataWithControlParam:dic url:Request_policyCommentList BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        NSMutableArray*arr =[[NSMutableArray alloc] init];
        for (NSDictionary*dic in dataDic[@"data"][@"list"]) {
            newsCommentListTextModel * model = [[newsCommentListTextModel alloc] initWithData:dic];
            [arr addObject:model];
        }
        [self.myDelegate successGetCommentList:arr];
    }];
}
@end
