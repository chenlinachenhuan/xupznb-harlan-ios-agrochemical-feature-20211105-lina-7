//
//  addressTextModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface addressTextModel : NSObject
@property(nonatomic,retain)NSString*name;
@property(nonatomic,retain)NSString*phone;
@property(nonatomic,retain)NSString*address;
@property(nonatomic,retain)NSString*defaultStatus;
@property(nonatomic,retain)NSString*province;
@property(nonatomic,retain)NSString*provinceId;

@property(nonatomic,retain)NSString*city;
@property(nonatomic,retain)NSString*cityId;

@property(nonatomic,retain)NSString*region;
@property(nonatomic,retain)NSString*regionId;

@property(nonatomic,retain)NSString*myId;

-(id)initWithData:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
