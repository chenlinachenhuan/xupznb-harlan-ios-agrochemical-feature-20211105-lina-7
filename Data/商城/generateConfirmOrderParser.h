//
//  generateConfirmOrderParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/4.
//

#import "BaseDataParser.h"
#import "orderTextModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol generateConfirmOrderParserDelegate;
@interface generateConfirmOrderParser : BaseDataParser
@property(nonatomic,weak)id<generateConfirmOrderParserDelegate>myDelegate;
-(void)requestOrderParser:(NSMutableArray*)arr;
@end
@protocol generateConfirmOrderParserDelegate <NSObject>

-(void)successGenerateOrder:(orderTextModel*)model;

@end
NS_ASSUME_NONNULL_END
