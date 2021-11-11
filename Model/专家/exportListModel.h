//
//  exportListModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface exportListModel : NSObject
@property(nonatomic,retain)NSString * memberId;
@property(nonatomic,retain)NSString * nickname;
@property(nonatomic,retain)NSString * harlanId;
@property(nonatomic,retain)NSString * proficientIcon;
@property(nonatomic,retain)NSString * proficientLevel;
@property(nonatomic,retain)NSString * cropId;
@property(nonatomic,retain)NSString * cropName;
@property(nonatomic,retain)NSString * proficientBelong;
@property(nonatomic,retain)NSString * proficientInStatus;
@property(nonatomic,retain)NSString * proficientClassStatus;
@property(nonatomic,retain)NSString * proficientOnlineStatus;
@property(nonatomic,retain)NSString * proficientType;
@property(nonatomic,retain)NSString * proficientTypeName;
-(id)initWithData:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
