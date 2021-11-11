//
//  weatherModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/17.
//

#import <Foundation/Foundation.h>
#import "weatherDayModel.h"
#import "weatherMonthModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface weatherModel : NSObject
@property(nonatomic,retain)NSString *warnTitle;
@property(nonatomic,retain)NSString * text;
@property(nonatomic,retain)NSString * textDesc;
@property(nonatomic,retain)NSString * icon;
@property(nonatomic,retain)NSString * windScale;
@property(nonatomic,retain)NSString * windDir;
@property(nonatomic,retain)NSString * uvDescription;
@property(nonatomic,retain)NSString * humidity;
@property(nonatomic,retain)NSString * aqi;
@property(nonatomic,retain)NSString * temp;
@property(nonatomic,retain)NSString * address;
@property(nonatomic,retain)NSString * updateTime;

@property(nonatomic,retain)NSMutableArray * dayListArr;
@property(nonatomic,retain)NSMutableArray * hourListArr;

-(id)initWithData:(NSDictionary*)dic;
 
@end

NS_ASSUME_NONNULL_END
