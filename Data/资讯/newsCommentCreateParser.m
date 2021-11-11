//
//  newsCommentCreateParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/18.
//

#import "newsCommentCreateParser.h"

@implementation newsCommentCreateParser
-(void)requestWithcontent:(NSString*)content newsId:(NSInteger)newsId parentId:(NSInteger)parentId{
    NSDictionary * dic = @{@"content":content,@"newsId":[NSNumber numberWithInteger:newsId],@"parentId":[NSNumber numberWithInteger:parentId]};
    [self PostRequestDataWithControlParam:dic url:Request_newsCommentUP BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        if ([dataDic[@"code"] intValue]==200) {
            [self.myDelegate successCreateComment:[dataDic[@"code"]integerValue]];
            [[iToast makeText:dataDic[@"message"]]show];

        }else{
            [self.myDelegate failedMethod:dataDic[@"message"]];

        }
    }];
}
@end
