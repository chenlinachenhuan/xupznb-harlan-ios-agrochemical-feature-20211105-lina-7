//
//  knowledgeCommentCancelFabulousParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol knowledgeCommentCancelFabulousParserDelegate;
@interface knowledgeCommentCancelFabulousParser : BaseDataParser
@property(nonatomic,weak)id<knowledgeCommentCancelFabulousParserDelegate>myDelegate;
-(void)requestWithId:(NSInteger)myId;
@end
@protocol knowledgeCommentCancelFabulousParserDelegate <NSObject>
@optional

-(void)successCancelFabulous ;
 
@end
NS_ASSUME_NONNULL_END
