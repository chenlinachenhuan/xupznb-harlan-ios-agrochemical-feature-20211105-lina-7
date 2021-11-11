//
//  commonNaviView.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol commonNaviViewDelegate;
@interface commonNaviView : UIView
@property(nonatomic,retain)bigButton * backButton;
@property(nonatomic,retain)UIButton * rightButton;
@property(nonatomic,retain)UILabel * title ;
@property(nonatomic,weak)id delegate;
@end
@protocol commonNaviViewDelegate <NSObject>

-(void)leftButtonMethod;
-(void)rightButtonMethd;

@end
NS_ASSUME_NONNULL_END
