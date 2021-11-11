//
//  goodsImageScrollview.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/12.
//

#import <UIKit/UIKit.h>
#import "goodsViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface goodsImageScrollview : UIView<UIScrollViewDelegate>
@property(nonatomic,retain)UIScrollView * imageScroll;
@property(nonatomic,retain)UIPageControl * pageControl;
@property(nonatomic,retain)NSMutableArray * imgArr;
-(id)initWithArr:(NSMutableArray*)arr ;
-(void)showScorllViewMethod:(NSInteger)selectIndex;
@end

NS_ASSUME_NONNULL_END
