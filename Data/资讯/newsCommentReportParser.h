//
//  newsCommentReportParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/18.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol newsCommentReportDelegate;
@interface newsCommentReportParser : BaseDataParser
@property(nonatomic,weak)id myDelegate;
-(void)requestWithId:(NSInteger)myId;
@end
@protocol newsCommentReportDelegate <NSObject>

-(void)successReport:(NSString*)message;
-(void)failedMethod:(NSString*)message;

@end
NS_ASSUME_NONNULL_END
