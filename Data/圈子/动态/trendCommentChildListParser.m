//
//  trendCommentChildListParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/27.
//

#import "trendCommentChildListParser.h"
#import "trendTwoCommentModel.h"
@implementation trendCommentChildListParser
-(void)requestTrendCommentChildListId:(int64_t)myId orderStatus:(int32_t)orderStatus pageNum:(int32_t)pageNum pageSize:(int32_t)pageSize parentId:(int64_t)parentId pubTimeStatus:(int32_t)pubTimeStatus showStatus:(int32_t)showStatus{
    NSDictionary * dic = @{@"newsId":[NSNumber numberWithInteger:myId],@"orderStatus":[NSNumber numberWithInteger:orderStatus],@"pageNum":[NSNumber numberWithInteger:pageNum],@"pageSize":[NSNumber numberWithInteger:pageSize],@"parentId":[NSNumber numberWithInteger:parentId],@"pubTimeStatus":[NSNumber numberWithInteger:pubTimeStatus],@"showStatus":[NSNumber numberWithInteger:showStatus]};
    NSMutableArray * arr =[[NSMutableArray alloc] init];
    [self PostRequestDataWithControlParam:dic url:Request_trendcommentList BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        if ([dataDic[@"code"] intValue]==200) {
            
            for (NSDictionary * dic in dataDic[@"data"][@"list"]) {
                trendTwoCommentModel * model = [[trendTwoCommentModel alloc] initWithData:dic];
                [arr addObject:model];
            }
            [self.myDelegate successTrendCommentChildListArr:arr withTotal:dataDic[@"data"][@"total"]];
        }else{
            [self.myDelegate failedMethod:dataDic[@"message"]];

        }
     }];
}
@end
