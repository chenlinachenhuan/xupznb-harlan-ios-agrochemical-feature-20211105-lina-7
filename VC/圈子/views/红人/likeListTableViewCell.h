//
//  likeListTableViewCell.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface likeListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *numberImageV;
@property (weak, nonatomic) IBOutlet UILabel *numberL;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageV;
@property (weak, nonatomic) IBOutlet UILabel *nameL;
@property (weak, nonatomic) IBOutlet UILabel *typeL;
@property (weak, nonatomic) IBOutlet UIImageView *levelImageV;
@property (weak, nonatomic) IBOutlet UIButton *collectionB;

@end

NS_ASSUME_NONNULL_END
