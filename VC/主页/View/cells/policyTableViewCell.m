//
//  policyTableViewCell.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/14.
//

#import "policyTableViewCell.h"

@implementation policyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.bView.clipsToBounds = YES;
    self.bView.layer.cornerRadius = 10;
    self.imageV.clipsToBounds = YES;
    self.imageV.layer.cornerRadius = 10;
    self.typeL.clipsToBounds = YES;
    self.typeL.layer.cornerRadius = 5;
    self.typeL.hidden = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
