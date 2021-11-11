//
//  knowledgeCommentReportParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import "knowledgeCommentReportParser.h"

@implementation knowledgeCommentReportParser
-(void)requestWithId:(NSInteger)myId{
    NSDictionary * dic = @{@"id":[NSNumber numberWithInteger:myId]};
    [self PostRequestDataWithControlParam:dic url:[NSString stringWithFormat:@"%@%ld",Request_knowledgeReport,(long)myId] BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
            [self.myDelegate successReport];
 
       
    }];
}
@end
