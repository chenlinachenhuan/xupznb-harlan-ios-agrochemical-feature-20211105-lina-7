//
//  deleteGoodsParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/2.
//

#import "deleteGoodsParser.h"

@implementation deleteGoodsParser
-(void)requestDelete:(NSMutableArray*)arr{
    NSDictionary * dic = @{@"ids":arr};
    [self PostRequestDataWithControArrlParam:arr url:Request_productCartDelete BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        [self.myDelegate successDeleteCarGoods];
    }];
}
@end
