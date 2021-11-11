//
//  likeListModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface likeListModel : NSObject
@property(nonatomic,retain)NSString * memberId;
@property(nonatomic,retain)NSString * avatar;
@property(nonatomic,retain)NSString * nickname;
@property(nonatomic,retain)NSString * followStatus;
@property(nonatomic,retain)NSString * sortTrend;
@property(nonatomic,retain)NSString * sortNum;

- (id)initWithData:(NSDictionary *)data;
@end

NS_ASSUME_NONNULL_END
