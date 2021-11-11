//
//  trendtabelView.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/15.
//

#import <UIKit/UIKit.h>
//#import "trendCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN
@interface trendImageView : UIView<UIScrollViewDelegate>
@property (nonatomic ,assign) CGFloat cellHeight;
@property (nonatomic ,assign)NSMutableArray * imageArr;
@property(retain ,nonatomic)UIPageControl * pageControl;
@property(retain ,nonatomic)UIScrollView*imageScroll;
-(void)imageFrame:(CGRect)frame imageArr:(NSMutableArray *)imageArr;
@end

NS_ASSUME_NONNULL_END
