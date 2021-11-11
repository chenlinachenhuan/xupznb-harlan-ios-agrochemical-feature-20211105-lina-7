//
//  ossModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ossModel : NSObject
@property(nonatomic,retain)NSString * securityToken;

@property(nonatomic,retain)NSString * accessKeySecret;
@property(nonatomic,retain)NSString * accessKeyId;
@property(nonatomic,retain)NSDate *expiration;
- (id)initWithData:(NSDictionary *)data;
@end

NS_ASSUME_NONNULL_END
