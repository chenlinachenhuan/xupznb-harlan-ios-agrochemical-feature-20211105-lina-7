//
//  Agro_loginModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Agro_loginModel : NSObject
@property(nonatomic,assign)NSString * proficientLevel;
@property(nonatomic,retain)NSString * harlanId;
@property(nonatomic,retain)NSString * avatar;
@property(nonatomic,retain)NSString * shopStatus;
@property(nonatomic,retain)NSString * nickName;
@property(nonatomic,retain)NSString * tokenHead;
@property(nonatomic,retain)NSString * token;
@property(nonatomic,retain)NSString * userSig;
@property(nonatomic,retain)NSString * myId;

@property(nonatomic,retain)NSString * username;
- (id)initWithData:(NSDictionary *)data;
@end

NS_ASSUME_NONNULL_END
