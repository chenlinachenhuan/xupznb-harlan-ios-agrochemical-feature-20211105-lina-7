//
//  richCommentFabulousParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/9.
//

#import "richCommentFabulousParser.h"

@implementation richCommentFabulousParser
-(void)requestWithId:(NSInteger)myId{
    NSDictionary * dic = @{@"id":[NSNumber numberWithInteger:myId]};
    [self PostRequestDataWithControlParam:dic url:[NSString stringWithFormat:@"%@%ld",Request_richFabulous,(long)myId] BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
            [self.myDelegate successFabulous];
    }];
}
@end
