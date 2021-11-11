//
//  weChatPay.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/5.
//

#import "BaseDataParser.h"
#import "weChatPayModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol weChatPayDelegate;
@interface weChatPay : BaseDataParser
@property(nonatomic,weak)id<weChatPayDelegate>myDelegate;
-(void)requestWechatPay:(NSInteger)orderId returnUrl:(NSString*)returnUrl;
@end
@protocol weChatPayDelegate <NSObject>

-(void)successWechatPay:(weChatPayModel*)model;

@end
NS_ASSUME_NONNULL_END
