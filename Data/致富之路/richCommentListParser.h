//
//  richCommentListParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/9.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol richCommentListParserDelegate;
@interface richCommentListParser : BaseDataParser
@property(nonatomic,weak)id<richCommentListParserDelegate>myDelegate;
-(void)requestRichComment:(UInt64)myId withOrderStatus:(UInt32)orderStatus withPageNum:(UInt32)pageNum pageSize:(UInt32)pageSize parentId:(UInt64)parentId pubTimeStatus:(UInt32)pubTimeStatus showStatus:(UInt32)showStatus;
@end
@protocol richCommentListParserDelegate <NSObject>
@optional

-(void)successGetCommentList:(NSMutableArray *)arr total:(NSInteger)total;

@end
NS_ASSUME_NONNULL_END
