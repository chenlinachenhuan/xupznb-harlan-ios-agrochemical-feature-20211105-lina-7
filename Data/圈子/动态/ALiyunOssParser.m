//
//  ALiyunOssParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/26.
//

#import "ALiyunOssParser.h"

@implementation ALiyunOssParser
-(void)requestOSS{
    [self GetRequestDataWithControlParam:[[NSDictionary alloc]init] url:Request_OSS BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        if ([dataDic[@"code"] intValue]==200) {
            [self.myDelegate successOss:[[ossModel alloc]initWithData:dataDic[@"data"][@"credentials"]]] ;
        }else{
            [self.myDelegate failedMethod:dataDic[@"message"]];
            [[ChrysanthemumIndexView sharedMasterUser]remove];
        }
    }];
}
@end
