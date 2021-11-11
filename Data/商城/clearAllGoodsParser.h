//
//  clearAllGoodsParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/2.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol clearAllGoodsParserDelegate;
@interface clearAllGoodsParser : BaseDataParser
@property(nonatomic,weak)id<clearAllGoodsParserDelegate>myDelegate;
-(void)requestClear;
@end
@protocol clearAllGoodsParserDelegate <NSObject>

-(void)successClearCar ;

@end
NS_ASSUME_NONNULL_END
