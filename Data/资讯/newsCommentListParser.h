//
//  newsCommentListParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/18.
//

#import "BaseDataParser.h"
#import "newsCommentListTextModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol newsCommentListDelegate;
@interface newsCommentListParser : BaseDataParser
@property(nonatomic,weak)id<newsCommentListDelegate>myDelegate;
-(void)requestWithMyId:(UInt64)myId withOrderStatus:(UInt32)orderStatus withPageNum:(UInt32)pageNum pageSize:(UInt32)pageSize parentId:(UInt64)parentId pubTimeStatus:(UInt32)pubTimeStatus showStatus:(UInt32)showStatus;
@end
@protocol newsCommentListDelegate <NSObject>

-(void)successFornewsCommentList:(NSMutableArray<newsCommentListTextModel*>*)dataArr total:(NSInteger)total;
-(void)failedMethod:(NSString*)message;
@end
NS_ASSUME_NONNULL_END
