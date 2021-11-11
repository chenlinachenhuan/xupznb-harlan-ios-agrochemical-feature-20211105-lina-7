//
//  BaseDataParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@protocol CVBaseDataParser;
typedef void (^BaseFinishBlock)(NSDictionary *dataDic);
@interface BaseDataParser : NSObject
@property (nonatomic, weak)id delegate;
@property (strong, nonatomic) BaseFinishBlock finishBlock;
-(void)PostRequestDataWithControlParam:(NSDictionary *)param url:(NSString *)url BaseFinishBlock:(BaseFinishBlock)block;
-(void)GetRequestDataWithControlParam:(NSDictionary *)param url:(NSString *)url BaseFinishBlock:(BaseFinishBlock)block;
-(void)PostRequestDataWithControArrlParam:(NSArray *)param url:(NSString *)url BaseFinishBlock:(BaseFinishBlock)block;
@end
@protocol CVBaseDataParser <NSObject>
 -(void)parser:(BaseDataParser*)parser didReceieData:(NSDictionary *)data userInfo:(NSString *)userInfo;
- (void)parser:(BaseDataParser *)parser failedErr:(NSError *)err userInfo:(NSString *)userInfo;
@end
NS_ASSUME_NONNULL_END
