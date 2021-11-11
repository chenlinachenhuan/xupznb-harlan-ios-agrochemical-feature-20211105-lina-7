//
//  weatherScrollview.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/18.
//

#import <UIKit/UIKit.h>
#import "weatherDayModel.h"
#import "weatherMonthModel.h"
#import "weatherModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface weatherScrollview : UIView<UIScrollViewDelegate>
@property(nonatomic,retain)UIScrollView   * dayBannerScrollView;
@property(nonatomic,retain)UIScrollView   * monthBannerScrollView;

@property(assign ,nonatomic) float          oldScrollOffset;   //记录之前Scroll偏移量
@property(assign ,nonatomic) float          bannerHeight;
@property(nonatomic,retain)weatherModel * model;
@property(nonatomic,retain)weatherMonthModel * monthModel;

@property(nonatomic,retain)NSMutableArray * weatherDayArr;
@property(nonatomic,retain)NSMutableArray * weatherMonthArr;

@property(nonatomic,retain)UIPageControl*dayBannerpageC;
@property(nonatomic,retain)UIPageControl*monthBannerpageC;

@property(nonatomic,assign)NSInteger weatherArrCount;
@property(nonatomic,retain)UIView * DayView;
@property(nonatomic,retain)UIView * MonthView;
@property(nonatomic,retain)UIButton * rotationDayButton;
@property(nonatomic,retain)UILabel * dayTimeL;
@property(nonatomic,retain)UILabel * daytemL;
@property(nonatomic,retain)UIImageView * dayImageV;
@property(nonatomic,retain)UILabel * monthTimeL;
@property(nonatomic,retain)UILabel * monthTemL;
@property(nonatomic,retain)UIImageView * monthImageV;
@property(nonatomic,retain)UILabel * monthTypeL;
@property(nonatomic,retain)UILabel * monthdateL;

@property(nonatomic,assign)BOOL  IsDayWeather;
-(id)initWithFrame:(CGRect)frame weatherDayArr:(NSMutableArray*)weatherDayArr weatherMonthArr:(NSMutableArray*)weatherMonthArr;
-(void)reloadDataMethod:(weatherModel*)model;

 @end

NS_ASSUME_NONNULL_END
