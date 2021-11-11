//
//  trendListCommentModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface trendListCommentModel : NSObject
@property(nonatomic,retain)NSString * nickname;
@property(nonatomic,retain)NSString * content;
- (id)initWithData:(NSDictionary *)data;
@end

NS_ASSUME_NONNULL_END
