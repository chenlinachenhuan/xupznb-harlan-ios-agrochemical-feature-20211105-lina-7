//
//  policyCreateCommentParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import "policyCreateCommentParser.h"

@implementation policyCreateCommentParser
-(void)requestWithcontent:(NSString*)content newsId:(NSInteger)newsId parentId:(NSInteger)parentId{
    NSDictionary * dic = @{@"content":content,@"newsId":[NSNumber numberWithInteger:newsId],@"parentId":[NSNumber numberWithInteger:parentId]};
    [self PostRequestDataWithControlParam:dic url:Request_policyCreateComment BaseFinishBlock:^(NSDictionary * _Nonnull dataDic){
        [self.myDelegate successCreateComment];
    }];
}
@end
