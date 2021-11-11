//
//  policyCommentReportParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol policyCommentReportParserDelegate;
@interface policyCommentReportParser : BaseDataParser
@property(nonatomic,weak)id myDelegate;
-(void)requestWithId:(NSInteger)myId;
@end
@protocol policyCommentReportParserDelegate <NSObject>

-(void)successReport;

@end
NS_ASSUME_NONNULL_END
