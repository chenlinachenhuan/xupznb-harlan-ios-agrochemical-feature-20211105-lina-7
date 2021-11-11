//
//  updateAdressParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/29.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol updateAdressParserDelegate;
@interface updateAdressParser : BaseDataParser
@property(nonatomic,weak)id<updateAdressParserDelegate>myDelegate;
-(void)updateAddress:(NSInteger)provinceId city:(NSInteger)cityId region:(NSInteger)regionId detailAddress:(NSString*)detailAddress name:(NSString*)name phoneNumber:(NSString*)phoneNumber defaultStatus:(NSInteger)defaultStatus myId:(NSInteger)myId;
@end
@protocol updateAdressParserDelegate <NSObject>

-(void)successUpdateAddress;

@end
NS_ASSUME_NONNULL_END
