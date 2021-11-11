//
//  newsCommentTableViewCell.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/18.
//

#import <UIKit/UIKit.h>
#import "newsLikeButton.h"
NS_ASSUME_NONNULL_BEGIN

@interface newsCommentTableViewCell : UITableViewCell
@property(nonatomic,retain) UIImageView *iconView;
@property(nonatomic,retain) UILabel *nameLabel;
@property(nonatomic,retain) UILabel *timeLabel;
@property(nonatomic,retain) UILabel *textL;
@property(nonatomic,retain) newsLikeButton *likeButton;
@property(nonatomic,retain) UIButton *reportButton;
@property(nonatomic,retain) UILabel *lineL;

@end

NS_ASSUME_NONNULL_END
