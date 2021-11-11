//
//  sendMsgParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/21.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol sendMsgParserDlegate;
@interface sendMsgParser : BaseDataParser

@property(nonatomic,weak)id<sendMsgParserDlegate>myDelegate;
-(void)requestWithName:(NSString*)name type:(NSInteger)type;
@end
@protocol sendMsgParserDlegate <NSObject>

-(void)successSendMsg;
-(void)failedMethod:(NSString*)messege;

@end
NS_ASSUME_NONNULL_END
