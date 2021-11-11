//
//  AppDelegate.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/2.
//

#import "AppDelegate.h"
#import <QWeather/QWeather.h>
#import "WXApiManager.h"

@interface AppDelegate ()<WXApiDelegate>
@property(nonatomic,retain)OSSClient*  client;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
       // 第一种办法：为了避免push和pop时导航条出现的黑块，给window设置一个背景色
    self.window.backgroundColor = [UIColor colorWithRed:248/255.0 green:250/255.0 blue:251/255.0 alpha:1.0];;
       [self.window makeKeyAndVisible];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    [WXApi registerApp:@"wxb2c511ed7fed3936" universalLink:@"https://www.jianshu.com/p/2793f15fee16/"];

      return YES;
}
 
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return  [WXApi handleOpenURL:url delegate:self];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [WXApi handleOpenURL:url delegate:self];
}
- (void)onResp:(BaseResp *)resp {
    if ([resp isKindOfClass:[PayResp class]]) {
        /*
         enum  WXErrCode {
         WXSuccess           = 0,    < 成功
         WXErrCodeCommon     = -1,  < 普通错误类型
         WXErrCodeUserCancel = -2,   < 用户点击取消并返回
         WXErrCodeSentFail   = -3,   < 发送失败
         WXErrCodeAuthDeny   = -4,   < 授权失败
         WXErrCodeUnsupport  = -5,   < 微信不支持
         };
         */
        PayResp *response = (PayResp*)resp;
        switch (response.errCode) {
            case WXSuccess: {
                NSLog(@"微信回调支付成功");
            break;
            }
            case WXErrCodeCommon: {
                NSLog(@"微信回调支付异常");
                break;
            }
            case WXErrCodeUserCancel: {
                NSLog(@"微信回调用户取消支付");
                break;
            }
            case WXErrCodeSentFail: {
                NSLog(@"微信回调发送支付信息失败");
                break;
            }
            case WXErrCodeAuthDeny: {
                NSLog(@"微信回调授权失败");
                break;
            }
            case WXErrCodeUnsupport: {
                NSLog(@"微信回调微信版本暂不支持");
                break;
            }
            default: {
                break;
            }
        }
    }
}
#pragma mark - UISceneSession lifecycle
 

- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options  API_AVAILABLE(ios(13.0)){
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions  API_AVAILABLE(ios(13.0)){
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
