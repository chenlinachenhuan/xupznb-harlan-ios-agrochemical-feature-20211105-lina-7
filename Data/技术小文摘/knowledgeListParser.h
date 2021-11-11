//
//  knowledgeListParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol knowledgeListParserDelegate;
@interface knowledgeListParser : BaseDataParser
@property(nonatomic,weak)id<knowledgeListParserDelegate>myDelegate;
-(void)requestWithCat2Id:(UInt64)cat2Id withCatId:(UInt64)catId withKeyWord:(NSString*)keyWord withPageNum:(UInt32)pageNum withPageSize:(UInt32)pageSize withShowStatus:(UInt32)showStatus withCropId:(UInt64)cropId;
@end
@protocol knowledgeListParserDelegate <NSObject>
@optional

-(void)successGetList:(NSMutableArray *)arr total:(NSInteger)total;

@end
NS_ASSUME_NONNULL_END
