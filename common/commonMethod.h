//
//  commonMethod.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/8.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreMedia/CoreMedia.h>
NS_ASSUME_NONNULL_BEGIN

@interface commonMethod : NSObject
+(NSMutableAttributedString*)addLabelToTitle:(NSString*)textStr typeStr:(NSString*)typeStr;
+(float)widthAuto:(NSString *)content fontSize:(CGFloat)fontSize contentheight:(CGFloat)height;
+(CGSize)sizeWithText:(NSString*)str sizeWithWidth:(CGFloat)width sizeWithFont:(UIFont*)font;
+(NSNumber*)transIntToNSNumber64:(UInt64)data;
+(NSNumber*)transIntToNSNumber32:(UInt32)data;
+(void)showWaitingHUDView:(UIView*)view
                    title:(NSString*)title
                   detail:(NSString*)detail;
+(void)hideWaitingHUDView:(UIView*)view;
+(void)showTipHUDView:(UIView*)view
             title:(NSString*)title
               detail:(NSString*)detail;
+(int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;
+(NSDate *)getCurrentTime;
+(NSString *)getCurrentTimeStr;
+(UIImage *)firstFrameWithVideoURL:(NSURL *)url  ;
+ (NSString *)IsChinese:(NSString *)str;
@end

NS_ASSUME_NONNULL_END
