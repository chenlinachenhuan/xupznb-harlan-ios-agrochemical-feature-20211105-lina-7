//
//  trendCommentCreateParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/20.
//

#import "trendCommentCreateParser.h"

@implementation trendCommentCreateParser
-(void)requestTrendCommentCreateId:(int64_t)newsId parentId:(int64_t)parentId content:(NSString*)content {
    NSDictionary * dic = @{@"newsId":[NSNumber numberWithInteger:newsId],@"parentId":[NSNumber numberWithInteger:parentId],@"content":content};
    [self PostRequestDataWithControlParam:dic url:Request_trendcommentCreate BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        if ([dataDic[@"code"] intValue]==200) {
            [self.myDelegate successTrendCommentCreate];
        }else{
             [self.myDelegate failedMethod:dataDic[@"message"]];

        }
     }];
}
@end
