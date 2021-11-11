//
//  subClassDetailModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface subClassDetailModel : NSObject
@property(nonatomic,retain)NSString *fileUrl;
@property(nonatomic,retain)NSString *title;
@property(nonatomic,retain)NSString *myId;
@property(nonatomic,retain)NSString *curriculumId;
@property(nonatomic,retain)NSString *fileType;
@property(nonatomic,retain)NSString *fileId;
@property(nonatomic,retain)NSString *viewStatus;
@property(nonatomic,retain)NSString *viewNum;
@property(nonatomic,retain)NSString *sort;
@property(nonatomic,retain)NSString *pubTime;
@property(nonatomic,retain)NSString *playStatus;
@property(nonatomic,retain)NSString *updateTime;
@property(nonatomic,retain)NSString *appId;
@property(nonatomic,retain)NSString *psign;
- (id)initWithData:(NSDictionary *)data;
@end

NS_ASSUME_NONNULL_END
