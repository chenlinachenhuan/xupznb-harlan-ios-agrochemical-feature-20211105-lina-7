//
//  CustomButton.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomButton : UIButton
typedef NS_ENUM(NSUInteger, UIButtonStyle){
    UIButtonStyleTopAndBottom = 0,
    UIButtonStyleleftAndRight = 1,
};
@property(nonatomic,assign)UIButtonStyle buttonStyle;
@property(nonatomic,retain)UIImage  * img;
@property(nonatomic,retain)NSString * title;
@property(nonatomic,assign)float      buttonHeight;
-(void)buttonimage:(nonnull UIImage *)img title:(nonnull NSString *)title buttonHeight:(float)buttonHeight ;
//-(void)createButton:(CGRect)frame;
@end

NS_ASSUME_NONNULL_END
