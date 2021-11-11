//
//  rankingListParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/27.
//

#import "rankingListParser.h"
#import "rankingListModel.h"
@implementation rankingListParser
-(void)requestRankingList{
    [self GetRequestDataWithControlParam:[[NSDictionary alloc]init] url:Request_rankingList BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        NSMutableArray * arr = [[NSMutableArray alloc] init];
        if ([dataDic[@"code"] intValue]==200) {
            for (NSDictionary*dic in dataDic[@"data"]) {
                rankingListModel * model = [[rankingListModel alloc] initWithData:dic];
                [arr addObject:model];
            }
            [self.myDelegate successGetRankingList:arr];
        }else{
            [self.myDelegate failedMethod:dataDic[@"message"]];
        }
    }];
}
@end
