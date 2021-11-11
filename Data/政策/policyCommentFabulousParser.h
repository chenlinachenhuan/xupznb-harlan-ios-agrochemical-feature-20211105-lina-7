//
//  policyCommentFabulousParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol policyCommentFabulousParserDelegate;
@interface policyCommentFabulousParser : BaseDataParser
@property(nonatomic,weak)id<policyCommentFabulousParserDelegate>myDelegate;
-(void)requestWithId:(NSInteger)myId;
@end
@protocol policyCommentFabulousParserDelegate <NSObject>

-(void)successFabulous ;

@end
NS_ASSUME_NONNULL_END
