//
//  trendListParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/19.
//

#import "trendListParser.h"
#import "trendModel.h"
@implementation trendListParser
-(void)requestWithCatId:(int64_t)catId keyword:(NSString*)keyword pageNum:(int32_t)pageNum pageSize:(int32_t)pageSize showStatus:(int32_t)showStatus{
    NSDictionary * dic = @{@"catId":[NSNumber numberWithLongLong:catId],@"keyword":keyword,@"pageNum":[NSNumber numberWithInt:pageNum],@"pageSize":[NSNumber numberWithInt:pageSize],@"showStatus":[NSNumber numberWithInt:showStatus]};
    
    [self PostRequestDataWithControlParam:dic url:Request_trendList BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        NSMutableArray * arr = [[NSMutableArray alloc] init];
        if ([dataDic[@"code"] intValue]==200) {
            for (NSDictionary*dic in dataDic[@"data"][@"list"]) {
                trendModel * model = [[trendModel alloc] initWithData:dic];
                [arr addObject:model];
            }
            [self.myDelegate successTrendListMethod:arr withTotal:dataDic[@"data"][@"total"]];
        }else{
           
             [self.myDelegate failedMethod:dataDic[@"message"]];

        }
        
    }];
}

@end
