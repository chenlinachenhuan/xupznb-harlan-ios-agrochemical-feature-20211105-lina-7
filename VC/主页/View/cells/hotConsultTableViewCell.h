//
//  hotConsultTableViewCell.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface hotConsultTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImageV;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *titleL;
@property (weak, nonatomic) IBOutlet UILabel *textL;

@end

NS_ASSUME_NONNULL_END
