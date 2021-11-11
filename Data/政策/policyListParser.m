//
//  policyListParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/5.
//

#import "policyListParser.h"
#import "policyListModel.h"
@implementation policyListParser
-(void)requestPolicyList:(NSInteger)areaId cat2Id:(NSInteger)cat2Id catId:(NSInteger)catId cityId:(NSInteger)cityId cropId:(NSInteger)cropId expireStatus:(NSInteger)expireStatus keyword:(NSString*)keyword pageNum:(NSInteger)pageNum pageSize:(NSInteger)pageSize provinceId:(NSInteger)provinceId showStatus:(NSInteger)showStatus{
    NSDictionary * dic = @{@"areaId":[NSNumber numberWithInteger:areaId],@"cat2Id":[NSNumber numberWithInteger:cat2Id],@"catId":[NSNumber numberWithInteger:catId],@"cityId":[NSNumber numberWithInteger:cityId],@"cropId":[NSNumber numberWithInteger:cropId],@"expireStatus":[NSNumber numberWithInteger:expireStatus],@"keyword":keyword,@"pageNum":[NSNumber numberWithInteger:pageNum],@"pageSize":[NSNumber numberWithInteger:pageSize],@"provinceId":[NSNumber numberWithInteger:provinceId],@"showStatus":[NSNumber numberWithInteger:showStatus]};
    
    [self PostRequestDataWithControlParam:dic url:Request_policyList BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        NSMutableArray * arr =[[NSMutableArray alloc] init];
        for (NSDictionary*dic in dataDic[@"data"][@"list"]) {
            policyListModel * model = [[policyListModel  alloc] initWithData:dic];
            [arr addObject:model];
        }
        [self.myDelegate successGetPolicyList:arr];
    }];
}
@end
