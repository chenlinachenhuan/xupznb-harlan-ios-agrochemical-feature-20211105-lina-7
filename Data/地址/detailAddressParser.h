//
//  detailAddressParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/29.
//

#import "BaseDataParser.h"
#import "addressTextModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol detailAddressParserDelegate ;
@interface detailAddressParser : BaseDataParser
@property(nonatomic,weak)id<detailAddressParserDelegate>myDelegate;
-(void)detailAddress:(NSInteger)myId;
@end
@protocol detailAddressParserDelegate <NSObject>

-(void)successGetDetailAddress:(addressTextModel*)model;

@end
NS_ASSUME_NONNULL_END
