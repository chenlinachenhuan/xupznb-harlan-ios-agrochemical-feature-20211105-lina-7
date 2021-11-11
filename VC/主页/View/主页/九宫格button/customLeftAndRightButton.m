//
//  customLeftAndRightButton.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/16.
//

#import "customLeftAndRightButton.h"

@implementation customLeftAndRightButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)buttonimage:(nonnull UIImage *)leftImage topTitle:(nonnull NSString *)title rightImage:(nonnull UIImage *)rightImage bottomTitle:(NSString*)bottomTitle nextImage:(UIImage*)image isRightImage:(BOOL)isRightImage{
    self.leftImage = [[UIImageView alloc] initWithFrame:CGRectMake(12, (self.frame.size.height/4), CGRectGetHeight(self.frame)/2, CGRectGetHeight(self.frame)/2)];
    [self addSubview:self.leftImage];
    [self.leftImage setImage:leftImage];
    self.topLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.leftImage.frame)+CGRectGetWidth(self.frame)*0.09434, CGRectGetHeight(self.frame)*0.22916666667, self.frame.size.width-CGRectGetMaxX(self.leftImage.frame)-CGRectGetWidth(self.frame)*0.09434, CGRectGetHeight(self.frame)*0.239583333)];
    self.topLabel.font = [UIFont fontWithName:@"PingFang SC" size:12];
    [self.topLabel setText:title];

//        self.topLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.topLabel];
    if (isRightImage==YES) {
         
         self.rightImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.topLabel.frame.origin.x, CGRectGetMaxY(self.topLabel.frame)+CGRectGetHeight(self.frame)*0.21875/2, CGRectGetWidth(self.frame)*0.3490566, CGRectGetHeight(self.frame)*0.21875)];
        [self addSubview:self.rightImage];
        [self.rightImage setImage:rightImage];
    }else{
        
        self.bottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.topLabel.frame.origin.x, CGRectGetMaxY(self.topLabel.frame)+0.125*CGRectGetHeight(self.frame), [commonMethod widthAuto:bottomTitle fontSize:8 contentheight:CGRectGetHeight(self.frame)*0.15625], CGRectGetHeight(self.frame)*0.15625)];
        self.bottomLabel.font = [UIFont fontWithName:@"PingFang SC" size:8];
        [self.bottomLabel setText:bottomTitle];
         [self addSubview:self.bottomLabel];
        self.rightNextImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.bottomLabel.frame)+3.5, self.bottomLabel.frame.origin.y, CGRectGetHeight(self.frame)*0.083333333, CGRectGetHeight(self.frame)*0.1458333333)];
        self.bottomLabel.textColor = colorH(153, 153, 153);
       [self addSubview:self.rightNextImage];
       [self.rightNextImage setImage:image];
    }
     
//    [self.rightImage setImage:rightImage];
//    [self.leftImage setImage:leftImage forState:UIControlStateNormal];
//    [self.topLabel setTitle:title forState:UIControlStateNormal];
//    self.titleLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
//    self.titleLabel.textAlignment = NSTextAlignmentCenter;
//
//    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}
 
 
 
//-(UIImageView*)leftImage{
//    if (!self.leftImage) {
//        self.leftImage = [[UIImageView alloc] initWithFrame:CGRectMake(12, self.center.x-(self.frame.size.height/4), CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)/2)];
//        [self addSubview:self.leftImage];
//    }
//    return self.leftImage;
//}
//-(UILabel*)topLabel{
//    if (!self.topLabel) {
//        self.topLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.leftImage.frame)+14, self.topLabel.frame.origin.y, self.frame.size.width-CGRectGetMaxX(self.leftImage.frame)-14-8.5, CGRectGetHeight(self.frame)*0.239583333)];
//        [self addSubview:self.topLabel];
//
//    }
//    return self.topLabel;
//}
//-(UIImageView*)rightImage{
//    if (!self.rightImage) {
//        self.rightImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.topLabel.frame.origin.x, CGRectGetHeight(self.topLabel.frame)+10.5, CGRectGetWidth(self.frame)*0.29245283, CGRectGetHeight(self.frame)*0.21875)];
//        [self addSubview:self.rightImage];
//
//    }
//    return self.rightImage;
//}
//-(UIImageView*)leftImage{
//    if (!self.leftImage) {
//        self.leftImage = [[UIImageView alloc] initWithFrame:CGRectMake(12, self.center.x-(self.frame.size.height/4), CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)/2)];
//    }
//    return self.leftImage;
//}
//-(UIImageView*)leftImage{
//    if (!self.leftImage) {
//        self.leftImage = [[UIImageView alloc] initWithFrame:CGRectMake(12, self.center.x-(self.frame.size.height/4), CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)/2)];
//    }
//    return self.leftImage;
//}
@end
