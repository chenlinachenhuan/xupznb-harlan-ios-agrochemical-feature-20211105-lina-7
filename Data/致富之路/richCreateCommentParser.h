//
//  richCreateCommentParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/9.
//

#import "BaseDataParser.h"

NS_ASSUME_NONNULL_BEGIN
@protocol richCreateCommentParserDelegate;
@interface richCreateCommentParser : BaseDataParser
@property(nonatomic,weak)id<richCreateCommentParserDelegate>myDelegate;
-(void)requestWithcontent:(NSString*)content newsId:(NSInteger)newsId parentId:(NSInteger)parentId;
@end
@protocol richCreateCommentParserDelegate <NSObject>
@optional

-(void)successCreateComment;

@end
NS_ASSUME_NONNULL_END
