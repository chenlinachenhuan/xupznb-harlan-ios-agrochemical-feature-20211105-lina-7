//
//  areaListParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/28.
//

#import "areaListParser.h"
#import "provModel.h"
#import "cityModel.h"
#import "regionModel.h"
@implementation areaListParser
-(void)requestareaList:(NSInteger)parentId{
    NSDictionary * dic = @{@"parentId":[NSNumber numberWithInteger:parentId]};
    [self GetRequestDataWithControlParam:dic url:Request_areaList BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        NSMutableArray * arr = [[NSMutableArray alloc] init];
        for (NSDictionary*dic in dataDic[@"data"]) {
            if ([dic[@"level"] intValue]==1) {
                provModel * model = [[provModel alloc] initWithData:dic];
                [arr addObject:model];
            }else if ([dic[@"level"] intValue]==2) {
                cityModel * model = [[cityModel alloc] initWithData:dic];
                [arr addObject:model];
            }else if ([dic[@"level"] intValue]==3) {
                regionModel * model = [[regionModel alloc] initWithData:dic];
                [arr addObject:model];
            }
        }
        [self.myDelegate successGetareaList:arr];
    }];
}
@end
