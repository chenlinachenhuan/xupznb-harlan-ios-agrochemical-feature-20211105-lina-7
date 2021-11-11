//
//  commentTableViewCell.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/23.
//

#import "commentTableViewCell.h"

@implementation commentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:@"cell"]) {
        self.contentView.userInteractionEnabled = YES;

        [self addSubview:self.nameL];
        [self addSubview:self.textL];

    }
    return self;
}
-(UILabel*)nameL{
    if (!_nameL) {
        _nameL = [[UILabel alloc]init];
        _nameL.font=[UIFont fontWithName:@"PingFang SC" size: 12];
        
    }
    return _nameL;
}
-(UILabel*)textL{
    if (!_textL) {
        _textL = [[UILabel alloc]init];
        _textL.font=[UIFont fontWithName:@"PingFang SC" size: 12];
        _textL.textColor =[UIColor colorWithRed:162/255.0 green:166/255.0 blue:172/255.0 alpha:1.0];
     }
    return _textL;
}
@end
