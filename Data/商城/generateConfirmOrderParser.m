//
//  generateConfirmOrderParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/4.
//

#import "generateConfirmOrderParser.h"

@implementation generateConfirmOrderParser
-(void)requestOrderParser:(NSMutableArray*)arr{
    [self PostRequestDataWithControArrlParam:arr url:Request_generateConfirmOrder BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        orderTextModel * model = [[orderTextModel alloc] initWithDAta:dataDic[@"data"]];
        [self.myDelegate successGenerateOrder:model];
    }];
}
@end
