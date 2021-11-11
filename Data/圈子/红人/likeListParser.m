//
//  likeListParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/27.
//

#import "likeListParser.h"
#import "likeListModel.h"
@implementation likeListParser
-(void)requestLikeList:(NSInteger)rankingId{
    NSDictionary *dic = @{@"rankingId":[NSNumber numberWithInteger:rankingId]};
    [self GetRequestDataWithControlParam:dic url:[NSString stringWithFormat:@"%@%ld",Request_LikeList,(long)rankingId] BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        NSMutableArray * arr = [[NSMutableArray alloc] init];
        if ([dataDic[@"code"] intValue]==200) {
            for (NSDictionary*dic in dataDic[@"data"]) {
                likeListModel * model = [[likeListModel alloc] initWithData:dic];
                [arr addObject:model];
            }
            [self.myDelegate successGetLikeList:arr];
        }else{
            [self.myDelegate failedMethod:dataDic[@"message"]];
        }
    }];
}
 
@end
