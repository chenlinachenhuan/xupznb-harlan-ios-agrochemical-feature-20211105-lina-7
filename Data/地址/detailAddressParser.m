//
//  detailAddressParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/29.
//

#import "detailAddressParser.h"

@implementation detailAddressParser
-(void)detailAddress:(NSInteger)myId
{
    NSDictionary * dic = @{@"id":[NSNumber numberWithInteger:myId]};
    [self GetRequestDataWithControlParam:dic url:[NSString stringWithFormat:@"%@%ld",Request_detailAddress,(long)myId] BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        addressTextModel * model = [[addressTextModel alloc] initWithData:dataDic[@"data"]];
        [self.myDelegate successGetDetailAddress:model];
    }];
    
}
@end
