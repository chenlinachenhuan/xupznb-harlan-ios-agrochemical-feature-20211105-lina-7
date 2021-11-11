//
//  newPasswordViewController.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/21.
//

#import <UIKit/UIKit.h>
#import "rootViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface newPasswordViewController : rootViewController
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
@property (weak, nonatomic) IBOutlet UIButton *seeButton;
@property(nonatomic,retain)NSString * name;
@property(nonatomic,retain)NSString * code;
@end

NS_ASSUME_NONNULL_END
