//
//  newsCommentReportParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/18.
//

#import "newsCommentReportParser.h"

@implementation newsCommentReportParser
-(void)requestWithId:(NSInteger)myId{
    NSDictionary * dic = @{@"id":[NSNumber numberWithInteger:myId]};
    [self PostRequestDataWithControlParam:dic url:[NSString stringWithFormat:@"%@%ld",Request_newsCommentReport,(long)myId] BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        if ([dataDic[@"code"] intValue]==200) {
            [self.myDelegate successReport:dataDic[@"message"] ];
 
        }else{
            [self.myDelegate failedMethod:dataDic[@"message"]];

        }
    }];
}
@end
