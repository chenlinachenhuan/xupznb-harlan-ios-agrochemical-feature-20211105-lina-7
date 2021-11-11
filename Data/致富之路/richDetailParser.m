//
//  richDetailParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/9.
//

#import "richDetailParser.h"
 @implementation richDetailParser
-(void)requestRich:(NSInteger)myId{
    NSDictionary*dic =@{@"id":[NSNumber numberWithInteger:myId]};
    [self GetRequestDataWithControlParam:dic url:[NSString stringWithFormat:@"%@%ld",Request_richItem,(long)myId] BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        newsDetailTextModel * model =[[newsDetailTextModel alloc] initWithData:dataDic[@"data"]];
        [self.myDelegate successWithRichDetail:model];
    }];
}
@end
