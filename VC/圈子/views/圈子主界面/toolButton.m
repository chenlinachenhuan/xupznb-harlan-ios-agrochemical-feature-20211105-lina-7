//
//  toolButton.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/23.
//

#import "toolButton.h"

@implementation toolButton

#pragma mark 设置button内部的image的范围

- (CGRect)imageRectForContentRect:(CGRect)contentRect{

    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height ;
   
     return CGRectMake(0, 0, imageW/4, imageH);

}

#pragma mark 设置button内部的title的范围

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleY = contentRect.size.height;
    CGFloat titleW = contentRect.size.width;
    
    return CGRectMake(titleW/3, 0, titleW*2/3, titleY);

}

@end
