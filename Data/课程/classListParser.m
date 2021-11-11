//
//  classListParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/10.
//

#import "classListParser.h"
#import "classListModel.h"

@implementation classListParser
-(void)requestClaaList:(NSInteger)cat2Id catId:(NSInteger)catId crop2Id:(NSInteger)crop2Id cropId:(NSInteger)cropId keyword:(NSString*)keyword orderBy:(NSString*)orderBy pageNum:(NSInteger)pageNum  pageSize:(NSInteger)pageSize proficientId:(NSInteger)proficientId  publishStatus:(NSInteger)publishStatus{
    NSDictionary * dic = @{@"cat2Id":[NSNumber numberWithInteger:cat2Id],@"catId":[NSNumber numberWithInteger:catId],@"crop2Id":[NSNumber numberWithInteger:crop2Id],@"cropId":[NSNumber numberWithInteger:cropId],@"pageNum":[NSNumber numberWithInteger:pageNum],@"pageSize":[NSNumber numberWithInteger:pageSize],@"proficientId":[NSNumber numberWithInteger:proficientId],@"publishStatus":[NSNumber numberWithInteger:publishStatus],@"keyword":keyword,@"orderBy":orderBy};
    [self PostRequestDataWithControlParam:dic url:Request_classList BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        NSMutableArray * arr = [[NSMutableArray alloc] init];
        for (NSDictionary*dic in dataDic[@"data"][@"list"]) {
            classListModel * model = [[classListModel alloc] initWithData:dic];
            [arr addObject:model];
        }
        [self.myDelegate successGetClassList:arr total:[dataDic[@"data"][@"total"] integerValue]];
    }];
}
@end
