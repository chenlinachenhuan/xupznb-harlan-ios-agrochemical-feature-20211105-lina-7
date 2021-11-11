//
//  policyCreateCommentParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol policyCreateCommentParserDelegate;
@interface policyCreateCommentParser : BaseDataParser
 
@property(nonatomic,weak)id<policyCreateCommentParserDelegate>myDelegate;
-(void)requestWithcontent:(NSString*)content newsId:(NSInteger)newsId parentId:(NSInteger)parentId;
@end
@protocol policyCreateCommentParserDelegate <NSObject>

-(void)successCreateComment;

@end
NS_ASSUME_NONNULL_END
