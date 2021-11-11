//
//  productListCollectionViewCell.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface productListCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *money;

@end

NS_ASSUME_NONNULL_END
