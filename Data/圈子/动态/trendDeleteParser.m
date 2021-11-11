//
//  trendDeleteParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/25.
//

#import "trendDeleteParser.h"

@implementation trendDeleteParser
-(void)requestWithMyId:(NSInteger)myId{
    NSDictionary * dic = @{@"id":[NSNumber numberWithInteger:myId]};
    [self PostRequestDataWithControlParam:dic url:[NSString stringWithFormat:@"%@%ld",Request_trendDelete,(long)myId] BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        if ([dataDic[@"code"] intValue]==200) {
            [self.myDelegate successDeleteTrend];
        }else{
            [self.myDelegate failedMethod:dataDic[@"message"]];
        }
    }];
}
@end
