//
//  MyClassTableViewCell.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyClassTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *titleL;
@property (weak, nonatomic) IBOutlet UILabel *textL;
@property (weak, nonatomic) IBOutlet UILabel *nameL;
@property (weak, nonatomic) IBOutlet UILabel *classNumberL;
@property (weak, nonatomic) IBOutlet UILabel *typeL;

@end

NS_ASSUME_NONNULL_END
