//
//  updateDefaultAddressParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/29.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol updateDefaultAddressDelegate;
@interface updateDefaultAddressParser : BaseDataParser
@property(nonatomic,weak)id<updateDefaultAddressDelegate>myDelegate;
@end
@protocol updateDefaultAddressDelegate <NSObject>

-(void)successUpdateDefaultAddress;

@end
NS_ASSUME_NONNULL_END
