//
//  knowledgeCreateCommentParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol knowledgeCreateCommentParserDelegate;
@interface knowledgeCreateCommentParser : BaseDataParser
@property(nonatomic,weak)id<knowledgeCreateCommentParserDelegate>myDelegate;
-(void)requestWithcontent:(NSString*)content newsId:(NSInteger)newsId parentId:(NSInteger)parentId;
@end
@protocol knowledgeCreateCommentParserDelegate <NSObject>
@optional

-(void)successCreateComment;

@end
NS_ASSUME_NONNULL_END
