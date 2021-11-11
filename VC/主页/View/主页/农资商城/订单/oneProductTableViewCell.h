//
//  oneProductTableViewCell.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface oneProductTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageV;
@property (weak, nonatomic) IBOutlet UILabel *titleL;
@property (weak, nonatomic) IBOutlet UILabel *typeL;
@property (weak, nonatomic) IBOutlet UILabel *moneyL;
@property (weak, nonatomic) IBOutlet UILabel *countL;
@property (weak, nonatomic) IBOutlet UILabel *freightL;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *freightML;
@property (weak, nonatomic) IBOutlet UITextField *moreTF;
@property (weak, nonatomic) IBOutlet UIView *moreBgView;
@property (weak, nonatomic) IBOutlet UILabel *moreCountL;
@property (weak, nonatomic) IBOutlet UIView *moreProductView;

@end

NS_ASSUME_NONNULL_END
