//
//  subClassParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/10.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol subClassParserDelegate;
@interface subClassParser : BaseDataParser
@property(nonatomic,weak)id myDelegate;
-(void)requestSubClassList:(NSInteger)curriculumId pageNum:(NSInteger)pageNum pageSize:(NSInteger)pageSize viewStatus:(NSInteger)viewStatus;
@end
@protocol subClassParserDelegate <NSObject>

-(void)successGetSubCLassList:(NSMutableArray*)arr total:(NSInteger)total;

@end
NS_ASSUME_NONNULL_END
