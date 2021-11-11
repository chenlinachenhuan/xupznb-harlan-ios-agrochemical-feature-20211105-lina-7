//
//  childListCollectionViewCell.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface childListCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *englishName;

@end

NS_ASSUME_NONNULL_END
