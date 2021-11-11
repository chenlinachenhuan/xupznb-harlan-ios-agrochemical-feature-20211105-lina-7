//
//  Agro_registerViewController.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/9.
//

#import <UIKit/UIKit.h>
#import "rootViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface Agro_registerViewController : rootViewController
@property (weak, nonatomic) IBOutlet UIView *iconV;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *registerCons;
@property (weak, nonatomic) IBOutlet UIView *registerV;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *registerVCons;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipsCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *codeCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginCons;
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UIButton *getCodeButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet bigButton *backButton;

@end

NS_ASSUME_NONNULL_END
