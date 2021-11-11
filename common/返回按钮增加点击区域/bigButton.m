//
//  bigButton.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/9.
//

#import "bigButton.h"

@implementation bigButton
- (CGRect)imageRectForContentRect:(CGRect)contentRect{

    if (contentRect.size.width==44) {
        return CGRectMake(0, 13.5, 10, 17);

    }
    return CGRectMake(23, 13.5, 17, 17);

 
}

#pragma mark 设置button内部的title的范围

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    
    return CGRectMake(0, 0, 44, 44);

}



@end
