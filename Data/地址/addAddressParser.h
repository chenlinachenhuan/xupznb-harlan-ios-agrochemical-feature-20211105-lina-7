//
//  addAddressParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/29.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol addAddressParserDelegate;
@interface addAddressParser : BaseDataParser
@property(nonatomic,weak)id<addAddressParserDelegate>myDelegate;
-(void)addAddress:(NSInteger)provinceId city:(NSInteger)cityId region:(NSInteger)regionId detailAddress:(NSString*)detailAddress name:(NSString*)name phoneNumber:(NSString*)phoneNumber defaultStatus:(NSInteger)defaultStatus;
@end
@protocol addAddressParserDelegate  <NSObject>
@optional

-(void)successaddAdress;
@end
NS_ASSUME_NONNULL_END
