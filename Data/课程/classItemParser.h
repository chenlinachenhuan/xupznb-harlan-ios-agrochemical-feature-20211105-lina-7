//
//  classItemParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/10.
//

#import "BaseDataParser.h"
#import "classDetailIntroduceModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol classItemParserDelegate;
@interface classItemParser : BaseDataParser
@property(nonatomic,weak)id myDelegate;
-(void)requestItem:(NSInteger)myId;
@end
@protocol classItemParserDelegate <NSObject>

@optional
-(void)successGetItem:(classDetailIntroduceModel*)model;

@end
NS_ASSUME_NONNULL_END
