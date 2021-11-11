//
//  goodscustomBannerView.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol goodscustomBannerViewDelegate;

@interface goodscustomBannerView : UIView<UIScrollViewDelegate>
@property(nonatomic,retain)UIScrollView   * bannerScrollView;
@property(nonatomic,retain)NSMutableArray * imgArr;
@property(nonatomic,retain)UIPageControl  * bannerpageC;
@property(assign ,nonatomic) float          oldScrollOffset;   //记录之前Scroll偏移量
@property(assign ,nonatomic) float          bannerHeight;
@property(nonatomic,retain)UIScrollView * imageScroll;
@property(nonatomic,retain)UIPageControl * pageControl;
@property(nonatomic,retain)UILabel * pageL;
@property(nonatomic,retain)UIButton * backButton;
@property(nonatomic,weak)id delegate;
-(id)initWithFrame:(CGRect)frame imageArr:(NSMutableArray*)imgArr;
@end
@protocol goodscustomBannerViewDelegate<NSObject>
-(void)imageViewDidClick:(NSInteger)clickTag;
@end

NS_ASSUME_NONNULL_END
