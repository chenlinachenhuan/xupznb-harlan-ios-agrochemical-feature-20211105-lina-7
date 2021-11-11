//
//  trendCollectionViewCell.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/23.
//

#import <UIKit/UIKit.h>
#import "MomentsBodyView.h"

NS_ASSUME_NONNULL_BEGIN
@class trendDataModel;
@interface trendCollectionViewCell : UICollectionViewCell
//主体
@property (nonatomic,weak) MomentsBodyView *bodyView;
@property (nonatomic,strong) NSMutableArray *moments;
@property (nonatomic,strong) trendDataModel *momentFrames;

@end

NS_ASSUME_NONNULL_END
