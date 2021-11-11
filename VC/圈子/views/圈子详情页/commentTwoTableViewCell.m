//
//  commentTwoTableViewCell.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/11.
//

#import "commentTwoTableViewCell.h"

@implementation commentTwoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(UILabel*)textL{
    if (!_textL) {
        _textL = [[UILabel alloc] init];
        _textL.font = FontSize(12);
        _textL.numberOfLines=0;
        _textL.textColor = CommonColor;
        [self addSubview:_textL];
    }
    return _textL;
}

@end
