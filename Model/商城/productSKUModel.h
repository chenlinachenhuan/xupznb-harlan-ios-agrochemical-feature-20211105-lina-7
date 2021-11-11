//
//  productSKUModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface productSKUModel : NSObject
@property(nonatomic,retain)NSString * myId;
@property(nonatomic,retain)NSString * productId;
@property(nonatomic,retain)NSString * skuCode;
@property(nonatomic,retain)NSString * freight;
@property(nonatomic,retain)NSString * marketPrice;
@property(nonatomic,retain)NSString * mallPrice;
@property(nonatomic,retain)NSString * pic;
@property(nonatomic,retain)NSString * spec1Val;
@property(nonatomic,retain)NSString * spec2Val;
@property(nonatomic,retain)NSString * spec3Val;

@property(nonatomic,retain)NSString * saleNum;
@property(nonatomic,retain)NSString * lockStock;
@property(nonatomic,retain)NSString * stock;
-(id)initWithData:(NSDictionary*)dic;

@end

NS_ASSUME_NONNULL_END
