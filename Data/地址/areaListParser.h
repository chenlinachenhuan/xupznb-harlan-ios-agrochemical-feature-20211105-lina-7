//
//  areaListParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/28.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol areaListParserDelegate ;
@interface areaListParser : BaseDataParser
@property(nonatomic,weak)id<areaListParserDelegate>myDelegate;
-(void)requestareaList:(NSInteger)parentId;
@end
@protocol areaListParserDelegate  <NSObject>
@optional

-(void)successGetareaList:(NSMutableArray*)arr;
@end
NS_ASSUME_NONNULL_END
