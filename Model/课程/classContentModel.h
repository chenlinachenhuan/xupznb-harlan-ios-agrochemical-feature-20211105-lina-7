//
//  classContentModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface classContentModel : NSObject
@property(nonatomic,retain)NSString * myId;
@property(nonatomic,retain)NSString * title;
@property(nonatomic,retain)NSString * playStatus;
@property(nonatomic,retain)NSString * curriculumId;
@property(nonatomic,retain)NSString * fileType;
@property(nonatomic,retain)NSString * studyStatus;
@property(nonatomic,retain)NSString * viewStatus;

- (id)initWithData:(NSDictionary *)data;
@end

NS_ASSUME_NONNULL_END
