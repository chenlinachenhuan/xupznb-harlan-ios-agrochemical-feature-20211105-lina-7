//
//  allAdressParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/29.
//

#import "allAdressParser.h"
#import "addressTextModel.h"
@implementation allAdressParser
-(void)requestAllAdress{
    NSDictionary *dic =[[NSDictionary alloc] init];
    [self GetRequestDataWithControlParam:dic url:Request_allAddress BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        NSMutableArray * arr = [[NSMutableArray alloc] init];
        for (NSDictionary *dic in dataDic[@"data"]) {
            addressTextModel * model =[[addressTextModel alloc] initWithData:dic];
            [arr addObject:model];
        }
        [self.myDelegate successGetAllAdress:arr];
    }];
}
@end
