//
//  clearAllGoodsParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/2.
//

#import "clearAllGoodsParser.h"

@implementation clearAllGoodsParser
-(void)requestClear{
    [self PostRequestDataWithControlParam:[[NSDictionary alloc]init] url:Request_productCartClear BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        [self.myDelegate successClearCar];
    }];
}
@end
