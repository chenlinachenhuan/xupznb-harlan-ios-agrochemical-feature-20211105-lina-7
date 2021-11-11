//
//  rootViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/28.
//

#import "rootViewController.h"
#import "Agro_loginViewController.h"
@interface rootViewController ()

@end

@implementation rootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter ]addObserver:self selector:@selector(errorStatesMehod:) name:@"errorStates" object:nil];
}
-(void)errorStatesMehod:(NSNotification*)noti{
    int code = [[noti.userInfo objectForKey:@"code"] intValue];
    NSString *message = [noti.userInfo objectForKey:@"message"];
    [[ChrysanthemumIndexView sharedMasterUser]remove];
    FBUtilShowTipView(self.view,message);
    if (code==401) {
      
        Agro_loginViewController * login = [[Agro_loginViewController alloc] init];
        login.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:login animated:YES completion:nil];
    }
  
    
}
-(UIUserInterfaceStyle)overrideUserInterfaceStyle{

    return UIUserInterfaceStyleLight;

}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
