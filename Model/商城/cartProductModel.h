//
//  cartProductModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface cartProductModel : NSObject
@property(nonatomic,retain)NSString*mallPrice;
@property(nonatomic,retain)NSString*myId;
@property(nonatomic,retain)NSString*shopId;

@property(nonatomic,retain)NSString*name;
@property(nonatomic,retain)NSString*pic;
@property(nonatomic,retain)NSString*productId;
@property(nonatomic,retain)NSString*productSkuId;
@property(nonatomic,retain)NSString*quantity;
@property(nonatomic,retain)NSString*spec1;
@property(nonatomic,assign)BOOL select;

-(id)initWithData:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
