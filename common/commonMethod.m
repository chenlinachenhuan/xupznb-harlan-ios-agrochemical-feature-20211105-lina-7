//
//  commonMethod.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/8.
//

#import "commonMethod.h"
#import "MBProgressHUD.h"
@implementation commonMethod
+(NSMutableAttributedString*)addLabelToTitle:(NSString*)textStr typeStr:(NSString*)typeStr{
    NSString *titleString =[NSString stringWithFormat:@" %@",textStr];
    //创建  NSMutableAttributedString 富文本对象
    NSMutableAttributedString *maTitleString = [[NSMutableAttributedString alloc] initWithString:titleString];
    //创建一个小标签的Label
    NSString *aa = typeStr;
//    CGFloat aaW = 12*aa.length +6;
    CGFloat aaW=39;
    UILabel *aaL = [UILabel new];
    aaL.frame = CGRectMake(0, 0, aaW*3, 16*3);
    aaL.text = aa;
    aaL.font = FontSize(10*3);
    aaL.textColor = [UIColor whiteColor];
    aaL.backgroundColor = colorH(254, 193, 70);
    aaL.clipsToBounds = YES;
    aaL.layer.cornerRadius = 3*3;
    aaL.textAlignment = NSTextAlignmentCenter;
    //调用方法，转化成Image
    UIImage *image = [commonMethod imageWithUIView:aaL];
    //创建Image的富文本格式
    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    attach.bounds = CGRectMake(0, -2.5, aaW, 16); //这个-2.5是为了调整下标签跟文字的位置
    attach.image = image;
    //添加到富文本对象里
    NSAttributedString * imageStr = [NSAttributedString attributedStringWithAttachment:attach];
    [maTitleString insertAttributedString:imageStr atIndex:0];//加入文字前面
    //[maTitleString appendAttributedString:imageStr];//加入文字后面
    //[maTitleString insertAttributedString:imageStr atIndex:4];//加入文字第4的位置
 
    //注意 ：创建这个Label的时候，frame，font，cornerRadius要设置成所生成的图片的3倍，也就是说要生成一个三倍图，否则生成的图片会虚，同学们可以试一试。
    return maTitleString;
}
//view转成image
+(UIImage*) imageWithUIView:(UIView*) view{
    UIGraphicsBeginImageContext(view.bounds.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:ctx];
    UIImage* tImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tImage;
}

+(float)widthAuto:(NSString *)content fontSize:(CGFloat)fontSize contentheight:(CGFloat)height{
    UIFont *font = [UIFont fontWithName:@"PingFang SC" size:fontSize];
    CGSize size = CGSizeMake(250, 100);
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,nil];
    CGSize  actualsize =[content boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    return actualsize.width;
}
+(CGSize)sizeWithText:(NSString*)str sizeWithWidth:(CGFloat)width sizeWithFont:(UIFont*)font{
    CGSize textSize = [str boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:  NSStringDrawingUsesLineFragmentOrigin |
                       NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:@{NSFontAttributeName: font} context:nil].size;
    return textSize;
}
+(NSNumber*)transIntToNSNumber64:(UInt64)data{
    return [NSNumber numberWithUnsignedLongLong:data];
}
+(NSNumber*)transIntToNSNumber32:(UInt32)data{
    return [NSNumber numberWithUnsignedLongLong:data];
}
//获取窗口
+(UIWindow*)keyWindow{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    return window;
}

+(void)showTipHUDView:(UIView*)view
             title:(NSString*)title
            detail:(NSString*)detail{
    
      UIView*  containerView = [commonMethod keyWindow];
    
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[commonMethod keyWindow] animated:YES];
    hud.mode = MBProgressHUDModeText;
    NSLog(@"%@",NSLocalizedString(title, nil));
    hud.labelText = title;
    
    hud.labelFont = [UIFont systemFontOfSize:13];
//    hud.numberOfLines = 0
    hud.detailsLabelText = detail;
    hud.yOffset = CGRectGetHeight(containerView.frame)/2-80;
 
    hud.userInteractionEnabled = NO;
 
    [hud hide:YES afterDelay:1.5];
}
+(int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    NSLog(@"oneDay : %@, anotherDay : %@", oneDay, anotherDay);
    if (result == NSOrderedDescending) {
        //在指定时间前面 过了指定时间 过期
        NSLog(@"oneDay  is in the future");
        return 1;
    }
    else if (result == NSOrderedAscending){
        //没过指定时间 没过期
        //NSLog(@"Date1 is in the past");
        return -1;
    }
    //刚好时间一样.
    //NSLog(@"Both dates are the same");
    return 0;
    
}
#pragma mark -得到当前时间date
+(NSDate *)getCurrentTime{
    
    //2017-04-24 08:57:29
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    NSString *dateTime=[formatter stringFromDate:[NSDate date]];
    NSDate *date = [formatter dateFromString:dateTime];
//    [formatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
//    NSString *dateString = [formatter stringFromDate:date];
//    NSLog(@"datastring  = %@",dateString);
    return date;
}
+(NSString *)getCurrentTimeStr{
    
    //2017-04-24 08:57:29
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyyMMdd"];
    NSString *dateTime=[formatter stringFromDate:[NSDate date]];
//    NSDate *date = [formatter dateFromString:dateTime];
//    [formatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
//    NSString *dateString = [formatter stringFromDate:date];
//    NSLog(@"datastring  = %@",dateString);
    return dateTime;
}
+(UIImage *)firstFrameWithVideoURL:(NSURL *)url
{
// 获取视频第一帧
NSDictionary *opts = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO] forKey:AVURLAssetPreferPreciseDurationAndTimingKey];
AVURLAsset *urlAsset = [AVURLAsset URLAssetWithURL:url options:opts];
AVAssetImageGenerator *generator = [AVAssetImageGenerator assetImageGeneratorWithAsset:urlAsset];
generator.appliesPreferredTrackTransform = YES;
//generator.maximumSize = CGSizeMake(size.width, size.height);
NSError *error = nil;
CGImageRef img = [generator copyCGImageAtTime:CMTimeMake(0, 10) actualTime:NULL error:&error];
{
return [UIImage imageWithCGImage:img];
}
return nil;
}
//判断是否有中文
+ (NSString *)IsChinese:(NSString *)str {
    NSString *newString = str;
    
    for(int i=0; i< [str length];i++){
        int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff)
        {
            NSString *oldString = [str substringWithRange:NSMakeRange(i, 1)];
            NSString *string = [oldString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            newString = [newString stringByReplacingOccurrencesOfString:oldString withString:string];
        } else{
            
        }
    }
    return newString;
}
@end
