//
//  goodsCommentTableViewCell.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface goodsCommentTableViewCell : UITableViewCell
@property(nonatomic,retain)UIImageView * headImageV;
@property(nonatomic,retain)UILabel * nameL;
@property(nonatomic,retain)UILabel * dateL;
@property(nonatomic,retain)UILabel * textL;
@property(nonatomic,retain)UILabel * typeL;
@property(nonatomic,retain)UIView * imageV;

@end

NS_ASSUME_NONNULL_END
