//
//  policyCommentReportParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import "policyCommentReportParser.h"

@implementation policyCommentReportParser
-(void)requestWithId:(NSInteger)myId{
    NSDictionary * dic = @{@"id":[NSNumber numberWithInteger:myId]};
    [self PostRequestDataWithControlParam:dic url:[NSString stringWithFormat:@"%@%ld",Request_policyReport,(long)myId] BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
            [self.myDelegate successReport];
 
       
    }];
}
@end
