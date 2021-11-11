//
//  policyCommentFabulousParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import "policyCommentFabulousParser.h"

@implementation policyCommentFabulousParser
-(void)requestWithId:(NSInteger)myId{
    NSDictionary * dic = @{@"id":[NSNumber numberWithInteger:myId]};
    [self PostRequestDataWithControlParam:dic url:[NSString stringWithFormat:@"%@%ld",Request_policyFabulous,(long)myId] BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
            [self.myDelegate successFabulous];
    }];
}
@end
