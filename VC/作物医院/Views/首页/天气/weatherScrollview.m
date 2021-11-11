//
//  weatherScrollview.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/18.
//
#define scrWidth (ScreenWidth-32)
#import "weatherScrollview.h"
@implementation weatherScrollview
-(id)initWithFrame:(CGRect)frame weatherDayArr:(NSMutableArray*)weatherDayArr weatherMonthArr:(NSMutableArray*)weatherMonthArr{
    if (self=[super initWithFrame:frame]) {
        self.bannerHeight = self.frame.size.height;
        
        self.weatherDayArr = [[NSMutableArray alloc] init];
        self.weatherMonthArr = [[NSMutableArray alloc] init];
        [self reloadDataMethod:self.model];
    }
    return self;
}
-(void)reloadDataMethod:(weatherModel*)model{
    self.model = model;
    self.weatherDayArr =model.hourListArr;
    self.weatherMonthArr = model.dayListArr;
    self.IsDayWeather = YES;
    self.IsDayWeather==YES?self.weatherArrCount=5:2;
    if (self.weatherDayArr!=0&&self.weatherMonthArr.count!=0) {
        [self createDayBanner];
//       [self createMonthBanner];
    }
     
}
-(NSMutableArray*)weatherDayArr{
    if (!_weatherDayArr) {
        _weatherDayArr = [[NSMutableArray alloc] init];
    }
    return _weatherDayArr;
}
-(NSMutableArray*)weatherMonthArr{
    if (!_weatherMonthArr) {
        _weatherMonthArr = [[NSMutableArray alloc] init];
    }
    return _weatherMonthArr;
}
-(void)createDayBanner{
     
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(15,12.5,[commonMethod widthAuto:@"24小时天气预报" fontSize:14 contentheight:13],13);
    label.numberOfLines = 0;
    label.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
    label.font = [UIFont fontWithName:@"PingFang SC" size:14];
    label.text = @"24小时天气预报";
    [self.DayView addSubview:label];
    
    _rotationDayButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _rotationDayButton.frame = CGRectMake(scrWidth-0.0248227*ScreenHeight-10, label.center.y-0.0248227*ScreenHeight*0.5, 0.0248227*ScreenHeight, 0.0248227*ScreenHeight);
    [_rotationDayButton addTarget:self action:@selector(rotationButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [_rotationDayButton setImage:[UIImage imageNamed:@"旋转"] forState:UIControlStateNormal];
    [self.DayView addSubview:_rotationDayButton];
 
    UILabel *label1 = [[UILabel alloc] init];
    label1.frame = CGRectMake(self.rotationDayButton.frame.origin.x-[commonMethod widthAuto:@"查看近7天预报" fontSize:12 contentheight:11.5]-7.5,label.center.y-11.5*0.5,[commonMethod widthAuto:@"查看近7天预报" fontSize:12 contentheight:11.5],11.5);
    label1.numberOfLines = 0;
    label1.text =@"查看近7天预报";
    label1.font =[UIFont fontWithName:@"PingFang SC" size: 12];
    label1.textColor =[UIColor colorWithRed:98/255.0 green:191/255.0 blue:180/255.0 alpha:1.0];
    [self.DayView addSubview:label1];
    
    [self.DayView addSubview:self.dayBannerScrollView];
    [self.DayView addSubview:self.dayBannerpageC];

    for (int i = 0; i <_weatherArrCount+1; i++) {
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(i*scrWidth, 0, CGRectGetWidth(self.dayBannerScrollView.frame), CGRectGetHeight(self.dayBannerScrollView.frame))];
        [self.dayBannerScrollView addSubview:view];
        for (int j=0; j<5; j++) {
            
            if (i*5+j<self.weatherDayArr.count) {
                UILabel * dayTimeL = [[UILabel alloc] initWithFrame:CGRectMake( j*(scrWidth-32)/5+16, 0, (scrWidth-32)/5, 12)];
                dayTimeL.textColor = [UIColor orangeColor];
                dayTimeL.textAlignment = NSTextAlignmentCenter;
                dayTimeL.font =[UIFont fontWithName:@"PingFang SC" size: 12];
                [view addSubview:dayTimeL];
                UIImageView * imageV;
                imageV = [[UIImageView alloc] initWithFrame:CGRectMake(dayTimeL.center.x-CGRectGetHeight(self.frame)*0.132353*0.5*0.83333333, CGRectGetMaxY(dayTimeL.frame)+29, CGRectGetHeight(self.frame)*0.132353, CGRectGetHeight(self.frame)*0.132353)];
                imageV.tag = i*5+j;
                [view addSubview:imageV];
                UILabel * temL = [[UILabel alloc] initWithFrame:CGRectMake( dayTimeL.center.x-[commonMethod widthAuto:@"2455" fontSize:16 contentheight:13.5]*0.5, CGRectGetMaxY(imageV.frame)+17, [commonMethod widthAuto:@"2455" fontSize:16 contentheight:13.5], 13.5)];
                temL.textColor = [UIColor orangeColor];
                temL.textAlignment = NSTextAlignmentCenter;
                temL.font =[UIFont fontWithName:@"PingFang SC" size: 16];
                [view addSubview:temL];
                self.dayBannerpageC.frame  = CGRectMake(0, CGRectGetMaxY(self.DayView.frame)-16, CGRectGetWidth(self.dayBannerScrollView.frame), 2);

                weatherDayModel * model;
                if (i==self.weatherArrCount) {
                   model = _weatherDayArr[j];
                }else{
                    model = self.weatherDayArr[j+i*5];
                }
                NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
                [formatter setDateFormat:@"HH:mm"];//yyyy年MM月dd日
                NSString *dateString = model.fxTime;
                NSRange range = NSMakeRange(11, 5);
                dateString = [dateString substringWithRange:range];//误区** 字符串长度必须与formatter长度对应一致 不然date就是nil
                NSDate *date = [formatter dateFromString:dateString];
    //                    [formatter setDateFormat:@"yyyy年MM月dd日"];
                 dayTimeL.text = [formatter stringFromDate:date];
                [self setWeatherImage:imageV];
                temL.text = [NSString stringWithFormat:@"%@°",model.temp];
            }
            
            
            
        }
    }
}
-(void)setWeatherImage:(UIImageView*)imageV{
    NSString * path = [[NSBundle mainBundle]pathForResource:@"天气小icon" ofType:@"bundle"];
    NSString *secondP;
    if (self.IsDayWeather==YES) {
        weatherDayModel * model = _weatherDayArr[imageV.tag];
        secondP = [path stringByAppendingPathComponent:model.icon];

    }else{
        weatherMonthModel * model = _weatherMonthArr[imageV.tag];
       secondP = [path stringByAppendingPathComponent:model.iconDay];

    }
   [self showAllFileWithPath:secondP imageView:imageV];
    
   
}
- (void)showAllFileWithPath:(NSString *) path  imageView:(UIImageView*)imageV{
    NSFileManager * fileManger = [NSFileManager defaultManager];
    BOOL isDir = NO;
    BOOL isExist = [fileManger fileExistsAtPath:path isDirectory:&isDir];
    if (isExist) {
        if (isDir) {
            NSArray * dirArray = [fileManger contentsOfDirectoryAtPath:path error:nil];
            NSString * subPath = nil;
            for (NSString * str in dirArray) {
                subPath  = [path stringByAppendingPathComponent:str];
                BOOL issubDir = NO;
                [fileManger fileExistsAtPath:subPath isDirectory:&issubDir];
                [self showAllFileWithPath:subPath imageView:imageV];
            }
        }else{
            NSString *fileName = [[path componentsSeparatedByString:@"/"] lastObject];
            if ([fileName hasSuffix:@".png"]) {
              UIImage*  image = [[UIImage alloc] initWithContentsOfFile:[NSString stringWithFormat:@"%@",path]];
                imageV.image = image;
            }else if([fileName hasSuffix:@".mv"]){
//                    [self.imageArray addObject:fileName];
            }
        }
    }else{
        NSLog(@"this path is not exist!");
    }
}
-(void)createMonthBanner{
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(15,12.5,[commonMethod widthAuto:@"近7天天气预报" fontSize:14 contentheight:13],13);
    label.numberOfLines = 0;
    label.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
    label.font = [UIFont fontWithName:@"PingFang SC" size:14];
    label.text = @"近7天天气预报";
    [self.MonthView addSubview:label];
    
    _rotationDayButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _rotationDayButton.frame = CGRectMake(scrWidth-0.0248227*ScreenHeight-10, label.center.y-0.0248227*ScreenHeight*0.5, 0.0248227*ScreenHeight, 0.0248227*ScreenHeight);
    [_rotationDayButton addTarget:self action:@selector(rotationButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [_rotationDayButton setImage:[UIImage imageNamed:@"旋转"] forState:UIControlStateNormal];
    [self.MonthView addSubview:_rotationDayButton];
 
    UILabel *label1 = [[UILabel alloc] init];
    label1.frame = CGRectMake(self.rotationDayButton.frame.origin.x-[commonMethod widthAuto:@"查看24小时预报" fontSize:12 contentheight:11.5]-7.5,label.center.y-11.5*0.5,[commonMethod widthAuto:@"查看24小时预报" fontSize:12 contentheight:11.5],11.5);
    label1.numberOfLines = 0;
    label1.text =@"查看24小时预报";
    label1.font =[UIFont fontWithName:@"PingFang SC" size: 12];
    label1.textColor =[UIColor colorWithRed:98/255.0 green:191/255.0 blue:180/255.0 alpha:1.0];
    [self.MonthView addSubview:label1];

    [self.MonthView addSubview:self.monthBannerScrollView];
    [self.MonthView addSubview:self.monthBannerpageC];

    for (int i = 0; i <_weatherArrCount+1; i++) {
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(i*scrWidth, 0, CGRectGetWidth(self.monthBannerScrollView.frame), CGRectGetHeight(self.monthBannerScrollView.frame))];
        [self.monthBannerScrollView addSubview:view];
        for (int j=0; j<5; j++) {
            if (i*5+j<self.weatherMonthArr.count) {
                weatherMonthModel * model;
                UILabel * timeL = [[UILabel alloc] initWithFrame:CGRectMake( j*(scrWidth-10)/5+5, 0, (scrWidth-32)/5, 12)];
    //            dateL.textColor = [UIColor orangeColor];
                timeL.textAlignment = NSTextAlignmentCenter;
                timeL.font =[UIFont fontWithName:@"PingFang SC" size: 12];
                [view addSubview:timeL];
                
                UILabel * dateL = [[UILabel alloc] initWithFrame:CGRectMake(j*(scrWidth-10)/5+5, CGRectGetMaxY(timeL.frame)+10.5, (scrWidth-32)/5, 12)];
    //            dateL.textColor = [UIColor orangeColor];
                dateL.textAlignment = NSTextAlignmentCenter;
                dateL.font =[UIFont fontWithName:@"PingFang SC" size: 10];
                [view addSubview:dateL];
                
                UIImageView * imageV = [[UIImageView alloc] initWithFrame:CGRectMake(dateL.center.x-CGRectGetHeight(self.frame)*0.132353*0.5, CGRectGetMaxY(dateL.frame)+10, CGRectGetHeight(self.frame)*0.132353, CGRectGetHeight(self.frame)*0.132353*0.833333333)];
                [view addSubview:imageV];

                UILabel * typeL = [[UILabel alloc] initWithFrame:CGRectMake(j*(scrWidth-10)/5+5, CGRectGetMaxY(imageV.frame)+12, (scrWidth-32)/5, 12)];
    //            dateL.textColor = [UIColor orangeColor];
                typeL.textAlignment = NSTextAlignmentCenter;
                typeL.font =[UIFont fontWithName:@"PingFang SC" size: 12];
                [view addSubview:typeL];
                
                UILabel * temL = [[UILabel alloc] initWithFrame:CGRectMake(j*(scrWidth-10)/5+5, CGRectGetMaxY(typeL.frame)+17.5, (scrWidth-10)/5, 13.5)];
                temL.textColor = [UIColor orangeColor];
                temL.textAlignment = NSTextAlignmentCenter;
                temL.font =[UIFont fontWithName:@"PingFang SC" size: 14];
                [view addSubview:temL];
                
                self.monthBannerpageC.frame  = CGRectMake(0, CGRectGetMaxY(self.MonthView.frame)-16, CGRectGetWidth(self.monthBannerScrollView.frame), 2);
                if (i==self.weatherMonthArr.count) {
                   model = self.weatherMonthArr[j];
                }else{
                   
                    model = self.weatherMonthArr[j+i*5];
                }
                NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
                [formatter setDateFormat:@"MM/dd"];//yyyy年MM月dd日
                NSString *dateString = model.fxDate;
                NSRange range = NSMakeRange(5, 5);
                dateString = [dateString substringWithRange:range];//误区** 字符串长度必须与formatter长度对应一致 不然date就是nil
                NSDate *date = [formatter dateFromString:dateString];
    //                    [formatter setDateFormat:@"yyyy年MM月dd日"];
                dateL.text = [formatter stringFromDate:date];
                [self setWeatherImage:imageV];
                temL.text = [NSString stringWithFormat:@"%@°~%@°",model.tempMin,model.tempMax];
                timeL.text = model.fxDateDesc;
                typeL.text = model.textDay;
            }
           
        }
    }
}
-(void)rotationButtonClick{
    _IsDayWeather =! _IsDayWeather;
  _weatherArrCount =  self.IsDayWeather==YES?_weatherArrCount=5:2;
    if (_IsDayWeather==YES) {
        [UIView transitionFromView:_MonthView
                            toView:_DayView
                          duration:1.0
                           options:UIViewAnimationOptionTransitionFlipFromRight
                        completion:^(BOOL finished) {
            self.MonthView.hidden = YES;
        }];

    }else{
        NSLog(@"%ld",(long)self.weatherArrCount);
        [self createMonthBanner];
        self.MonthView.hidden = NO;
        [UIView transitionFromView:_DayView
                            toView:_MonthView
                          duration:1.0
                           options:UIViewAnimationOptionTransitionFlipFromLeft
                        completion:^(BOOL finished) {
        }];
    }
}

- (void)_transView:(UIViewAnimationTransition )trans WithView:(UIView *)view{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2 ];
    [UIView  setAnimationTransition:trans
                            forView:view
                              cache:YES];
    
    
    [UIView commitAnimations];
    
    
}
 
-(UIView*)DayView{
    if (!_DayView) {
        _DayView = [[UIView alloc] init];
        _DayView.frame = CGRectMake(16,0,ScreenWidth-32,CGRectGetHeight(self.frame));
        _DayView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
        _DayView.clipsToBounds = YES;
        _DayView.layer.cornerRadius = 10;
        [self addSubview:_DayView];
    }
    return _DayView;
}
-(UIView*)MonthView{
    if (!_MonthView) {
        _MonthView = [[UIView alloc] init];
        _MonthView.frame = CGRectMake(16,0,ScreenWidth-32,CGRectGetHeight(self.frame));
        _MonthView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
        _MonthView.clipsToBounds = YES;
        _MonthView.hidden = YES;
        _MonthView.layer.cornerRadius = 10;
        [self addSubview:_MonthView];
    }
    return _MonthView;
}
-(UIScrollView*)dayBannerScrollView{
    if (!_dayBannerScrollView) {
        _dayBannerScrollView = [[UIScrollView alloc] init];
        _dayBannerScrollView.frame = CGRectMake(0, CGRectGetMaxY(self.rotationDayButton.frame)+30, scrWidth, self.frame.size.height*0.60294118);
        _dayBannerScrollView.delegate = self;
//        _bannerScrollView.backgroundColor = [UIColor orangeColor];
        _dayBannerScrollView.contentSize = CGSizeMake((self.weatherArrCount+1)*(scrWidth), 0);
        _dayBannerScrollView.showsHorizontalScrollIndicator = NO;
        _dayBannerScrollView.pagingEnabled = YES;
        
    }
    return _dayBannerScrollView;
}
-(UIScrollView*)monthBannerScrollView{
    if (!_monthBannerScrollView) {
        _monthBannerScrollView = [[UIScrollView alloc] init];
        _monthBannerScrollView.frame = CGRectMake(0, CGRectGetMaxY(self.rotationDayButton.frame)+19.5, scrWidth, self.frame.size.height*0.60294118);
        _monthBannerScrollView.delegate = self;
//        _bannerScrollView.backgroundColor = [UIColor orangeColor];
        _monthBannerScrollView.contentSize = CGSizeMake((self.weatherArrCount+1)*(scrWidth), 0);
        _monthBannerScrollView.showsHorizontalScrollIndicator = NO;
        _monthBannerScrollView.pagingEnabled = YES;
        
    }
    return _monthBannerScrollView;
}
-(UIPageControl*)dayBannerpageC{
    if (!_dayBannerpageC) {
        _dayBannerpageC = [[UIPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.dayBannerScrollView.frame), scrWidth, 2)];
        _dayBannerpageC.currentPage = 0;
        _dayBannerpageC.numberOfPages = self.weatherArrCount;
        _dayBannerpageC.pageIndicatorTintColor =colorH(218, 221, 225);
        _dayBannerpageC.currentPageIndicatorTintColor = colorH(98, 191, 180);
     }
    return _dayBannerpageC;
}
-(UIPageControl*)monthBannerpageC{
    if (!_monthBannerpageC) {
        _monthBannerpageC = [[UIPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.monthBannerScrollView.frame), scrWidth, 2)];
        _monthBannerpageC.currentPage = 0;
        _monthBannerpageC.numberOfPages = self.weatherArrCount;
        _monthBannerpageC.pageIndicatorTintColor =colorH(218, 221, 225);
        _monthBannerpageC.currentPageIndicatorTintColor = colorH(98, 191, 180);
     }
    return _monthBannerpageC;
}
 
