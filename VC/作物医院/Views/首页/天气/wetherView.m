//
//  wetherView.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/17.
//

#import "wetherView.h"
#import <QWeather/QWeather.h>
@implementation wetherView

-(id)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.model = [[weatherModel alloc] init];
//         if (self.model!=nil) {
//            [self reloadDataMethod:self.model];
//
//        }
     }
    return self;
}
-(void)reloadDataMethod:(weatherModel*)model{
    self.model = model;
    self.addressL.text = model.address;
    self.wetherTypeL.text = self.model.text;
    self.timeL.text = model.updateTime;
    self.wetherTextL.text = self.model.textDesc;
    self.windL.text = [NSString stringWithFormat:@"%@级",self.model.windScale];
    self.windType.text = self.model.windDir;
    self.UltravioletRaysDataL.text = self.model.uvDescription;
    self.humidityDataL.text = self.model.humidity;
    
    self.wetherDataL.text = self.model.temp;
    if (![_model.warnTitle isEqualToString:@""]) {
        self.warmL.hidden = NO;
        self.warmL.text = _model.warnTitle;
    }
    self.AQILabel.text = [NSString stringWithFormat:@"AQI%@",self.model.aqi];
   
    [self setWeatherImage];
    [self initMethod];

}
-(void)initMethod{
    self.iconStr =[[NSString alloc] init];
    self.addressImageV.image = [UIImage imageNamed:@"定位"];
    self.wetherL.text = @"℃";
    self.windView.backgroundColor = [UIColor whiteColor];
    self.windImageV.image = [UIImage imageNamed:@"风力"];
    self.UltravioletRaysImageV.image = [UIImage imageNamed:@"紫外线"];
    self.humidityImageV.image = [UIImage imageNamed:@"湿度"];
    self.UltravioletRaysL.text = @"紫外线";
    self.humidityL.text = @"相对湿度";
     
}
 
