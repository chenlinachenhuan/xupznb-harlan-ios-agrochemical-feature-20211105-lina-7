//
//  selectTableViewCell.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/29.
//

#import "selectTableViewCell.h"

@implementation selectTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self==[super initWithStyle:style reuseIdentifier:@"cell"]) {
        
    }
    return self;
}
-(UILabel*)titleL{
    if (!_titleL) {
        _titleL = [[UILabel alloc] initWithFrame:CGRectMake(16.5, 0, ScreenWidth, 40)];
        _titleL.font = FontSize(17);
        [self addSubview:_titleL];
    }
    return _titleL;
}
-(UIButton*)button{
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(ScreenWidth-30.5, 15, 6, 10);
//        [_button setImage:[UIImage imageNamed:@"大模块进入我的"] forState:UIControlStateNormal];
        [self addSubview:_button];
    }
    return _button;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
