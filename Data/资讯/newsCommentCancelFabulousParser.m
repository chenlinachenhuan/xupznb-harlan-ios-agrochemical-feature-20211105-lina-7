//
//  newsCommentCancelFabulousParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/18.
//

#import "newsCommentCancelFabulousParser.h"

@implementation newsCommentCancelFabulousParser
-(void)requestWithId:(NSInteger)myId{
    NSDictionary * dic = @{@"id":[NSNumber numberWithInteger:myId]};
    [self PostRequestDataWithControlParam:dic url:[NSString stringWithFormat:@"%@%ld",Request_newsCommentCancelFabulous,(long)myId] BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        if ([dataDic[@"code"] intValue]==200) {
            [self.myDelegate successCancelFabulous:[dataDic[@"code"] integerValue]];
        }else{
            [self.myDelegate failedMethod:dataDic[@"message"]];


        }
    }];

}
@end
