//
//  Agro_loginParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/7.
//

#import "BaseDataParser.h"
#import "Agro_loginModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol Agro_loginParserDelegate;
@interface Agro_loginParser : BaseDataParser
@property(nonatomic,weak)id<Agro_loginParserDelegate>myDelegate;
- (void)loginWithUsername:(NSString *)username password:(NSString *)password ;

@end
@protocol Agro_loginParserDelegate <NSObject>

-(void)successLoginMethod:(Agro_loginModel*)model;
-(void)failedMethod:(NSString*)messege;

@end
NS_ASSUME_NONNULL_END
