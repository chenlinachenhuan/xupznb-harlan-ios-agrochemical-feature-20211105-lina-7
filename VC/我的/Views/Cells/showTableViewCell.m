//
//  showTableViewCell.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/29.
//

#import "showTableViewCell.h"

@implementation showTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self==[super initWithStyle:style reuseIdentifier:@"cell"]) {
        
    }
    return self;
}
-(UILabel*)firstTitle{
    if (!_firstTitle) {
        _firstTitle = [[UILabel alloc] initWithFrame:CGRectMake(13, 0, 20, 40)];
        _firstTitle.textColor = UIColorFromRGB(0x999999);
        _firstTitle.font = FontSize(12);
        [self addSubview:_firstTitle];
    }
    return _firstTitle;
}
-(UILabel*)title{
    if (!_title) {
        _title = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.firstTitle.frame)+12, 0, ScreenWidth, 40)];
        _title.font = FontSize(14);
        _title.textColor = UIColorFromRGB(0x333333);
        [self addSubview:_title];
    }
    return _title;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
