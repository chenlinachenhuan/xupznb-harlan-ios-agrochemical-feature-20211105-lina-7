//
//  newsCommentListTextModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface newsCommentListTextModel : NSObject
@property(nonatomic,retain)NSString * content;
@property(nonatomic,retain)NSString * fabulousNum;
@property(nonatomic,retain)NSString * nickname;
@property(nonatomic,retain)NSString * pubTimeOffsetDesc;
@property(nonatomic,assign)NSInteger   myId;
@property(nonatomic,assign)NSInteger fabulousStatus;
- (id)initWithData:(NSDictionary *)data;
 
@end

NS_ASSUME_NONNULL_END
