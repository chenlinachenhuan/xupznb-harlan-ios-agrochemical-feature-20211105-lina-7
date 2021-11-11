//
//  classCommentTableViewCell.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface classCommentTableViewCell : UITableViewCell
@property(nonatomic,retain)UIImageView * imageV;
@property(nonatomic,retain)UILabel * nameL;
@property(nonatomic,retain)UILabel * dateL;
@property(nonatomic,retain)UILabel * textL;
@property(nonatomic,retain)UIView * lineV;
@property(nonatomic,retain)UIView * StarV;

@end

NS_ASSUME_NONNULL_END
