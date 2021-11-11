//
//  cartListProductModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface cartListProductModel : NSObject
@property(nonatomic,retain)NSString*shopIcon;
@property(nonatomic,retain)NSString*shopId;
@property(nonatomic,retain)NSString*shopName;
@property(nonatomic,retain)NSMutableArray*productArr;
@property(nonatomic,assign)BOOL select;
@property(nonatomic,retain)NSMutableArray*selectArr;

 
-(id)initWithData:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
