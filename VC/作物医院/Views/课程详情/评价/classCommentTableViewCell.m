//
//  classCommentTableViewCell.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/28.
//

#import "classCommentTableViewCell.h"

@implementation classCommentTableViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self==[super initWithStyle:style reuseIdentifier:@"cell"]) {
         
    }
    return self;
}
-(UIImageView*)imageV{
    if (!_imageV) {
        _imageV =[[UIImageView alloc] init ];
        _imageV.clipsToBounds = YES;
        _imageV.layer.cornerRadius = 31/2;
       [self addSubview:_imageV];
    }
    return _imageV;
}
-(UILabel*)nameL{
    if (!_nameL) {
        _nameL = [[UILabel alloc] init ];
        _nameL.font = FontSize(15);
        [self addSubview:_nameL];
    }
    return _nameL;
}
-(UILabel*)dateL{
    if (!_dateL) {
        _dateL = [[UILabel alloc] init ];
        _dateL.font = FontSize(10);
        _dateL.textColor = CommonColor;
        [self addSubview:_dateL];
    }
    return _dateL;
}
-(UILabel*)textL{
    if (!_textL) {
        _textL = [[UILabel alloc] init ];
        _textL.font = FontSize(14);
//        _textL.backgroundColor = [UIColor orangeColor];
        _textL.numberOfLines=0;

        [self addSubview:_textL];
    }
    return _textL;
}
-(UIView*)lineV{
    if (!_lineV) {
        _lineV = [[UIView alloc] init];
        _lineV.backgroundColor = [UIColor colorWithRed:218/255.0 green:221/255.0 blue:225/255.0 alpha:1.0];
        [self addSubview:_lineV];
    }
    return _lineV;
}
-(UIView*)StarV{
    if (!_StarV) {
        _StarV = [[UIView alloc] init];
        [self addSubview:_StarV];
    }
    return _StarV;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
