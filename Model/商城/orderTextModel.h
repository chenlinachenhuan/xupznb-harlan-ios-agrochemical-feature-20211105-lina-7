//
//  orderTextModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/4.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN

@interface orderTextModel : NSObject
@property(nonatomic,retain)NSMutableArray*cartPromotionItemList;
 
@property(nonatomic,retain)NSString*totalAmount;
@property(nonatomic,retain)NSString*freightAmount;
@property(nonatomic,retain)NSString*promotionAmount;
@property(nonatomic,retain)NSString*payAmount;
-(id)initWithDAta:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
