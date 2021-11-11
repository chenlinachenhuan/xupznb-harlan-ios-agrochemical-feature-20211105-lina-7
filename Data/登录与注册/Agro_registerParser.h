//
//  Agro_registerParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/7.
//

#import "BaseDataParser.h"
#import "Agro_registerModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol Agro_registerParserDelegate;
@interface Agro_registerParser : BaseDataParser
@property(nonatomic,weak)id<Agro_registerParserDelegate>myDelegate;
 - (void)registerWithUsername:(NSString *)username password:(NSString *)password authCode:(NSString*)authCode ;
@end
@protocol Agro_registerParserDelegate <NSObject>

-(void)registerSuccess;
-(void)failedMethod:(NSString*)message;
@end
NS_ASSUME_NONNULL_END
