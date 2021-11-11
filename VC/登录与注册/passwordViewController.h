//
//  passwordViewController.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/9.
//

#import <UIKit/UIKit.h>
#import "rootViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface passwordViewController : rootViewController
@property (weak, nonatomic) IBOutlet UIView *iconV;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *passwordCons;
@property (weak, nonatomic) IBOutlet UIView *passwordV;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *passwordVCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rigisterButtonCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginCons;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property(nonatomic,retain)NSString * name;
@property(nonatomic,retain)NSString * code;

@end

NS_ASSUME_NONNULL_END
