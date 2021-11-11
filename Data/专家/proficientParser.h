//
//  proficientParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/10.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol proficientParserDelegate;
@interface proficientParser : BaseDataParser
@property(nonatomic,weak)id myDelegate;
-(void)requestProficientList:(NSInteger)cropId pageNum:(NSInteger)pageNum pageSize:(NSInteger)pageSize proficientBelong:(NSInteger)proficientBelong proficientClassStatus:(NSInteger)proficientClassStatus proficientInStatus:(NSInteger)proficientInStatus proficientOnlineStatus:(NSInteger)proficientOnlineStatus proficientType:(NSInteger)proficientType;
@end
@protocol proficientParserDelegate <NSObject>
@optional
-(void)successGetProficientList:(NSMutableArray*)arr total:(NSInteger)total;

@end
NS_ASSUME_NONNULL_END
