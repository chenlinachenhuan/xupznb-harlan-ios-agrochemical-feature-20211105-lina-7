//
//  deleteAddressParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/29.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol deleteAddressParserDelegate;
@interface deleteAddressParser : BaseDataParser
@property(nonatomic,weak)id<deleteAddressParserDelegate>myDelegate;
-(void)deleteAddress:(NSInteger)myId;
@end
@protocol deleteAddressParserDelegate  <NSObject>

-(void)successDeleteAdress;
@end
NS_ASSUME_NONNULL_END
