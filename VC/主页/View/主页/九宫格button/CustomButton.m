//
//  CustomButton.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/8.
//

#import "CustomButton.h"

@implementation CustomButton

 
-(void)buttonimage:(nonnull UIImage *)img title:(nonnull NSString *)title buttonHeight:(float)buttonHeight{
    self.buttonHeight=buttonHeight;
    self.img = img;
    self.title = title;
    [self setImage:self.img forState:UIControlStateNormal];
    [self setTitle:self.title forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size:12];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

#pragma mark 设置button内部的image的范围

- (CGRect)imageRectForContentRect:(CGRect)contentRect{

    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height ;
    if ([self.titleLabel.text isEqualToString:@"农资包采"]) {
        NSLog(@"%f",self.center.x);

    }
     return CGRectMake(imageW/3, imageH/6, imageW/3, imageH/3);

}

#pragma mark 设置button内部的title的范围

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleY = contentRect.size.height/2 ;
    CGFloat titleW = contentRect.size.width;
    
    return CGRectMake(0, titleY, titleW, titleY);

}
@end
