//
//  carListParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/2.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol carListParserDelegate ;
@interface carListParser : BaseDataParser
@property(nonatomic,weak)id<carListParserDelegate>myDelegate;
-(void)requestList:(NSInteger)pageNum pageSize:(NSInteger)pageSize;
@end
@protocol carListParserDelegate <NSObject>

-(void)successGetCarList:(NSMutableArray*)arr ;

@end
NS_ASSUME_NONNULL_END
