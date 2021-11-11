//
//  policyDetailParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import "policyDetailParser.h"

@implementation policyDetailParser
-(void)requestPolicy:(NSInteger)myId{
    NSDictionary*dic =@{@"id":[NSNumber numberWithInteger:myId]};
    [self GetRequestDataWithControlParam:dic url:[NSString stringWithFormat:@"%@%ld",Request_policyItem,(long)myId] BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        policyDetailModel * model =[[policyDetailModel alloc] initWithData:dataDic[@"data"]];
        [self.myDelegate successWithpolicyDetail:model];
    }];
}
@end
