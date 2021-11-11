//
//  ChrysanthemumIndexView.h
//  car_gpsLink
//
//  Created by summit on 16/11/12.
//  Copyright © 2016年 lili. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ChrysanthemumIndexView : UIView

/**
 *   移除本控件
 */
-(void)remove;
/**
 *  显示本控件
 */
-(void)show;


+ (ChrysanthemumIndexView *)sharedMasterUser;
+(ChrysanthemumIndexView*)sharedShowTips:(NSString*)str;
-(void)showTips:(NSString*)str;
@end
