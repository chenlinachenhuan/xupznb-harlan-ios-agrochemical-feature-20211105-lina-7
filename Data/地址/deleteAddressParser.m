//
//  deleteAddressParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/29.
//

#import "deleteAddressParser.h"

@implementation deleteAddressParser
-(void)deleteAddress:(NSInteger)myId{
    NSDictionary * dic = @{@"id":[NSNumber numberWithInteger:myId]};
    [self PostRequestDataWithControlParam:dic url:[NSString stringWithFormat:@"%@%ld",Request_deleteAddress,(long)myId] BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        [self.myDelegate successDeleteAdress];
    }];
    
}
@end
