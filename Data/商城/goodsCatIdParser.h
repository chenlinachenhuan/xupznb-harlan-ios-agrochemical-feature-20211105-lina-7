//
//  goodsCatIdParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/1.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol goodsCatIdParserDelegate;
@interface goodsCatIdParser : BaseDataParser
@property(nonatomic,weak)id<goodsCatIdParserDelegate>myDelegate;
-(void)requestWithParentId;
@end
@protocol goodsCatIdParserDelegate <NSObject>

-(void)successGetCatParentList:(NSMutableArray*)parentArr ;

@end
NS_ASSUME_NONNULL_END
