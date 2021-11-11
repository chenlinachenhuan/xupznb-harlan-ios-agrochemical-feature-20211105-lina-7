//
//  ALiyunOssParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/26.
//

#import "BaseDataParser.h"
#import "ossModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol ALiyunOssParserDelegate;
@interface ALiyunOssParser : BaseDataParser
@property(nonatomic,weak)id<ALiyunOssParserDelegate>myDelegate;
-(void)requestOSS;
@end
@protocol ALiyunOssParserDelegate <NSObject>

-(void)successOss:(ossModel*)model;
-(void)failedMethod:(NSString*)message;
@end
NS_ASSUME_NONNULL_END
