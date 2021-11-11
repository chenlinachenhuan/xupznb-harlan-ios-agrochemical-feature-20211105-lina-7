//
//  allAdressParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/29.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol allAddressParserDelegate;
@interface allAdressParser : BaseDataParser
@property(nonatomic,weak)id<allAddressParserDelegate>myDelegate;
-(void)requestAllAdress;
@end
@protocol allAddressParserDelegate  <NSObject>

-(void)successGetAllAdress:(NSMutableArray*)listArr;
@end
NS_ASSUME_NONNULL_END
