//
//  verifyAuthCodeParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/21.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol verifyAuthCodeParserDelegate;
@interface verifyAuthCodeParser : BaseDataParser
@property(nonatomic,weak)id<verifyAuthCodeParserDelegate>myDelegate;
-(void)requestWithAuthCode:(NSString*)authCode name:(NSString*)name type:(NSInteger)type;
@end
@protocol verifyAuthCodeParserDelegate <NSObject>

-(void)successVerifyAuthCode:(BOOL)data;

@end
NS_ASSUME_NONNULL_END
