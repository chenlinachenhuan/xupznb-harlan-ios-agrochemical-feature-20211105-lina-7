//
//  knowledgeCommentFabulousParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol knowledgeCommentFabulousParserDelegate;
@interface knowledgeCommentFabulousParser : BaseDataParser
@property(nonatomic,weak)id<knowledgeCommentFabulousParserDelegate>myDelegate;
-(void)requestWithId:(NSInteger)myId;
@end
@protocol knowledgeCommentFabulousParserDelegate <NSObject>
@optional

-(void)successFabulous ;

@end
NS_ASSUME_NONNULL_END
