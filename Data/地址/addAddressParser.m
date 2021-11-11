//
//  addAddressParser.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/29.
//

#import "addAddressParser.h"

@implementation addAddressParser
-(void)addAddress:(NSInteger)provinceId city:(NSInteger)cityId region:(NSInteger)regionId detailAddress:(NSString*)detailAddress name:(NSString*)name phoneNumber:(NSString*)phoneNumber defaultStatus:(NSInteger)defaultStatus{
    NSDictionary * dic = @{@"province":@"",@"city":@"",@"region":@"",@"detailAddress":detailAddress,@"name":name,@"phoneNumber":phoneNumber,@"areaId":[NSNumber numberWithInteger:regionId],@"cityId":[NSNumber numberWithInteger:cityId],@"email":@"",@"id":[NSNumber numberWithInteger:0],@"memberId":[NSNumber numberWithInteger:0],@"postCode":@"111111",@"provinceId":[NSNumber numberWithInteger:provinceId],@"telNumber":@"",@"defaultStatus":[NSNumber numberWithInteger:defaultStatus]};
    
    [self PostRequestDataWithControlParam:dic url:Request_addAddress BaseFinishBlock:^(NSDictionary * _Nonnull dataDic) {
        [self.myDelegate successaddAdress];
    }];
}
@end
