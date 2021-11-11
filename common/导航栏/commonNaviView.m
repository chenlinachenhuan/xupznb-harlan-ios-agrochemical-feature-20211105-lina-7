//
//  commonNaviView.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/15.
//

#import "commonNaviView.h"

@implementation commonNaviView
-(id)init{
    if (self==[super init]) {
        [self createNaviView];
    }
    return self;
}
-(void)createNaviView{
    UIView * navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, TopHeight)];
    navView.backgroundColor = [UIColor whiteColor];
    [self addSubview:navView];
    self.backButton = [bigButton buttonWithType:UIButtonTypeCustom];
    self.backButton.frame = CGRectMake(10, statusBarHeight, 44, 44);
    [self.backButton addTarget:self action:@selector(leftButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.backButton setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [navView addSubview:self.backButton];
   
   _title = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/2-100, statusBarHeight, 200,navBarHeight)];
     
    _title.font = [UIFont fontWithName:@"PingFang SC" size: 17];
    _title.numberOfLines = 0;
    _title.textColor = [UIColor blackColor];
    _title.textAlignment = NSTextAlignmentCenter;
    [navView addSubview:_title] ;
//
    _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightButton.frame = CGRectMake(ScreenWidth-16-17, statusBarHeight+13.5, 17, 17);
    
    [_rightButton addTarget:self action:@selector(rightButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:_rightButton];
     

}
-(void)leftButtonMethod{
    [self.delegate leftButtonMethod];
    
}
-(void)rightButtonMethod{
    [self.delegate rightButtonMethod];

}
@end
