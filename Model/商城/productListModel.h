//
//  productListModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface productListModel : NSObject
@property(nonatomic,retain)NSString*myId;
@property(nonatomic,retain)NSString*name;
@property(nonatomic,retain)NSString*pic;
@property(nonatomic,retain)NSString*departure;
@property(nonatomic,retain)NSString*minFreight;
@property(nonatomic,retain)NSString*maxFreight;
@property(nonatomic,retain)NSString*mallMinPrice;
@property(nonatomic,retain)NSString*mallMaxPrice;
@property(nonatomic,retain)NSString*marketMinPrice;
@property(nonatomic,retain)NSString*marketMaxPrice;
@property(nonatomic,retain)NSString*saleNum;
-(id)initWithData:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
