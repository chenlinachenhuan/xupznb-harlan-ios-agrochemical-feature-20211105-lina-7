//
//  topAndBottomButton.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/13.
//

#import "topAndBottomButton.h"

@implementation topAndBottomButton

#pragma mark 设置button内部的image的范围

- (CGRect)imageRectForContentRect:(CGRect)contentRect{

   
    return CGRectMake(contentRect.size.width/2-9, 8, 18, 18);

}

#pragma mark 设置button内部的title的范围

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
   
    
    return CGRectMake(contentRect.size.width/2-10, 32, 20, 10);

}
@end
