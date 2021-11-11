//
//  childrenByPidParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@interface childrenByPidParser : BaseDataParser
@property(nonatomic,weak)id myDelegate;
-(void)requestKnowledgeCatList;
-(void)requestNewsCatList;
-(void)requestPolicyCatList;
@end
@protocol KnowledgeCatListParserDelegate <NSObject>
@optional

-(void)successGetKnowledgeCatList:(NSMutableArray*)arr;

@end
@protocol newsCatListParserDelegate <NSObject>
@optional

-(void)successGetNewsCatList:(NSMutableArray*)arr;

@end
@protocol plicyCatListParserDelegate <NSObject>
@optional

-(void)successGetPolicyCatList:(NSMutableArray*)arr;

@end
NS_ASSUME_NONNULL_END
