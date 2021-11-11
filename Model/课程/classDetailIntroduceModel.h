//
//  classDetailIntroduceModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/28.
//

#import <Foundation/Foundation.h>
#import "classCommentModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface classDetailIntroduceModel : NSObject
@property(nonatomic,retain)NSString * myId;
@property(nonatomic,retain)NSString * proficientId;
@property(nonatomic,retain)NSString * cropId;
@property(nonatomic,retain)NSString * crop2Id;
@property(nonatomic,retain)NSString * catId;
@property(nonatomic,retain)NSString * cat2Id;
@property(nonatomic,retain)NSString * title;
@property(nonatomic,retain)NSString * suitable;
@property(nonatomic,retain)NSString * tag;
@property(nonatomic,retain)NSString * remark;
@property(nonatomic,retain)NSString * pic;
@property(nonatomic,retain)NSString * marketPrice;
@property(nonatomic,retain)NSString * mallPrice;
@property(nonatomic,retain)NSString * saleNum;
@property(nonatomic,retain)NSString * viewNum;
@property(nonatomic,retain)NSString * curriculumNum;
@property(nonatomic,retain)NSString * score;
@property(nonatomic,retain)NSString * shareNum;

@property(nonatomic,retain)NSString * commentNum;
@property(nonatomic,retain)NSString * publishStatus;
@property(nonatomic,retain)NSString * pubTime;
@property(nonatomic,retain)NSString * updateTime;
@property(nonatomic,retain)NSString * proficientName;
@property(nonatomic,retain)NSString * proficientIcon;
@property(nonatomic,retain)NSString * proficientContent;
@property(nonatomic,retain)NSString * harlanId;
@property(nonatomic,retain)NSString * proficientBelong;
@property(nonatomic,retain)NSString * proficientOnlineStatus;
@property(nonatomic,retain)NSString * fabulousStatus;
@property(nonatomic,retain)NSString * payStatus;
@property(nonatomic,retain)NSString * isSelf;

- (id)initWithData:(NSDictionary *)data;
@end

NS_ASSUME_NONNULL_END
