//
//  classListParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/10.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol classListParserDelegate;
@interface classListParser : BaseDataParser
@property(nonatomic,weak)id myDelegate;
-(void)requestClaaList:(NSInteger)cat2Id catId:(NSInteger)catId crop2Id:(NSInteger)crop2Id cropId:(NSInteger)cropId keyword:(NSString*)keyword orderBy:(NSString*)orderBy pageNum:(NSInteger)pageNum  pageSize:(NSInteger)pageSize proficientId:(NSInteger)proficientId  publishStatus:(NSInteger)publishStatus; 
@end
@protocol classListParserDelegate <NSObject>
@optional
-(void)successGetClassList:(NSMutableArray*)arr total:(NSInteger)total;

@end
NS_ASSUME_NONNULL_END
