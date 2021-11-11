//
//  richCommentCancelFabulousParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/9.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol richCommentCancelFabulousParserDelegate;
@interface richCommentCancelFabulousParser : BaseDataParser
@property(nonatomic,weak)id<richCommentCancelFabulousParserDelegate>myDelegate;
-(void)requestWithId:(NSInteger)myId;
@end
@protocol richCommentCancelFabulousParserDelegate <NSObject>
@optional

-(void)successCancelFabulous ;
 
@end
NS_ASSUME_NONNULL_END
