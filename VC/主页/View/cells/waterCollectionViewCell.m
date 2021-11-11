//
//  waterCollectionViewCell.m
//  collectionView
//
//  Created by 王双龙 on 2017/10/16.
//  Copyright © 2017年 王双龙. All rights reserved.
//

#import "waterCollectionViewCell.h"

@implementation waterCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.clipsToBounds = YES;
    self.layer.cornerRadius = 10;
    self.headerImageV.clipsToBounds = YES;
    self.headerImageV.layer.cornerRadius = self.headerImageV.frame.size.width/2;

}

@end
