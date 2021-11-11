//
//  oneProductTableViewCell.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/4.
//

#import "oneProductTableViewCell.h"

@implementation oneProductTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.bgView.layer.cornerRadius=10   ;
    self.clipsToBounds=YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
