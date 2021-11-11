//
//  knowledgeCommentFabulousParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import "knowledgeCommentFabulousParser.h"

@implementation knowledgeCommentFabulousParser
-(void)requestWithId:(NSInteger)myId{
    NSDictionary * dic = @{@"id":[NSNumber numberWithInteger:myId]};
    [self PostRequestDataWithControlParam:dic url:[NSString stringWithFormat:@"%@%ld",Request_knowledgeFabulous,(long)myId] BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
            [self.myDelegate successFabulous];
    }];
}
@end
