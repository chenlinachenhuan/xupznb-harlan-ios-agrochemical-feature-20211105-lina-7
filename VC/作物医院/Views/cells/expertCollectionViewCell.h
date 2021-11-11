//
//  expertCollectionViewCell.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface expertCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImageV;
@property (weak, nonatomic) IBOutlet UILabel *nameL;
@property (weak, nonatomic) IBOutlet UILabel *typeL;

@end

NS_ASSUME_NONNULL_END