-(UILabel*)dayTimeL{
    if (!_dayTimeL) {
        
    }
    return _dayTimeL;
}
 
 
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint point = scrollView.contentOffset;
    BOOL isRight = _oldScrollOffset < point.x;
    self.oldScrollOffset = point.x;
    UIPageControl * bannerpageC;
    if (_IsDayWeather==YES) {
        bannerpageC = self.dayBannerpageC;
    }else{
        bannerpageC = self.monthBannerpageC;

    }
    // 调整pageControl的当前 位置
    if (point.x > scrWidth*(self.weatherArrCount-1)+scrWidth*0.5 ){
        bannerpageC.currentPage = 0;
    }else if (point.x > scrWidth*(self.weatherArrCount-1)  && isRight){
        bannerpageC.currentPage = 0;
    }else{
        NSLog(@"%f",(point.x+scrWidth*0.5)/ scrWidth);
        bannerpageC.currentPage = (point.x+scrWidth*0.5)/ scrWidth;
    }
    //处理两种情况，1、当偏移量超出scrollView contentSize最大值时 2、当偏移量小于零时
    if (point.x >= scrWidth*self.weatherArrCount) {
        [scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    }else if (point.x < 0) {
        [scrollView setContentOffset:CGPointMake(point.x+scrWidth*(self.weatherArrCount), 0) animated:NO];
    }
}
 
@end
