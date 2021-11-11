//
//  carCellTableViewCell.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/26.
//

#import <UIKit/UIKit.h>
#import "cartButton.h"
#import "cartProductModel.h"
#import "cartListProductModel.h"
NS_ASSUME_NONNULL_BEGIN
typedef void(^DWQNumberChangedBlock)(NSInteger number);
typedef void(^DWQCellSelectedBlock)(BOOL select);
@interface carCellTableViewCell : UITableViewCell
{
    DWQNumberChangedBlock numberAddBlock;
    DWQNumberChangedBlock numberCutBlock;
//    DWQCellSelectedBlock cellSelectedBlock;
}
@property (weak, nonatomic) IBOutlet cartButton *selectButton;
@property (weak, nonatomic) IBOutlet UIImageView *cellImageV;
@property (weak, nonatomic) IBOutlet UILabel *titleL;
@property (weak, nonatomic) IBOutlet UILabel *typeNameL;
@property (weak, nonatomic) IBOutlet UILabel *moneyL;
@property (weak, nonatomic) IBOutlet UILabel *countL;
@property (assign,nonatomic)NSInteger dwqNumber;
@property (assign,nonatomic)BOOL dwqSelected;
@property (copy,nonatomic)DWQCellSelectedBlock cellSelectedBlock;

- (void)reloadDataWithModel:(cartProductModel*)model;
- (void)numberAddWithBlock:(DWQNumberChangedBlock)block;
- (void)numberCutWithBlock:(DWQNumberChangedBlock)block;
- (void)cellSelectedWithBlock:(DWQCellSelectedBlock)block;
@end

NS_ASSUME_NONNULL_END
