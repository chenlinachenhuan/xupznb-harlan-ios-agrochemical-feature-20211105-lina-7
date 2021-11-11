//
//  carListParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/2.
//

#import "carListParser.h"
#import "cartListProductModel.h"
@implementation carListParser
-(void)requestList:(NSInteger)pageNum pageSize:(NSInteger)pageSize{
    NSDictionary * dic = @{@"pageNum":[NSNumber numberWithInteger:pageNum],@"pageSize":[NSNumber numberWithInteger:pageSize]};
    NSMutableArray * arr = [[NSMutableArray alloc] init];
    [self PostRequestDataWithControlParam:dic url:Request_productCartList BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        for (NSDictionary * dic in dataDic[@"data"][@"list"]) {
            cartListProductModel * model =[[cartListProductModel alloc] initWithData:dic];
            [arr addObject:model];
        }
        [self.myDelegate successGetCarList:arr];
     }];
}
@end
