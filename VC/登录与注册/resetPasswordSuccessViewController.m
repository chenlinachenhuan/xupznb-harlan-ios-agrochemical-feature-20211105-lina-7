//
//  resetPasswordSuccessViewController.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/22.
//

#import "resetPasswordSuccessViewController.h"

@interface resetPasswordSuccessViewController ()

@end

@implementation resetPasswordSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginButton.clipsToBounds = YES;
    self.loginButton.layer.cornerRadius = 16;
    
}
- (IBAction)backButtonMethod:(bigButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}
- (IBAction)loginBUttonMethod:(UIButton *)sender {
    [self dismissViewControllerClass:NSClassFromString(@"Agro_loginViewController")];

}
- (void)dismissViewControllerClass:(Class)class {
    UIViewController *vc = self;
    while (![vc isKindOfClass:class] && vc != nil) {
        vc = vc.presentingViewController;
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController *)vc).viewControllers.lastObject;
        }
    }
    [vc dismissViewControllerAnimated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
