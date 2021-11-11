//
//  trendCommentModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/30.
//

#import <Foundation/Foundation.h>
#import "trendTwoCommentModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface trendCommentModel : NSObject
@property(nonatomic,retain)NSString * avatar;
@property(nonatomic,retain)NSString * nameStr;
@property(nonatomic,retain)NSString * timeStr;
@property(nonatomic,retain)NSString * textStr;
@property(nonatomic,retain)NSString * myId;
@property(nonatomic,retain)NSString * parentId;

@property(nonatomic,retain)NSMutableArray * commentArr;

- (id)initWithData:(NSDictionary *)data;
@end

NS_ASSUME_NONNULL_END
