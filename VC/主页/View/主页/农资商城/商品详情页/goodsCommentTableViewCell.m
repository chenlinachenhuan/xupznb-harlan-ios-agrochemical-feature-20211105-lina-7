//
//  goodsCommentTableViewCell.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/13.
//

#import "goodsCommentTableViewCell.h"

@implementation goodsCommentTableViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self==[super initWithStyle:style reuseIdentifier:@"cell"]) {
         
    }
    return self;
}
 

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(UIImageView*)headImageV{
    if (!_headImageV) {
        _headImageV = [[UIImageView alloc] init];
        _headImageV.clipsToBounds = YES;
        _headImageV.layer.cornerRadius = 19;
        [self addSubview:_headImageV];
    }
    return _headImageV;
}
-(UILabel*)nameL{
    if (!_nameL) {
        _nameL = [[UILabel alloc] init];
        _nameL.font = FontSize(15);
        [self addSubview:_nameL];
    }
    return _nameL;
}
-(UILabel*)dateL{
    if (!_dateL) {
        _dateL = [[UILabel alloc] init];
        _dateL.font = FontSize(10);
        _dateL.textColor = CommonColor;
        [self addSubview:_dateL];
    }
    return _dateL;
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
        _typeL.font = FontSize(12);
        _typeL.textColor = CommonColor;
        [self addSubview:_typeL];
    }
    return _typeL;
}
-(UIView*)imageV{
    if (!_imageV) {
        _imageV = [[UIView alloc] init];
        [self addSubview:_imageV];
    }
    return _imageV;
}
@end
