//
//  resetPasswordViewController.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/21.
//

#import <UIKit/UIKit.h>
#import "rootViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface resetPasswordViewController : rootViewController
@property (weak, nonatomic) IBOutlet UIView *iconV;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *registerCons;
@property (weak, nonatomic) IBOutlet UIView *registerV;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *registerVCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *sureButtonCons;
@property (weak, nonatomic) IBOutlet UITextField *passwordFielf;
@property (weak, nonatomic) IBOutlet UIButton *sureButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
 

@end

NS_ASSUME_NONNULL_END
