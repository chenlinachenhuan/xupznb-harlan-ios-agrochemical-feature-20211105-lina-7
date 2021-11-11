//
//  policyCommentCancelFabulousParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol policyCommentCancelFabulousParserDelegate;
@interface policyCommentCancelFabulousParser : BaseDataParser
@property(nonatomic,weak)id<policyCommentCancelFabulousParserDelegate>myDelegate;
-(void)requestWithId:(NSInteger)myId;
@end
@protocol policyCommentCancelFabulousParserDelegate <NSObject>

-(void)successCancelFabulous ;
 
@end
NS_ASSUME_NONNULL_END
