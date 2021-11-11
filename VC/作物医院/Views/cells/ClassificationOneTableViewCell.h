//
//  ClassificationOneTableViewCell.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ClassificationOneTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *titleL;
@property (weak, nonatomic) IBOutlet UILabel *textL;
@property (weak, nonatomic) IBOutlet UILabel *nameL;
@property (weak, nonatomic) IBOutlet UILabel *moneyL;
@property (weak, nonatomic) IBOutlet UILabel *viewsL;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIImageView *cellTwoImageV;
@property (weak, nonatomic) IBOutlet UILabel *cellTwoTitleL;
@property (weak, nonatomic) IBOutlet UILabel *cellTwoTextL;
@property (weak, nonatomic) IBOutlet UILabel *cellTwoNameL;
@property (weak, nonatomic) IBOutlet UILabel *cellTwoMoneyL;

@end

NS_ASSUME_NONNULL_END
