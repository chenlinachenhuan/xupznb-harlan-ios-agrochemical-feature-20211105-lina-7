//
//  DWQTableHeaderView.m
//  DWQCartViewController
//
//  Created by 杜文全 on 16/2/13.
//  Copyright © 2016年 com.iOSDeveloper.duwenquan. All rights reserved.
//  https://github.com/DevelopmentEngineer-DWQ/DWQShoppingCart
//  http://www.jianshu.com/u/725459648801

#import "DWQTableHeaderView.h"

@interface DWQTableHeaderView ()


@end
@implementation DWQTableHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 20, 16, 16);
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:button];
    [button setImage:[UIImage imageNamed:@"photo_original_def"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"选中"] forState:UIControlStateSelected];
    self.button = button;
    UIImageView * shopImg = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(button.frame)+12, button.center.y-7, 14, 14)];
    shopImg.image = [UIImage imageNamed:@"店铺"];
    [self.contentView addSubview:shopImg];
    UILabel * titleL = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(shopImg.frame)+6.5, shopImg.center.y-8, 200, 16)];
    titleL.font = [UIFont fontWithName:@"PingFangSC-Bold" size:15];
    [self.contentView addSubview:titleL];
    self.titleLabel = titleL;
    self.shopEnterB = [UIButton buttonWithType:UIButtonTypeCustom];
    self.shopEnterB.frame = CGRectMake(CGRectGetMaxX(titleL.frame)+5.5, titleL.center.y-4, 5, 8);
    [self.shopEnterB setBackgroundImage:[UIImage imageNamed:@"大模块进入我的"] forState:UIControlStateNormal];
    [self.shopEnterB addTarget:self action:@selector(enterShopMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.shopEnterB];
}
-(void)enterShopMethod{
    
}
- (void)buttonClick:(UIButton*)button {
    button.selected = !button.selected;
    
    if (self.dwqClickBlock) {
        self.dwqClickBlock(button.selected);
    }
}

- (void)setSelect:(BOOL)select {
    
    self.button.selected = select;
    _select = select;
    
}

- (void)setTitle:(NSString *)title {
    self.titleLabel.text = title;
    _title = title;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
