//
//  newsCommentFabulousParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/18.
//

#import "newsCommentFabulousParser.h"

@implementation newsCommentFabulousParser
-(void)requestWithId:(NSInteger)myId{
    NSDictionary * dic = @{@"id":[NSNumber numberWithInteger:myId]};
    [self PostRequestDataWithControlParam:dic url:[NSString stringWithFormat:@"%@%ld",Request_newsCommentFabulous,(long)myId] BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        if ([dataDic[@"code"] intValue]==200) {
            [self.myDelegate successFabulous:[dataDic[@"code"] integerValue]];
        }else{
            [self.myDelegate failedMethod:dataDic[@"message"]];


        }
    }];
}
@end
