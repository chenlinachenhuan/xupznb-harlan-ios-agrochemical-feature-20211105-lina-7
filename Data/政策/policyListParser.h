//
//  policyListParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/5.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol policyListParserDelegate;
@interface policyListParser : BaseDataParser
@property(nonatomic,weak)id<policyListParserDelegate>myDelegate;
-(void)requestPolicyList:(NSInteger)areaId cat2Id:(NSInteger)cat2Id catId:(NSInteger)catId cityId:(NSInteger)cityId cropId:(NSInteger)cropId expireStatus:(NSInteger)expireStatus keyword:(NSString*)keyword pageNum:(NSInteger)pageNum pageSize:(NSInteger)pageSize provinceId:(NSInteger)provinceId showStatus:(NSInteger)showStatus;
@end
@protocol policyListParserDelegate <NSObject>

-(void)successGetPolicyList:(NSMutableArray*)arr;

@end
NS_ASSUME_NONNULL_END
