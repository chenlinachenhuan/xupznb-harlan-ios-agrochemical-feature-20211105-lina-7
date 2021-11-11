//
//  richListParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/9.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol richListParserDelegate;
@interface richListParser : BaseDataParser
@property(nonatomic,weak)id<richListParserDelegate>myDelegate;
-(void)requestWithCat2Id:(UInt64)cat2Id withCatId:(UInt64)catId withKeyWord:(NSString*)keyWord withPageNum:(UInt32)pageNum withPageSize:(UInt32)pageSize withShowStatus:(UInt32)showStatus  ;
@end
@protocol richListParserDelegate <NSObject>
@optional

-(void)successGetRichList:(NSMutableArray *)arr total:(NSInteger)total;

@end
NS_ASSUME_NONNULL_END
