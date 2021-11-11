//
//  weatherMonthModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface weatherMonthModel : NSObject
@property(nonatomic,retain)NSString * fxDate;
@property(nonatomic,retain)NSString * tempMax;
@property(nonatomic,retain)NSString * fxDateDesc;
@property(nonatomic,retain)NSString * tempMin;
@property(nonatomic,retain)NSString * iconDay;
@property(nonatomic,retain)NSString * textDay;
-(id)initWithData:(NSDictionary*)dic;

@end

NS_ASSUME_NONNULL_END