-(void)setWeatherImage{
    NSString * path = [[NSBundle mainBundle]pathForResource:@"天气大icon" ofType:@"bundle"];
    NSString *secondP = [path stringByAppendingPathComponent:self.model.icon];
    [self showAllFileWithPath:secondP];
    
   
}
- (void)showAllFileWithPath:(NSString *) path {
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
                [self showAllFileWithPath:subPath];
            }
        }else{
            NSString *fileName = [[path componentsSeparatedByString:@"/"] lastObject];
            if ([fileName hasSuffix:@".png"]) {
                _iconStr = fileName;
              UIImage*  image = [[UIImage alloc] initWithContentsOfFile:[NSString stringWithFormat:@"%@",path]];
                self.wetherImageV.image =  image  ;
            }else if([fileName hasSuffix:@".mv"]){
//                    [self.imageArray addObject:fileName];
            }
        }
    }else{
        NSLog(@"this path is not exist!");
    }
    
}
-(UILabel*)addressL{
    if (!_addressL) {
        _addressL = [[UILabel alloc] initWithFrame:CGRectMake(16.5, 20, [commonMethod widthAuto:self.model.address fontSize:15 contentheight:20], 20)];
        _addressL.font = [UIFont fontWithName:@"PingFang SC" size:15];
         [self addSubview:_addressL];
    }
    return _addressL;
}
-(UIImageView*)addressImageV{
    if (!_addressImageV) {
        _addressImageV = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.addressL.frame)+7.5,self.addressL.center.y-0.035*ScreenWidth*0.5, 0.035*ScreenWidth, 0.035*ScreenWidth)];
        [self addSubview:_addressImageV];
    }
    return _addressImageV;
}
-(UILabel*)timeL{
    if (!_timeL) {
        _timeL = [[UILabel alloc] initWithFrame:CGRectMake(15.5, CGRectGetMaxY(self.addressL.frame)+10, 200, 8.5)];
        _timeL.textColor = CommonColor;
        _timeL.font = FontSize(9);
        [self addSubview:_timeL];
    }
    return _timeL;
}
-(UILabel*)warmL{
    if (!_warmL) {
        _warmL = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame)-16-60, self.addressL.frame.origin.y, 60, 20)];
        _warmL.font = [UIFont fontWithName:@"PingFang SC" size:10];
        _warmL.textColor = [UIColor whiteColor];
        _warmL.textAlignment = NSTextAlignmentCenter;
        _warmL.backgroundColor = [UIColor colorWithRed:254/255.0 green:187/255.0 blue:58/255.0 alpha:1.0];
        _warmL.clipsToBounds = YES;
        _warmL.layer.cornerRadius = 5;
        _warmL.hidden = YES;
         [self addSubview:_warmL];
    }
    return _warmL;
}
-(UILabel*)AQILabel{
    if (!_AQILabel) {
        CGFloat y=0;
        if (![_model.warnTitle isEqualToString:@""]) {
            y=CGRectGetMaxY(self.warmL.frame)+12.5;

        }else{
            y=self.addressL.frame.origin.y;
         }
        _AQILabel = [[UILabel alloc] initWithFrame:CGRectMake(self.warmL.frame.origin.x, y, CGRectGetWidth(self.warmL.frame), CGRectGetHeight(self.warmL.frame))];
        _AQILabel.font = [UIFont fontWithName:@"PingFang SC" size:10];
        _AQILabel.textColor = [UIColor whiteColor];
        _AQILabel.textAlignment = NSTextAlignmentCenter;
        _AQILabel.backgroundColor = [UIColor colorWithRed:98/255.0 green:191/255.0 blue:180/255.0 alpha:1.0];
        _AQILabel.clipsToBounds = YES;
        _AQILabel.layer.cornerRadius = 5;
//        _AQILabel.hidden = YES;
         [self addSubview:_AQILabel];
        
    }
    return _AQILabel;
}
-(UIImageView*)wetherImageV{
    if (!_wetherImageV) {
        _wetherImageV = [[UIImageView alloc] initWithFrame:CGRectMake(self.center.x-0.224*ScreenWidth*0.9, CGRectGetHeight(self.frame)*0.194127, 0.274062*CGRectGetHeight(self.frame), 0.274062*CGRectGetHeight(self.frame))];
        [self addSubview:_wetherImageV];
    }
    return _wetherImageV;
}
-(UILabel*)wetherDataL{
    if (!_wetherDataL) {
        _wetherDataL = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.wetherImageV.frame)+13.5, self.wetherImageV.frame.origin.y+CGRectGetHeight(self.wetherImageV.frame)*0.232143, [commonMethod widthAuto:_model.temp fontSize:36 contentheight:20], 27)];
        _wetherDataL.font = [UIFont fontWithName:@"PingFang SC" size:36];
         [self addSubview:_wetherDataL];
    }
    return _wetherDataL;;
}
-(UILabel*)wetherL
{
    if (!_wetherL) {
        _wetherL = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.wetherDataL.frame), self.wetherDataL.frame.origin.y, 16, 15.5)];
        _wetherL.font = [UIFont fontWithName:@"PingFang SC" size: 18];
        _wetherL.textColor = [UIColor colorWithRed:162/255.0 green:166/255.0 blue:172/255.0 alpha:1.0];
        [self addSubview:_wetherL];
    }
    return _wetherL;
}
-(UILabel*)wetherTypeL
{
    if (!_wetherTypeL) {
        _wetherTypeL = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.wetherImageV.frame)+15, CGRectGetMaxY(self.wetherDataL.frame)+9.5, [commonMethod widthAuto:_model.text fontSize:12 contentheight:15], 15)];
        _wetherTypeL.font = [UIFont fontWithName:@"PingFang SC" size: 12];
        _wetherTypeL.textColor =  [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
        [self addSubview:_wetherTypeL];
    }
    return _wetherTypeL;
}
-(UILabel*)wetherTextL{
    if (!_wetherTextL) {
        _wetherTextL = [[UILabel alloc] initWithFrame:CGRectMake(75.5, CGRectGetMaxY(self.wetherImageV.frame)+CGRectGetHeight(self.frame)*0.06035889, ScreenWidth-75.5-80.5, MAXFLOAT)];
        _wetherTextL.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
        _wetherTextL.font =[UIFont fontWithName:@"PingFang SC" size: 10];
        _wetherTextL.numberOfLines = 0;
        CGSize size = CGSizeMake(ScreenWidth-75.5-80.5, MAXFLOAT);//设置高度宽度的最大限度

        CGRect rect1 = [_model.textDesc boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont fontWithName:@"PingFang SC" size: 10]} context:nil];
        _wetherTextL.frame = CGRectMake(75.5, CGRectGetMaxY(self.wetherImageV.frame)+18.5, ScreenWidth-75.5-80.5, rect1.size.height);
        [self addSubview:_wetherTextL];
    }
    return _wetherTextL;
}
-(UIView*)windView{
    if (!_windView) {
        _windView = [[UIView alloc] initWithFrame:CGRectMake(16, CGRectGetMaxY(self.wetherTextL.frame)+CGRectGetHeight(self.frame)*0.06525285, ScreenWidth-32, CGRectGetHeight(self.frame)*0.326264)];
         _windView.clipsToBounds = YES;
        _windView.layer.cornerRadius = 10;
        [self addSubview:_windView];
    }
    return _windView;
}
-(UIImageView*)UltravioletRaysImageV{
    if (!_UltravioletRaysImageV) {
        _UltravioletRaysImageV = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.windView.frame)/2-0.34*CGRectGetHeight(self.windView.frame)*0.5, CGRectGetHeight(self.windView.frame)/2-0.34*CGRectGetHeight(self.windView.frame), 0.34*CGRectGetHeight(self.windView.frame), 0.34*CGRectGetHeight(self.windView.frame))];
        [self.windView addSubview:_UltravioletRaysImageV];
    }
    return _UltravioletRaysImageV;
}
-(UIImageView*)windImageV{
    if (!_windImageV) {
        _windImageV = [[UIImageView alloc] initWithFrame:CGRectMake(self.UltravioletRaysImageV.frame.origin.x-77.5-0.34*CGRectGetHeight(self.windView.frame), CGRectGetHeight(self.windView.frame)/2-0.34*CGRectGetHeight(self.windView.frame), 0.34*CGRectGetHeight(self.windView.frame), 0.34*CGRectGetHeight(self.windView.frame))];
        [self.windView addSubview:_windImageV];
    }
    return _windImageV;
}
-(UIImageView*)humidityImageV{
    if (!_humidityImageV) {
        _humidityImageV = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.UltravioletRaysImageV.frame)+77, CGRectGetHeight(self.windView.frame)/2-0.34*CGRectGetHeight(self.windView.frame), 0.34*CGRectGetHeight(self.windView.frame), 0.34*CGRectGetHeight(self.windView.frame))];
        [self.windView addSubview:_humidityImageV];
    }
    return _humidityImageV;
}
-(UILabel*)windL{
    if (!_windL) {
        _windL = [[UILabel alloc] initWithFrame:CGRectMake(self.windImageV.center.x-40, CGRectGetMaxY(self.windImageV.frame)+12, 80, 12)];
        _windL.font = [UIFont fontWithName:@"PingFang SC" size: 12];
        _windL.textAlignment = NSTextAlignmentCenter;
        [self.windView addSubview:_windL];
    }
    return _windL;
}
-(UILabel*)UltravioletRaysDataL{
    if (!_UltravioletRaysDataL) {
        _UltravioletRaysDataL = [[UILabel alloc] initWithFrame:CGRectMake(self.UltravioletRaysImageV.center.x-40, CGRectGetMaxY(self.UltravioletRaysImageV.frame)+12, 80, 12)];
        _UltravioletRaysDataL.font = [UIFont fontWithName:@"PingFang SC" size: 12];
        _UltravioletRaysDataL.textAlignment = NSTextAlignmentCenter;
        [self.windView addSubview:_UltravioletRaysDataL];
    }
    return _UltravioletRaysDataL;
}
-(UILabel*)humidityDataL{
    if (!_humidityDataL) {
        _humidityDataL = [[UILabel alloc] initWithFrame:CGRectMake(self.humidityImageV.center.x-40, CGRectGetMaxY(self.humidityImageV.frame)+12, 80, 12)];
        _humidityDataL.font = [UIFont fontWithName:@"PingFang SC" size: 12];
        _humidityDataL.textAlignment = NSTextAlignmentCenter;
        [self.windView addSubview:_humidityDataL];
    }
    return _humidityDataL;
}
-(UILabel*)windType{
    if (!_windType) {
        _windType = [[UILabel alloc] initWithFrame:CGRectMake(self.windImageV.center.x-40, CGRectGetMaxY(self.windL.frame)+5.5, 80, 12)];
        _windType.font = [UIFont fontWithName:@"PingFang SC" size: 9];
        _windType.textColor = [UIColor colorWithRed:162/255.0 green:166/255.0 blue:172/255.0 alpha:1.0];
        _windType.textAlignment = NSTextAlignmentCenter;
        [self.windView addSubview:_windType];
    }
    return _windType;
}
-(UILabel*)UltravioletRaysL{
    if (!_UltravioletRaysL) {
        _UltravioletRaysL = [[UILabel alloc] initWithFrame:CGRectMake(self.UltravioletRaysDataL.center.x-40, CGRectGetMaxY(self.UltravioletRaysDataL.frame)+5.5, 80, 12)];
        _UltravioletRaysL.font = [UIFont fontWithName:@"PingFang SC" size: 9];
        _UltravioletRaysL.textColor = [UIColor colorWithRed:162/255.0 green:166/255.0 blue:172/255.0 alpha:1.0];
        _UltravioletRaysL.textAlignment = NSTextAlignmentCenter;
        [self.windView addSubview:_UltravioletRaysL];
    }
    return _UltravioletRaysL;
}
-(UILabel*)humidityL{
    if (!_humidityL) {
        _humidityL = [[UILabel alloc] initWithFrame:CGRectMake(self.humidityDataL.center.x-40, CGRectGetMaxY(self.humidityDataL.frame)+5.5, 80, 12)];
        _humidityL.font = [UIFont fontWithName:@"PingFang SC" size: 9];
        _humidityL.textAlignment = NSTextAlignmentCenter;
        _humidityL.textColor = [UIColor colorWithRed:162/255.0 green:166/255.0 blue:172/255.0 alpha:1.0];
        [self.windView addSubview:_humidityL];
    }
    return _humidityL;
}
 
@end
