//
//  classListModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface classListModel : NSObject
@property(nonatomic,retain)NSString * myId;
@property(nonatomic,retain)NSString * proficientId;
@property(nonatomic,retain)NSString * proficientName;
@property(nonatomic,retain)NSString * harlanId;
@property(nonatomic,retain)NSString * proficientType;
@property(nonatomic,retain)NSString * proficientTypeName;
@property(nonatomic,retain)NSString * title;
@property(nonatomic,retain)NSString * pic;
@property(nonatomic,retain)NSString * remark;
@property(nonatomic,retain)NSString * viewNum;
@property(nonatomic,retain)NSString * curriculumNum;
@property(nonatomic,retain)NSString * mallPrice;
@property(nonatomic,retain)NSString * publishStatus;
-(id)initWithData:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
