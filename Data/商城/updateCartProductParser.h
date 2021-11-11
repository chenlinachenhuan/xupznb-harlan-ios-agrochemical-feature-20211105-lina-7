//
//  updateCartProductParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/2.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol updateCartProductParserDelegate;
@interface updateCartProductParser : BaseDataParser
@property(nonatomic,weak)id<updateCartProductParserDelegate>myDelegate;
-(void)requestUpdate:(NSInteger)myId quantity:(NSInteger)quantity;
@end
@protocol updateCartProductParserDelegate <NSObject>

-(void)successUpdateCarGoods ;

@end
NS_ASSUME_NONNULL_END
