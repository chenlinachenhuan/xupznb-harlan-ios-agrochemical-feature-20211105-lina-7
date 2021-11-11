//
//  orderPayView.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface orderPayView : UIView
@property(nonatomic,retain)UIView * cellView;
@property(nonatomic,retain)UILabel * moneyL;
@property(nonatomic,retain)NSString * money;
@property(nonatomic,retain)UIButton * recordButton;
@property(nonatomic,retain)UIButton * agreebutton;
@property(nonatomic,retain)UIButton * sureButton;
@end

NS_ASSUME_NONNULL_END
