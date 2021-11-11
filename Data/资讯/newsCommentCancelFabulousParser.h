//
//  newsCommentCancelFabulousParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/18.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol newsCommentCancelFabulousDelegate;
@interface newsCommentCancelFabulousParser : BaseDataParser
@property(nonatomic,weak)id<newsCommentCancelFabulousDelegate>myDelegate;
-(void)requestWithId:(NSInteger)myId;
@end
@protocol newsCommentCancelFabulousDelegate <NSObject>

-(void)successCancelFabulous:(NSInteger)code;
-(void)failedMethod:(NSString*)message;

@end
NS_ASSUME_NONNULL_END
