//
//  proficientParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/10.
//

#import "proficientParser.h"
#import "exportListModel.h"

@implementation proficientParser
-(void)requestProficientList:(NSInteger)cropId pageNum:(NSInteger)pageNum pageSize:(NSInteger)pageSize proficientBelong:(NSInteger)proficientBelong proficientClassStatus:(NSInteger)proficientClassStatus proficientInStatus:(NSInteger)proficientInStatus proficientOnlineStatus:(NSInteger)proficientOnlineStatus proficientType:(NSInteger)proficientType{
    NSDictionary*dic = @{@"cropId":[NSNumber numberWithInteger:cropId],@"pageNum":[NSNumber numberWithInteger:pageNum],@"pageSize":[NSNumber numberWithInteger:pageSize],@"proficientBelong":[NSNumber numberWithInteger:proficientBelong],@"proficientClassStatus":[NSNumber numberWithInteger:proficientClassStatus],@"proficientInStatus":[NSNumber numberWithInteger:proficientInStatus],@"proficientOnlineStatus":[NSNumber numberWithInteger:proficientOnlineStatus],@"proficientType":[NSNumber numberWithInteger:proficientType]};
    [self PostRequestDataWithControlParam:dic url:Request_proficientList BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        NSMutableArray * arr = [[NSMutableArray alloc] init];
        for (NSDictionary*dic  in dataDic[@"data"][@"list"]) {
            exportListModel * model = [[exportListModel alloc] initWithData:dic];
            [arr addObject:model];
        }
        [ self.myDelegate successGetProficientList:arr total:[dataDic[@"data"][@"total"] integerValue]];
    }];
}
@end
