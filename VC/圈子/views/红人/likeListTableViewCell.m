//
//  likeListTableViewCell.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/27.
//

#import "likeListTableViewCell.h"

@implementation likeListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.iconImageV.clipsToBounds = YES;
    self.iconImageV.layer.cornerRadius = 25;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
