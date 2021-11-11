//
//  collectionExpertTableViewCell.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface collectionExpertTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *titleL;
@property (weak, nonatomic) IBOutlet UIImageView *expertImgV1;
@property (weak, nonatomic) IBOutlet UIImageView *expertImgV2;
@property (weak, nonatomic) IBOutlet UIImageView *expertImgV3;
@property (weak, nonatomic) IBOutlet UILabel *textL;
@property (weak, nonatomic) IBOutlet UILabel *typeL;

@end

NS_ASSUME_NONNULL_END
