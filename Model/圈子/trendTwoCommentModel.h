//
//  trendTwoCommentModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface trendTwoCommentModel : NSObject
@property(nonatomic,retain)NSString * nameStr;
@property(nonatomic,retain)NSString * textStr;
- (id)initWithData:(NSDictionary *)data;
@end

NS_ASSUME_NONNULL_END
