//
//  updateAdressParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/29.
//

#import "updateAdressParser.h"

@implementation updateAdressParser
-(void)updateAddress:(NSInteger)provinceId city:(NSInteger)cityId region:(NSInteger)regionId detailAddress:(NSString*)detailAddress name:(NSString*)name phoneNumber:(NSString*)phoneNumber defaultStatus:(NSInteger)defaultStatus myId:(NSInteger)myId{
    NSDictionary * dic = @{@"province":@"",@"city":@"",@"region":@"",@"detailAddress":detailAddress,@"name":name,@"phoneNumber":phoneNumber,@"areaId":[NSNumber numberWithInteger:regionId],@"cityId":[NSNumber numberWithInteger:cityId],@"email":@"",@"id":[NSNumber numberWithInteger:myId],@"postCode":@"111111",@"provinceId":[NSNumber numberWithInteger:provinceId],@"telNumber":@"",@"defaultStatus":[NSNumber numberWithInteger:defaultStatus]};
    
    [self PostRequestDataWithControlParam:dic url:[NSString stringWithFormat:@"%@%ld",Request_updateAddress,(long)myId] BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        [self.myDelegate successUpdateAddress];
    }];
}
@end
