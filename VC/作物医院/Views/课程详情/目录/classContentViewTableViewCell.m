//
//  classContentViewTableViewCell.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/8.
//

#import "classContentViewTableViewCell.h"

@implementation classContentViewTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(UILabel*)textL{
    if (!_textL) {
        _textL = [[UILabel alloc] init];
        _textL.font = FontSize(14);
        _textL.numberOfLines = 0;
        [self addSubview:_textL];
    }
    return _textL;
}
-(UILabel*)typeL{
    if (!_typeL) {
        _typeL = [[UILabel alloc] init];
        _typeL.textColor = CommonColor;
        _typeL.hidden = YES;
        _typeL.font = FontSize(12);
        [self addSubview:_typeL];
    }
    return _typeL;
}
-(UIImageView*)typeImgV{
    if (!_typeImgV) {
        _typeImgV = [[UIImageView alloc] init];
        _typeImgV.hidden = YES;
        [self addSubview:_typeImgV];
    }
    return _typeImgV;
}
@end
