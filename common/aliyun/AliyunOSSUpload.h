//
//  AliyunOSSUpload.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/25.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define AliyunUpload                [AliyunOSSUpload aliyunInit]
NS_ASSUME_NONNULL_BEGIN

@interface AliyunOSSUpload : NSObject
+ (AliyunOSSUpload *)aliyunInit;

/*
imgArr 图片数组
imagesObject 图片名称（需要和后台商量图片名称的格式）
*/
- (void)uploadImage:(NSArray <UIImage *>*)imgArray success:(void (^)(NSArray <NSString *> * nameArray))success;
- (void)uploadVideo:(NSData*)videoData success:(void (^)(NSArray <NSString *> * nameArray))success ;
@end

NS_ASSUME_NONNULL_END
