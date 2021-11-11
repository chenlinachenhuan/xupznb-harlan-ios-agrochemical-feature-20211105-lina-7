//
//  policyDetailParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import "BaseDataParser.h"
#import "policyDetailModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol policyDetailParserDelegate;
@interface policyDetailParser : BaseDataParser
@property(nonatomic,weak)id<policyDetailParserDelegate>myDelegate;
-(void)requestPolicy:(NSInteger)myId;
@end
@protocol policyDetailParserDelegate <NSObject>

-(void)successWithpolicyDetail:(policyDetailModel*)model;
@end
NS_ASSUME_NONNULL_END
