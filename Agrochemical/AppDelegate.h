//
//  AppDelegate.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/2.
//

#import <UIKit/UIKit.h>
#import "Agro_loginModel.h"
#import "ossModel.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property(nonatomic,assign)BOOL isLogin;
@property(nonatomic,retain)UIWindow * window;
@property(nonatomic,retain)Agro_loginModel * loginModel;
@property(nonatomic,retain)ossModel * ossModel;

@end

 
