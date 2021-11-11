//
//  policyCommentListParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol policyCommentListParserDelegate;
@interface policyCommentListParser : BaseDataParser
@property(nonatomic,weak)id<policyCommentListParserDelegate>myDelegate;
-(void)requestPolicyComment:(UInt64)myId withOrderStatus:(UInt32)orderStatus withPageNum:(UInt32)pageNum pageSize:(UInt32)pageSize parentId:(UInt64)parentId pubTimeStatus:(UInt32)pubTimeStatus showStatus:(UInt32)showStatus;
@end
@protocol policyCommentListParserDelegate <NSObject>

-(void)successGetCommentList:(NSMutableArray*)arr;

@end
NS_ASSUME_NONNULL_END
