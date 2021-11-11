//
//  wetherView.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/17.
//

#import <UIKit/UIKit.h>
#import "weatherModel.h"
#import <CoreLocation/CoreLocation.h>
#import "weatherParser.h"
NS_ASSUME_NONNULL_BEGIN

@interface wetherView : UIView<CLLocationManagerDelegate,weatherParserDelegate>
@property (nonatomic, strong) CLLocationManager* locationManager;
@property (nonatomic, strong) CLLocation*currentLocation;
@property(nonatomic,retain)UILabel * addressL;
@property(nonatomic,retain)UIImageView * addressImageV;

@property(nonatomic,retain)UILabel * dateL;
@property(nonatomic,retain)UILabel * warmL;
@property(nonatomic,retain)UILabel * AQILabel;
@property(nonatomic,retain)UIImageView * wetherImageV;
@property(nonatomic,retain)UILabel * wetherDataL;
@property(nonatomic,retain)UILabel * wetherL;
@property(nonatomic,retain)UILabel * wetherTypeL;
@property(nonatomic,retain)UILabel * wetherTextL;
@property(nonatomic,retain)UIView * windView;
@property(nonatomic,retain)UIImageView * windImageV;
@property(nonatomic,retain)UIImageView * UltravioletRaysImageV;
@property(nonatomic,retain)UIImageView * humidityImageV;
@property(nonatomic,retain)UILabel * windL;
@property(nonatomic,retain)UILabel * UltravioletRaysL;
@property(nonatomic,retain)UILabel * humidityL;
@property(nonatomic,retain)UILabel * windType;
@property(nonatomic,retain)UILabel * UltravioletRaysDataL;
@property(nonatomic,retain)UILabel * humidityDataL;
@property(nonatomic,retain)NSString * iconStr;
@property(nonatomic,retain)UILabel *timeL;
@property(nonatomic,retain)weatherModel * model;
-(void)reloadDataMethod:(weatherModel*)model;
@end

NS_ASSUME_NONNULL_END
