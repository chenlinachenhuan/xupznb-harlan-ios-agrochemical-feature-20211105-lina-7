//
//  richCommentReportParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/9.
//

#import "richCommentReportParser.h"

@implementation richCommentReportParser
-(void)requestWithId:(NSInteger)myId{
    NSDictionary * dic = @{@"id":[NSNumber numberWithInteger:myId]};
    [self PostRequestDataWithControlParam:dic url:[NSString stringWithFormat:@"%@%ld",Request_richReport,(long)myId] BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
            [self.myDelegate successReport];
 
       
    }];
}
@end
