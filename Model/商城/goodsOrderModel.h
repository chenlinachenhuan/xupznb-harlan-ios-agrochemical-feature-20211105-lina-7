//
//  goodsOrderModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface goodsOrderModel : NSObject
@property(nonatomic,retain)NSString*myId;
@property(nonatomic,retain)NSString*shopId;
@property(nonatomic,retain)NSString*productId;
@property(nonatomic,retain)NSString*productSkuId;
@property(nonatomic,retain)NSString*quantity;
@property(nonatomic,retain)NSString*mallPrice;
@property(nonatomic,retain)NSString*totalAmount;
@property(nonatomic,retain)NSString*pic;
@property(nonatomic,retain)NSString*name;
@property(nonatomic,retain)NSString*productCategoryId;
@property(nonatomic,retain)NSString*spec1;
@property(nonatomic,retain)NSString*productSkuCode;
@property(nonatomic,retain)NSString*freight;
@property(nonatomic,retain)NSString*spec1Val;
@property(nonatomic,retain)NSString*reduceAmount;
@property(nonatomic,retain)NSString*realStock;
@property(nonatomic,retain)NSString*integration;
@property(nonatomic,retain)NSString*growth;

-(id)initWithDAta:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
