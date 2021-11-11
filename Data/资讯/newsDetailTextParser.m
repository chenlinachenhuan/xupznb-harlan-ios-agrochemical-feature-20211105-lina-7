//
//  newsDetailTextParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/18.
//

#import "newsDetailTextParser.h"

@implementation newsDetailTextParser
 
-(void)requestWithMyId:(NSInteger)myId{
    NSDictionary * dic = @{@"id":[NSNumber numberWithInteger:myId]};
    


    [self GetRequestDataWithControlParam:dic url:[NSString stringWithFormat:@"%@%ld",Request_newsDetail,(long)myId] BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        if ([dataDic[@"code"] intValue]==200) {
            newsDetailTextModel * model = [[newsDetailTextModel alloc] initWithData:dataDic[@"data"]];
            [self.myDelegate successWithNewsDetail:model];
        }else{
            [self.myDelegate failedMethod:dataDic[@"message"]];

        }
    }];
}
@end
