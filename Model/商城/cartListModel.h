//
//  cartListModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface cartListModel : NSObject
@property(nonatomic,retain)NSString*shopName;
@property(nonatomic,retain)NSMutableArray*cartList;

@end

NS_ASSUME_NONNULL_END
