//
//  ChrysanthemumIndexView.m
//  car_gpsLink
//
//  Created by summit on 16/11/12.
//  Copyright © 2016年 lili. All rights reserved.
//

#import "ChrysanthemumIndexView.h"

@interface ChrysanthemumIndexView ()
@end

@implementation ChrysanthemumIndexView



+(ChrysanthemumIndexView *)sharedMasterUser
{
    static ChrysanthemumIndexView * chrysanthemumIndexView = nil;
    
    if (!chrysanthemumIndexView)
    {
        chrysanthemumIndexView = [[ChrysanthemumIndexView alloc] initWithFrame:CGRectMake(ScreenWidth/2-40, ScreenHeight/2-40, 80,80)];
        chrysanthemumIndexView.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.8];

//        UIView *yinying=[[UIView alloc]initWithFrame:CGRectMake(0, 20, ScreenWidth, ScreenHeight-20)];
//        yinying.backgroundColor=[UIColor blackColor];
//        yinying.alpha=0.4;
//        [chrysanthemumIndexView addSubview:yinying];
//
        
//        UIView *zhongx=[[UIView alloc]initWithFrame:CGRectMake(ScreenWidth/2-40, ScreenHeight/2-40, 80,80)];
//        zhongx.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.8];
//        //[zhongx.layer setMasksToBounds:YES];
//       // [zhongx.layer setCornerRadius:5.0];//设置矩形四个圆角半径
//        [chrysanthemumIndexView addSubview:zhongx];
        
        
        UIActivityIndicatorView *testActivityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        testActivityIndicator.center = CGPointMake(chrysanthemumIndexView.frame.size.width/2,chrysanthemumIndexView.frame.size.height/2);
        [chrysanthemumIndexView addSubview:testActivityIndicator];
        [testActivityIndicator startAnimating];
        
       // UILabel *tishiLab=[[UILabel alloc]init];
       // tishiLab.frame=CGRectMake(10,50, 80, 50);
       // tishiLab.text=  (@"处理中...", nil);
       // tishiLab.backgroundColor=[UIColor clearColor];
       // tishiLab.font = [UIFont fontWithName:@"Arial" size:14];
       // tishiLab.textAlignment=NSTextAlignmentCenter;;
       // tishiLab.textColor=[UIColor whiteColor];
        //tishiLab.numberOfLines = 0;
       // [zhongx addSubview:tishiLab];
       // chrysanthemumIndexView.layer.zPosition=12;
        
        
        
    }
    return chrysanthemumIndexView;
}
+(ChrysanthemumIndexView*)sharedShowTips:(NSString*)str{
    static ChrysanthemumIndexView * chrysanthemumIndexView = nil;
    if (!chrysanthemumIndexView){
        CGSize size = [commonMethod sizeWithText:str sizeWithWidth:ScreenWidth-40 sizeWithFont:FontSize(15)];
        chrysanthemumIndexView = [[ChrysanthemumIndexView alloc] initWithFrame:CGRectMake(ScreenWidth/2-size.width/2, ScreenHeight/2-size.height/2, size.width,size.height)];
        chrysanthemumIndexView.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.8];
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width-20, size.height)];
        label.text = str;
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.numberOfLines=0;
        label.font = FontSize(15);
        [chrysanthemumIndexView addSubview:label];
         
    }
    return chrysanthemumIndexView;
}
-(void)showTips:(NSString*)str
{
    [[UIApplication sharedApplication].keyWindow addSubview:[ChrysanthemumIndexView sharedShowTips:str]];
}
-(void)show
{
    [[UIApplication sharedApplication].keyWindow addSubview:[ChrysanthemumIndexView sharedMasterUser]];
}

-(void)remove
{
    [[ChrysanthemumIndexView sharedMasterUser] removeFromSuperview];
}

 

@end
