//
//  resetPasswordParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/21.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol resetPasswordParserDelegate;
@interface resetPasswordParser : BaseDataParser
@property(nonatomic,weak)id<resetPasswordParserDelegate>myDelegate;
- (void)resetPasswordWithUsername:(NSString *)username password:(NSString *)password authCode:(NSString*)authCode;
@end
@protocol resetPasswordParserDelegate <NSObject>

-(void)resetPasswordSuccess;
-(void)failedMethod:(NSString*)messege;
@end
NS_ASSUME_NONNULL_END
