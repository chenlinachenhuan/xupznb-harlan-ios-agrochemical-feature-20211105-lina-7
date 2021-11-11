//
//  childListCollectionViewCell.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/1.
//

#import "childListCollectionViewCell.h"

@implementation childListCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.imageV.clipsToBounds = YES;
    self.imageV.layer.cornerRadius = 20;
}

@end
