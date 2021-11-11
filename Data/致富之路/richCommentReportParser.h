//
//  richCommentReportParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/9.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol richCommentReportParserDelegate;
@interface richCommentReportParser : BaseDataParser
@property(nonatomic,weak)id<richCommentReportParserDelegate>myDelegate;
-(void)requestWithId:(NSInteger)myId;
@end
@protocol richCommentReportParserDelegate <NSObject>
@optional

-(void)successReport;

@end
NS_ASSUME_NONNULL_END
