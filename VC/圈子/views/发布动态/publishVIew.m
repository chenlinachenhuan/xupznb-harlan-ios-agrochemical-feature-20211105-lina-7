//
//  publishVIew.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/21.
//

#import "publishVIew.h"

@implementation publishVIew
-(id)initWithFrame:(CGRect)frame{
    if (self==[super initWithFrame:frame]) {
        self.frame = frame;
        self.titleArr = [[NSArray alloc] init];
    }
    return self;
}
-(void)createPublishView:(NSArray*)titleArr{
    self.titleArr = titleArr;
    self.shadowView = [[UIView alloc] initWithFrame:self.frame];
    self.shadowView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    [self addSubview:self.shadowView];
    UITapGestureRecognizer * rec = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMethod)];
    [self.shadowView addGestureRecognizer:rec];
    _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, ScreenWidth, 60*self.titleArr.count)];
    _bgView.backgroundColor = UIColorFromRGB(0xF7F7F7);
    [self.shadowView addSubview:_bgView];
    
    for (int i=0; i<self.titleArr.count; i++) {
        UIButton * button =[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 60*i, ScreenWidth, 58);
        [button setBackgroundColor:[UIColor whiteColor]];
        [button setTitle:titleArr[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = FontSize(16);
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        button.titleLabel.numberOfLines=0;
        button.tag=200+i;
        [button addTarget:self action:@selector(buttonClickMethod:) forControlEvents:UIControlEventTouchUpInside];
        [_bgView addSubview:button];
        if (i==0) {
            NSMutableAttributedString * abs = [[NSMutableAttributedString alloc] initWithString:button.titleLabel.text];
            [abs addAttribute:NSForegroundColorAttributeName value:CommonColor range:NSMakeRange(button.titleLabel.text.length-5, 5)];
            [abs addAttribute:NSFontAttributeName value:FontSize(11) range:NSMakeRange(button.titleLabel.text.length-5, 5)];
            [button setAttributedTitle:abs forState:UIControlStateNormal];
            
        }
    }
    [UIView animateWithDuration:0.5 animations:^{
        self->_bgView.frame = CGRectMake(0, self.frame.size.height-60*self.titleArr.count, ScreenWidth, 60*self.titleArr.count) ;
    }];
}
-(void)tapMethod{
    [UIView animateWithDuration:0.5 animations:^{
        self->_bgView.frame = CGRectMake(0, self.frame.size.height, ScreenWidth, self.titleArr.count);
     } completion:^(BOOL finished) {
         [self removeFromSuperview];

    }];
    
}
-(void)buttonClickMethod:(UIButton *)button{
    [self removeFromSuperview];
    [self.myDelegate publishTypeButtonMethod:button.tag-200];
}
 
@end
