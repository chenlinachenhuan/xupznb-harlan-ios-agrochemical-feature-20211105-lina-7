//
//  knowledgeDetailParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import "BaseDataParser.h"
#import "policyDetailModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol knowledgeDetailParserDelegate;
@interface knowledgeDetailParser : BaseDataParser
@property(nonatomic,weak)id<knowledgeDetailParserDelegate>myDelegate;
-(void)requestKnowledge:(NSInteger)myId;
@end
@protocol knowledgeDetailParserDelegate <NSObject>
@optional

-(void)successWithKnowledgeDetail:(policyDetailModel*)model;
@end
NS_ASSUME_NONNULL_END
