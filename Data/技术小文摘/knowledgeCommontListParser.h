//
//  knowledgeCommontListParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol knowledgeCommontListParserDelegate;
@interface knowledgeCommontListParser : BaseDataParser
@property(nonatomic,weak)id<knowledgeCommontListParserDelegate>myDelegate;
-(void)requestKnowledgeComment:(UInt64)myId withOrderStatus:(UInt32)orderStatus withPageNum:(UInt32)pageNum pageSize:(UInt32)pageSize parentId:(UInt64)parentId pubTimeStatus:(UInt32)pubTimeStatus showStatus:(UInt32)showStatus;
@end
@protocol knowledgeCommontListParserDelegate <NSObject>
@optional

-(void)successGetCommentList:(NSMutableArray*)arr total:(NSInteger)total;

@end
NS_ASSUME_NONNULL_END
