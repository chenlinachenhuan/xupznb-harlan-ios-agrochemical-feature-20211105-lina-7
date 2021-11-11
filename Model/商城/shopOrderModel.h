//
//  shopOrderModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface shopOrderModel : NSObject
@property(nonatomic,retain)NSString*shopId;
@property(nonatomic,retain)NSString*shopIcon;
@property(nonatomic,retain)NSString*shopName;
@property(nonatomic,retain)NSString*remark;

@property(nonatomic,retain)NSString*freightAmount;

@property(nonatomic,retain)NSMutableArray*cartList;
-(id)initWithDAta:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
