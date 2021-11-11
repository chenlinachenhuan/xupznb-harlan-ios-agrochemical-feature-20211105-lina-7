//
//  policyCommentCancelFabulousParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import "policyCommentCancelFabulousParser.h"

@implementation policyCommentCancelFabulousParser
-(void)requestWithId:(NSInteger)myId{
    NSDictionary * dic = @{@"id":[NSNumber numberWithInteger:myId]};
    [self PostRequestDataWithControlParam:dic url:[NSString stringWithFormat:@"%@%ld",Request_policyCancelFabulous,(long)myId] BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
            [self.myDelegate successCancelFabulous];
    }];

}
@end
