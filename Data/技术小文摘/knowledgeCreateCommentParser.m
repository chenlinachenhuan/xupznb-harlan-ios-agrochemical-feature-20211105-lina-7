//
//  knowledgeCreateCommentParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import "knowledgeCreateCommentParser.h"

@implementation knowledgeCreateCommentParser
-(void)requestWithcontent:(NSString*)content newsId:(NSInteger)newsId parentId:(NSInteger)parentId{
    NSDictionary * dic = @{@"content":content,@"newsId":[NSNumber numberWithInteger:newsId],@"parentId":[NSNumber numberWithInteger:parentId]};
    [self PostRequestDataWithControlParam:dic url:Request_knowledgeCreateComment BaseFinishBlock:^(NSDictionary * _Nonnull dataDic){
        [self.myDelegate successCreateComment];
    }];
}
@end
