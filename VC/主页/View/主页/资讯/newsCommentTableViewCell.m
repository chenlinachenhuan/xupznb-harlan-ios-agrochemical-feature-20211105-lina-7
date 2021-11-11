//
//  newsCommentTableViewCell.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/18.
//

#import "newsCommentTableViewCell.h"

@implementation newsCommentTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self==[super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"newsComment"]) {
       
    }
    return self;
}
-(UIImageView*)iconView{
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
        _iconView.contentMode = 2;
        _iconView.clipsToBounds = YES;
        _iconView.layer.cornerRadius = _iconView.frame.size.width/2;
        [self addSubview:_iconView];
    }
    return _iconView;;
}
-(UILabel*)nameLabel{
    if (!_nameLabel) {
        // 昵称
        _nameLabel = [[UILabel alloc] init];
        [self addSubview:_nameLabel];
        _nameLabel.font = circleCellNameFont;
    }
    return _nameLabel;
}
-(UILabel*)timeLabel{
    if (!_timeLabel) {
        // 昵称
        _timeLabel = [[UILabel alloc] init];
        [self addSubview:_timeLabel];
        _timeLabel.textColor = [UIColor colorWithRed:162/255.0 green:166/255.0 blue:172/255.0 alpha:1.0];
        _timeLabel.font = FontSize(10);
    }
    return _timeLabel;
}
-(UILabel*)textL{
    if (!_textL) {
        // 文本
        _textL = [[UILabel alloc] init];
        _textL.font = FontSize(14);
        _textL.numberOfLines=0;
    //    textL.textColor = [UIColor colorWithRed:162/255.0 green:166/255.0 blue:172/255.0 alpha:1.0];
        [self addSubview:_textL];
    }
    return _textL;
}
-(UIButton*)likeButton{
    if (!_likeButton) {
        _likeButton = [[newsLikeButton alloc] init];
        [_likeButton setTitleColor:CommonColor forState:UIControlStateNormal];
        [_likeButton setImage:[UIImage imageNamed:@"点赞"] forState:UIControlStateNormal];
         [self addSubview:_likeButton];
    }
    return _likeButton;
}
-(UIButton*)reportButton{
    if (!_reportButton) {
        _reportButton = [[UIButton alloc] init];
        [_reportButton setBackgroundImage:[UIImage imageNamed:@"举报"] forState:UIControlStateNormal];
         [self addSubview:_reportButton];
    }
    return _reportButton;
}
-(UILabel*)lineL{
    if (!_lineL) {
        _lineL = [[UILabel alloc] init];
        _lineL.backgroundColor = UIColorFromRGB(0xDADDE1);
        [self addSubview:_lineL];
    }
    return _lineL;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
