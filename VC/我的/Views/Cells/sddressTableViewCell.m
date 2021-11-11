//
//  sddressTableViewCell.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/27.
//

#import "sddressTableViewCell.h"

@implementation sddressTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self==[super initWithStyle:style reuseIdentifier:@"cell"]) {
        
    }
    return self;
}
-(UIView*)iconV{
    if (!_iconV) {
        _iconV = [[UIView alloc] init];
        _iconV.backgroundColor = SelectColor;
        [self addSubview:_iconV];
    }
    return _iconV;
}
-(UILabel*)iconL{
    if (!_iconL) {
        _iconL = [[UILabel alloc] init];
        _iconL.textColor = [UIColor whiteColor];
        _iconL.font = FontSize(15);
        _iconL.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_iconL];
    }
    return _iconL;
}
-(UILabel*)nameL{
    if (!_nameL) {
        _nameL = [[UILabel alloc] init];
        _nameL.textColor = [UIColor blackColor];
        _nameL.font = FontSize(16);
        
        [self addSubview:_nameL];
    }
    return _nameL;
}
-(UILabel*)phoneL{
    if (!_phoneL) {
        _phoneL = [[UILabel alloc] init];
        _phoneL.textColor = UIColorFromRGB(0x868686);
        _phoneL.font = FontSize(13);
        [self addSubview:_phoneL];
    }
    return _phoneL;
}
-(UILabel*)selectAddressL{
    if (!_selectAddressL) {
        _selectAddressL = [[UILabel alloc] init];
        _selectAddressL.textColor = [UIColor whiteColor];
        _selectAddressL.font = FontSize(12);
        _selectAddressL.backgroundColor = UIColorFromRGB(0xFEC146);
        _selectAddressL.text = @"默认";
        _selectAddressL.hidden=YES;
        _selectAddressL.textAlignment = NSTextAlignmentCenter;
        _selectAddressL.clipsToBounds=YES;
        _selectAddressL.layer.cornerRadius = 5;
        [self addSubview:_selectAddressL];
    }
    return _selectAddressL;
}
-(UILabel*)addressL{
    if (!_addressL) {
        _addressL = [[UILabel alloc] init];
        _addressL.textColor = [UIColor blackColor];
        _addressL.font = FontSize(14);
        _addressL.numberOfLines=0;
        [self addSubview:_addressL];
    }
    return _addressL;
}
-(UIButton*)checkB{
    if (!_checkB) {
        _checkB = [UIButton buttonWithType:UIButtonTypeCustom];
        _checkB.frame = CGRectMake(self.frame.size.width-28, self.center.y-8, 16, 16);
        [_checkB setImage:[UIImage imageNamed:@"修改"] forState:UIControlStateNormal];
        [self addSubview:_checkB];
    }
    return _checkB;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
