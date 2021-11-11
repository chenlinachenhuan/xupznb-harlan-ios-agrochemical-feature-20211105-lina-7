//
//  subClassDetailParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/10.
//

#import "BaseDataParser.h"
#import "subClassDetailModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol subClassDetailParserDelegate;
@interface subClassDetailParser : BaseDataParser
@property(nonatomic,weak)id myDelegate;
-(void)requestSubClassDetail:(NSInteger)myId;
@end
@protocol subClassDetailParserDelegate <NSObject>

-(void)successGetSubClassDetail:(subClassDetailModel*)model;

@end
NS_ASSUME_NONNULL_END
