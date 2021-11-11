//
//  goodsImageView.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface goodsImageView : UIView<UIScrollViewDelegate,UIGestureRecognizerDelegate>
@property(nonatomic,retain)UIScrollView * imageScroll;
@property(nonatomic,retain)UIPageControl * pageControl;
@property(nonatomic,retain)UILabel * pageL;
@property(nonatomic,retain)UIButton * backButton;
@property(nonatomic,retain)NSMutableArray * imgArr;

-(id)initWithFrame:(CGRect)frame withImageArr:(NSMutableArray*)imageArr;
@end

NS_ASSUME_NONNULL_END
