//
//  addGoodsToCarParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/2.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol addGoodsToCarParserDelegate;
@interface addGoodsToCarParser : BaseDataParser
@property(nonatomic,weak)id<addGoodsToCarParserDelegate>myDelegate;
-(void)requestAddCar:(NSInteger)memberId productId:(NSInteger)productId productSkuId:(NSInteger)productSkuId quantity:(NSInteger)quantity;
@end
@protocol addGoodsToCarParserDelegate <NSObject>
@optional
-(void)successAddToCar ;

@end
NS_ASSUME_NONNULL_END
