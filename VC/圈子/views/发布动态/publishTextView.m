//
//  publishTextView.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/21.
//

#import "publishTextView.h"

@implementation publishTextView

-(void)createTextView{
    UIView * topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, TopHeight)];
    topView.backgroundColor = SelectColor;
    [self addSubview:topView];
    
    bigButton * backButton = [bigButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(10.5, statusBarHeight, 44, 44);
    [backButton setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:backButton];
}
-(void)backButtonMethod{
    
}
@end
