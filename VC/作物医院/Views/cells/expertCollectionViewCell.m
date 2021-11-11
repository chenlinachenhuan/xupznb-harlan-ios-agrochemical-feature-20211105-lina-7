//
//  expertCollectionViewCell.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/18.
//

#import "expertCollectionViewCell.h"

@implementation expertCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.headImageV.clipsToBounds = YES;
    self.headImageV.layer.cornerRadius = 74/2;
}

@end
