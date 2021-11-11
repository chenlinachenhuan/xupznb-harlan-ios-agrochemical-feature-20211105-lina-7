//
//  hospitalButton.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/18.
//

#import "hospitalButton.h"

@implementation hospitalButton
#pragma mark 设置button内部的image的范围

- (CGRect)imageRectForContentRect:(CGRect)contentRect{

    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height ;
   
     return CGRectMake(0.1132075*imageW, 0.1132075*imageW, imageW/4, imageH/2);

}

#pragma mark 设置button内部的title的范围

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleY = contentRect.size.height;
    CGFloat titleW = contentRect.size.width;
    
    return CGRectMake(0.1132075*titleW+titleW/4, 0, titleW-(0.1132075*titleW+titleW/4), titleY);

}
@end
