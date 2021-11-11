//
//  newsCommentCreateParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/18.
//

#import "BaseDataParser.h"
#import "newsCommentListTextModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol newsCommentCreateDelegate;
@interface newsCommentCreateParser : BaseDataParser
@property(nonatomic,weak)id<newsCommentCreateDelegate>myDelegate;
-(void)requestWithcontent:(NSString*)content newsId:(NSInteger)newsId parentId:(NSInteger)parentId;
@end
@protocol newsCommentCreateDelegate <NSObject>

-(void)successCreateComment:(NSInteger)code;
-(void)failedMethod:(NSString*)message;

@end
NS_ASSUME_NONNULL_END
