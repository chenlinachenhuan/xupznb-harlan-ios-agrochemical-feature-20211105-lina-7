//
//  productListCollectionViewCell.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/1.
//

#import "productListCollectionViewCell.h"

@implementation productListCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.clipsToBounds = YES;
    self.layer.cornerRadius = 5;
}

@end
