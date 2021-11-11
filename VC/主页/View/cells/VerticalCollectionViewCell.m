//
//  VerticalCollectionViewCell.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/15.
//

#import "VerticalCollectionViewCell.h"

@implementation VerticalCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.clipsToBounds = YES;
    self.layer.cornerRadius = 10;
    self.viewsL.backgroundColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:0.5];;
}

@end
