//
//  newsCommentFabulousParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/18.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol newsCommentFabulousDelegate;
@interface newsCommentFabulousParser : BaseDataParser
@property(nonatomic,weak)id<newsCommentFabulousDelegate>myDelegate;
-(void)requestWithId:(NSInteger)myId;
@end
@protocol newsCommentFabulousDelegate <NSObject>

-(void)successFabulous:(NSInteger)code;
-(void)failedMethod:(NSString*)message;

@end
NS_ASSUME_NONNULL_END
