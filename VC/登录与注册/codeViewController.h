//
//  codeViewController.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/9.
//

#import <UIKit/UIKit.h>
#import "rootViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface codeViewController : rootViewController
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *backBattonCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *codeCons;
@property (weak, nonatomic) IBOutlet UILabel *timeL;
@property (weak, nonatomic) IBOutlet UIView *iconV;
@property (weak, nonatomic) IBOutlet UILabel *tipL;
@property (weak, nonatomic) IBOutlet UIView *codeV;
@property (weak, nonatomic) IBOutlet UIButton *sureButton;
@property(nonatomic,retain)NSString * name;
@property (weak, nonatomic) IBOutlet UIButton *timeButton;
@property(nonatomic,assign)NSInteger type;

@end

NS_ASSUME_NONNULL_END
