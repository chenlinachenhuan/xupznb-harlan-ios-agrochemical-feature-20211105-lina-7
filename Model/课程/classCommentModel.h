//
//  classCommentModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface classCommentModel : NSObject
@property(nonatomic,retain)UIImage * headImage;
@property(nonatomic,retain)NSString * nameStr;
@property(nonatomic,retain)NSString * dateStr;
@property(nonatomic,retain)NSString * scoreStr;
@property(nonatomic,retain)NSString * textStr;
- (id)initWithData:(NSDictionary *)data;
@end

NS_ASSUME_NONNULL_END
