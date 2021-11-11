//
//  knowledgeCommentReportParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol knowledgeCommentReportParserDelegate;
@interface knowledgeCommentReportParser : BaseDataParser
@property(nonatomic,weak)id<knowledgeCommentReportParserDelegate>myDelegate;
-(void)requestWithId:(NSInteger)myId;
@end
@protocol knowledgeCommentReportParserDelegate <NSObject>
@optional

-(void)successReport;

@end
NS_ASSUME_NONNULL_END
