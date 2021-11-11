//
//  goodsListParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/1.
//

#import "goodsListParser.h"
#import "productListModel.h"
@implementation goodsListParser
-(void)requestWitCatId:(NSInteger)catId catIds:(NSArray*)catIds keyword:(NSString*)keyword orderType:(NSString*)orderType pageNum:(NSInteger)pageNum pageSize:(NSInteger)pageSize position:(NSInteger)position shopCat:(NSInteger)shopCat shopId:(NSInteger)shopId{
    NSDictionary * dic = @{@"catId":[NSNumber numberWithInteger:catId],@"catIds":catIds,@"keyword":keyword,@"orderType":orderType,@"pageNum":[NSNumber numberWithInteger:pageNum],@"pageSize":[NSNumber numberWithInteger:pageSize],@"position":[NSNumber numberWithInteger:position],@"shopCat":[NSNumber numberWithInteger:shopCat],@"shopId":[NSNumber numberWithInteger:shopId]};
    NSMutableArray * arr = [[NSMutableArray alloc] init];
    [self PostRequestDataWithControlParam:dic url:Request_productList BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        for (NSDictionary*dic in dataDic[@"data"][@"list"]) {
            productListModel * model = [[productListModel alloc] initWithData:dic];
            [arr addObject:model];
        }
        [self.myDelegate successGetGoodsList:arr];
    }];
}
@end
