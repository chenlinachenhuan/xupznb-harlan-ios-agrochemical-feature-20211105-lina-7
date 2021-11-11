//
//  CustomBannerView.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol CustomBannerViewDelegate;
@interface CustomBannerView : UIView<UIScrollViewDelegate>
@property(nonatomic,retain)UIScrollView   * bannerScrollView;
@property(strong ,nonatomic) NSTimer      * bannerTimer;  //轮播定时器
@property(nonatomic,retain)NSMutableArray * imgArr;
@property(nonatomic,retain)UIPageControl  * bannerpageC;
@property(assign ,nonatomic) float          oldScrollOffset;   //记录之前Scroll偏移量
@property(assign ,nonatomic) float          bannerHeight;    
@property(assign ,nonatomic) BOOL          isTimer;

@property(nonatomic,weak)id delegate;
-(id)initWithFrame:(CGRect)frame imageArr:(NSMutableArray*)imgArr isTimer:(BOOL)isTimer;
@end
@protocol CustomBannerViewDelegate<NSObject>
-(void)imageViewDidClick:(NSInteger)clickTag;
@end

NS_ASSUME_NONNULL_END
