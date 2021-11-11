//
//  customLeftAndRightButton.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface customLeftAndRightButton : UIButton
@property(nonatomic,retain)UIImageView*leftImage;
@property(nonatomic,retain)UIImageView*rightImage;
@property(nonatomic,retain)UIImageView*rightNextImage;

@property(nonatomic,retain)UILabel*topLabel;
@property(nonatomic,retain)UILabel*bottomLabel;
@property(nonatomic,assign)BOOL isShowRightImage;
-(void)buttonimage:(nonnull UIImage *)leftImage topTitle:(nonnull NSString *)title rightImage:(nonnull UIImage *)rightImage bottomTitle:(NSString*)bottomTitle nextImage:(UIImage*)image isRightImage:(BOOL)isRightImage;
@end

NS_ASSUME_NONNULL_END
