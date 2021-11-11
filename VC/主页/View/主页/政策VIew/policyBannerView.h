//
//  policyBannerView.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol policyBannerViewDelegate;

@interface policyBannerView : UIView<UIScrollViewDelegate>
@property(nonatomic,retain)UIScrollView   * bannerScrollView;
@property(strong ,nonatomic) NSTimer      * bannerTimer;  //轮播定时器
@property(nonatomic,retain)NSMutableArray * titleArr;
@property(nonatomic,retain)UIPageControl  * bannerpageC;
@property(assign ,nonatomic) float          oldScrollOffset;   //记录之前Scroll偏移量
@property(assign ,nonatomic) float          bannerHeight;

@property(nonatomic,weak)id delegate;
-(id)initWithFrame:(CGRect)frame titleArr:(NSMutableArray*)titleArr;
@end
@protocol policyBannerViewDelegate<NSObject>
-(void)policyViewDidClick:(NSInteger)clickTag;
@end

NS_ASSUME_NONNULL_END
