//
//  richDetailParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/9.
//

#import "BaseDataParser.h"
#import "newsDetailTextModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol richDetailParserDelegate;
@interface richDetailParser : BaseDataParser
@property(nonatomic,weak)id<richDetailParserDelegate>myDelegate;
-(void)requestRich:(NSInteger)myId;
@end
@protocol richDetailParserDelegate <NSObject>
@optional

-(void)successWithRichDetail:(newsDetailTextModel*)model;
@end
NS_ASSUME_NONNULL_END
