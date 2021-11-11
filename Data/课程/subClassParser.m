//
//  subClassParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/10.
//

#import "subClassParser.h"
#import "classContentModel.h"

@implementation subClassParser
-(void)requestSubClassList:(NSInteger)curriculumId pageNum:(NSInteger)pageNum pageSize:(NSInteger)pageSize viewStatus:(NSInteger)viewStatus{
    NSDictionary * dic = @{@"curriculumId":[NSNumber numberWithInteger:curriculumId],@"pageNum":[NSNumber numberWithInteger:pageNum],@"pageSize":[NSNumber numberWithInteger:pageSize],@"viewStatus":[NSNumber numberWithInteger:viewStatus]};
    [self PostRequestDataWithControlParam:dic url:Request_subClassList BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        NSMutableArray * arr = [[NSMutableArray alloc] init];
        for (NSDictionary * dic in dataDic[@"data"][@"list"]) {
            classContentModel * model = [[classContentModel alloc] initWithData:dic];
            [arr addObject:model];
        }
        [self.myDelegate successGetSubCLassList:arr total:[dataDic[@"data"][@"total"] integerValue] ];
    }];
}
@end
