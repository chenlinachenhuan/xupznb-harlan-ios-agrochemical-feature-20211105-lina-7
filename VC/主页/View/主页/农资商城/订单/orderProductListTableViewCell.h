//
//  orderProductListTableViewCell.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface orderProductListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cellImageV;
@property (weak, nonatomic) IBOutlet UILabel *titleL;
@property (weak, nonatomic) IBOutlet UILabel *typeNameL;
@property (weak, nonatomic) IBOutlet UILabel *moneyL;
@property (weak, nonatomic) IBOutlet UILabel *countL;
@end

NS_ASSUME_NONNULL_END
