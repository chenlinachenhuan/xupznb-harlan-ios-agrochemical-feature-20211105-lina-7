//
//  newsDetailTextParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/18.
//

#import "BaseDataParser.h"
#import "newsDetailTextModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol newsDetailProtocolDelegate;
@interface newsDetailTextParser : BaseDataParser
@property(nonatomic,weak)id<newsDetailProtocolDelegate> myDelegate;
-(void)requestWithMyId:(NSInteger)myId;
@end
@protocol newsDetailProtocolDelegate <NSObject>

-(void)successWithNewsDetail:(newsDetailTextModel*)model;
-(void)failedMethod:(NSString*)message;
@end
NS_ASSUME_NONNULL_END
