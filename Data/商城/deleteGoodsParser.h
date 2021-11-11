//
//  deleteGoodsParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/2.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol deleteGoodsParserDelegate ;
@interface deleteGoodsParser : BaseDataParser
@property(nonatomic,weak)id<deleteGoodsParserDelegate>myDelegate;
-(void)requestDelete:(NSMutableArray*)arr;
@end
@protocol deleteGoodsParserDelegate <NSObject>

-(void)successDeleteCarGoods ;

@end
NS_ASSUME_NONNULL_END
