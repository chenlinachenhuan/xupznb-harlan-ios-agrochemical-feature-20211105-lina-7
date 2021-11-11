//
//  newsCommentRemoveParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/18.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol newsCommentRemoveDelegate;
@interface newsCommentRemoveParser : BaseDataParser
@property(nonatomic,weak)id<newsCommentRemoveDelegate>myDelegate;
-(void)requestWithId:(NSInteger)myId;
@end
@protocol newsCommentRemoveDelegate <NSObject>

-(void)successDelete:(NSInteger)code;
-(void)failedMethod:(NSString*)message;

@end
NS_ASSUME_NONNULL_END
