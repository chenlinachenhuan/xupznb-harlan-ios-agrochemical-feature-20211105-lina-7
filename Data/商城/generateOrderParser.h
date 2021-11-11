//
//  generateOrderParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/4.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol generateOrderParserDelegate;
@interface generateOrderParser : BaseDataParser
@property(nonatomic,weak)id<generateOrderParserDelegate>myDelegate;
-(void)requestOrder:(NSArray*)cartIds memberReceiveAddressId:(NSInteger)memberReceiveAddressId payLineType:(NSInteger)payLineType payType:(NSInteger)payType quantity:(NSInteger)quantity shippingType:(NSInteger)shippingType shopParams:(NSMutableArray*)arr skuId:(NSInteger)skuId sourceType:(NSInteger)sourceType;
@end
@protocol generateOrderParserDelegate <NSObject>

-(void)successGenerateOrderId:(NSInteger)orderId;

@end
NS_ASSUME_NONNULL_END
