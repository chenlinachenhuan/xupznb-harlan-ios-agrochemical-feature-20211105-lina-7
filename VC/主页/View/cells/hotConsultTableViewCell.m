//
//  hotConsultTableViewCell.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/17.
//

#import "hotConsultTableViewCell.h"

@implementation hotConsultTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.bgView.clipsToBounds = YES;
    self.bgView.layer.cornerRadius = 10;
    self.headImageV.clipsToBounds = YES;
    self.headImageV.layer.cornerRadius = self.headImageV.frame.size.height/2;
   
//    self.titleL.font = [UIFont fontWithName:@"PingFang SC" size: 15];
  
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
