//
//  weChatPayParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface weChatPayModel : NSObject
@property(nonatomic,retain)NSString * package;
@property(nonatomic,retain)NSString * appid;
@property(nonatomic,retain)NSString * sign;
@property(nonatomic,retain)NSString * partnerid;
@property(nonatomic,retain)NSString * prepayid;
@property(nonatomic,retain)NSString * noncestr;
@property(nonatomic,retain)NSString * timestamp;
-(id)initWithData:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
