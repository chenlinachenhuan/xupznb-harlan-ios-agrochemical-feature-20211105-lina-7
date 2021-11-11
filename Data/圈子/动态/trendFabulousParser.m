//
//  trendFabulousParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/26.
//

#import "trendFabulousParser.h"

@implementation trendFabulousParser
-(void)getTrendFabulous:(NSInteger)myId{
    NSDictionary * dic = @{@"id":[NSNumber numberWithInteger:myId]};
    [self PostRequestDataWithControlParam:dic url:[NSString stringWithFormat:@"%@%ld",Request_trendfabulous,(long)myId] BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        if ([dataDic[@"code"] intValue]==200) {
            [self.myDelegate successFabulousTrend];
        }else{
            [self.myDelegate failedMethod:dataDic[@"message"]];
        }
    }];
}
@end
