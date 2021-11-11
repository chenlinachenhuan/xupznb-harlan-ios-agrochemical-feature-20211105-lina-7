//
//  knowledgeDetailParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import "knowledgeDetailParser.h"
 @implementation knowledgeDetailParser
-(void)requestKnowledge:(NSInteger)myId{
    NSDictionary*dic =@{@"id":[NSNumber numberWithInteger:myId]};
    [self GetRequestDataWithControlParam:dic url:[NSString stringWithFormat:@"%@%ld",Request_knowledgeItem,(long)myId] BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        policyDetailModel * model =[[policyDetailModel alloc] initWithData:dataDic[@"data"]];
        [self.myDelegate successWithKnowledgeDetail:model];
    }];
}
@end
