//
//  goodsListParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/1.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol goodsListParserDelegate;
@interface goodsListParser : BaseDataParser
@property(nonatomic,weak)id<goodsListParserDelegate>myDelegate;
-(void)requestWitCatId:(NSInteger)catId catIds:(NSArray*)catIds keyword:(NSString*)keyword orderType:(NSString*)orderType pageNum:(NSInteger)pageNum pageSize:(NSInteger)pageSize position:(NSInteger)position shopCat:(NSInteger)shopCat shopId:(NSInteger)shopId;
@end
@protocol goodsListParserDelegate <NSObject>

-(void)successGetGoodsList:(NSMutableArray*)arr;

@end
NS_ASSUME_NONNULL_END
