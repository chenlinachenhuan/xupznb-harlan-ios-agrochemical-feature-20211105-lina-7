//
//  sddressTableViewCell.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface sddressTableViewCell : UITableViewCell
@property(nonatomic,retain)UIView * iconV;
@property(nonatomic,retain)UILabel * iconL;
@property(nonatomic,retain)UILabel * nameL;
@property(nonatomic,retain)UILabel * phoneL;
@property(nonatomic,retain)UILabel * selectAddressL;
@property(nonatomic,retain)UILabel * addressL;
@property(nonatomic,retain)UIButton * checkB;

@end

NS_ASSUME_NONNULL_END
