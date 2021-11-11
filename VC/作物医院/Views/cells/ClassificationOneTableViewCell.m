//
//  ClassificationOneTableViewCell.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/27.
//

#import "ClassificationOneTableViewCell.h"

@implementation ClassificationOneTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.imageV.clipsToBounds = YES;
    self.imageV.layer.cornerRadius = 10;
    self.bgView.clipsToBounds = YES;
    self.bgView.layer.cornerRadius = 10;
    self.cellTwoImageV.clipsToBounds = YES;
    self.cellTwoImageV.layer.cornerRadius = 10;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
