//
//  Agro_registerModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Agro_registerModel : NSObject
@property(nonatomic,retain)NSString * checkStatus;
@property(nonatomic,retain)NSString * harlanId;
@property(nonatomic,retain)NSString * icon;
@property(nonatomic,retain)NSString * Agro_id;
@property(nonatomic,retain)NSString * nickName;
@property(nonatomic,retain)NSString * phone;
@property(nonatomic,retain)NSString * token;
@property(nonatomic,retain)NSString * tokenHead;
@property(nonatomic,retain)NSString * userName;
@property(nonatomic,retain)NSString * userSig;
- (id)initWithData:(NSDictionary *)data;
@end

NS_ASSUME_NONNULL_END
