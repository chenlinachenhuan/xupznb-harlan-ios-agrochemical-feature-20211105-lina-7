//
//  newsParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/15.
//

#import "BaseDataParser.h"
#import "NewsTextMedel.h"
#import "newsViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface newsParser : BaseDataParser
typedef void (^FinishBlock)(NSMutableArray *dataArr);
@property(nonatomic,weak)id<newsProtocolDelegate> newsProtocol;
-(instancetype)initWithViewProtocol:(id)delegate;
-(void)requestWithCat2Id:(UInt64)cat2Id withCatId:(UInt64)catId withKeyWord:(NSString*)keyWord withPageNum:(UInt32)pageNum withPageSize:(UInt32)pageSize withShowStatus:(UInt32)showStatus ;
@end

NS_ASSUME_NONNULL_END
