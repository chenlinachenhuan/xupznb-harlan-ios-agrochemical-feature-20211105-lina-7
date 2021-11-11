//
//  richCommentFabulousParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/9.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol richCommentFabulousParserDelegate;
@interface richCommentFabulousParser : BaseDataParser
@property(nonatomic,weak)id<richCommentFabulousParserDelegate>myDelegate;
-(void)requestWithId:(NSInteger)myId;
@end
@protocol richCommentFabulousParserDelegate <NSObject>
@optional

-(void)successFabulous ;

@end
NS_ASSUME_NONNULL_END
