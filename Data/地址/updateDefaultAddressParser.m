//
//  updateDefaultAddressParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/29.
//

#import "updateDefaultAddressParser.h"

@implementation updateDefaultAddressParser
-(void)updateDefaultAddress:(NSInteger)myId
{
    NSDictionary * dic = @{@"id":[NSNumber numberWithInteger:myId]};
    [self PostRequestDataWithControlParam:dic url:[NSString stringWithFormat:@"%@%ld",Request_updateDefaultAddress,(long)myId] BaseFinishBlock:^(NSDictionary * _Nonnull dataDic){
        [self.myDelegate successUpdateDefaultAddress];
    }];
    
}
@end
