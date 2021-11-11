//
//  richCommentCancelFabulousParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/9.
//

#import "richCommentCancelFabulousParser.h"

@implementation richCommentCancelFabulousParser
-(void)requestWithId:(NSInteger)myId{
    NSDictionary * dic = @{@"id":[NSNumber numberWithInteger:myId]};
    [self PostRequestDataWithControlParam:dic url:[NSString stringWithFormat:@"%@%ld",Request_richCancelFabulous,(long)myId] BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
            [self.myDelegate successCancelFabulous];
    }];

}
@end
