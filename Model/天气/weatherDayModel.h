//
//  weatherDayModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface weatherDayModel : NSObject
@property(nonatomic,retain)NSString * fxTime;
@property(nonatomic,retain)NSString * temp;
@property(nonatomic,retain)NSString * icon;
-(id)initWithData:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
