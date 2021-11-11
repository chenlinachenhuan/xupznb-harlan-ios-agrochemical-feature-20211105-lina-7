//
//  waterCollectionViewCell.h
//  collectionView
//
//  Created by 王双龙 on 2017/10/16.
//  Copyright © 2017年 王双龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface waterCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageV;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@end
