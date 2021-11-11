//
//  addStudyPayView.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/11.
//

#import "addStudyPayView.h"

@implementation addStudyPayView

-(id)initWithFrame:(CGRect)frame{
    if (self==[super initWithFrame:frame]) {
        
        self.frame = frame;
    }
    return self;
}

-(void)buttonConerRediu:(UIView*)view withRectCorner:(UIRectCorner)RectCorner withLayer:(CALayer*)layer{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds
                                                   byRoundingCorners:RectCorner cornerRadii:CGSizeMake(10, 10)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view.bounds;
    maskLayer.path = maskPath.CGPath;
    layer.mask = maskLayer;
}
-(void)createCellView:(classDetailDataModel*)model{
    UIView * bgView = [[UIView alloc] initWithFrame:self.frame];
    bgView.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.3];
    [self addSubview:bgView];
    UITapGestureRecognizer * rec = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMethod)];
    [bgView addGestureRecognizer:rec];
    self.cellView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, ScreenWidth, 485)];
    self.cellView.backgroundColor = [UIColor whiteColor];
    [self buttonConerRediu:self.cellView withRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight withLayer:self.cellView.layer];
    [self addSubview:self.cellView];
    [UIView animateWithDuration:0.5 animations:^{
        self.cellView.frame =CGRectMake(0, self.frame.size.height-485, ScreenWidth, 485);
    }];
    UILabel * titleL = [[UILabel alloc] init];
    titleL.frame = (CGRect){16,20,[self calculateLabelSize:@"付费后即可学习" strWidth:200 fontSize:[UIFont fontWithName:@"PingFang SC Medium" size:17]]};
    titleL.text = @"付费后即可学习";
    titleL.font = [UIFont fontWithName:@"PingFang SC Medium" size:17];
    [self.cellView addSubview:titleL];
    
    UIButton * closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    closeButton.frame = CGRectMake(ScreenWidth-16.5-14, titleL.center.y-7, 14, 14);
    [closeButton addTarget:self action:@selector(tapMethod) forControlEvents:UIControlEventTouchUpInside];
    [closeButton setImage:[UIImage imageNamed:@"关闭灰色"] forState:UIControlStateNormal];
    [self.cellView addSubview:closeButton];
    

    UILabel * tipsL = [[UILabel alloc] init];
    tipsL.frame = (CGRect){16,CGRectGetMaxY(titleL.frame)+5,[self calculateLabelSize:@"如取消订单，未付费课程将无法学习" strWidth:ScreenWidth fontSize:FontSize(12)]};
    tipsL.text = @"如取消订单，未付费课程将无法学习";
    tipsL.textColor = CommonColor;
    tipsL.font = FontSize(12);
    [self.cellView addSubview:tipsL];
    
    UILabel * lab1 = [[UILabel alloc] init];
    lab1.frame = (CGRect){16,CGRectGetMaxY(tipsL.frame)+20,[self calculateLabelSize:@"合计课程费用" strWidth:ScreenWidth fontSize:FontSize(14)]};
    lab1.text = @"合计课程费用";
//    lab1.textColor = CommonColor;
    lab1.font = FontSize(14);
    [self.cellView addSubview:lab1];
   CGSize size = [self calculateLabelSize:[NSString stringWithFormat:@"%@",model.model.mallPrice] strWidth:[commonMethod widthAuto:[NSString stringWithFormat:@"%@",model.model.mallPrice] fontSize:30 contentheight:25] fontSize:FontSize(30)];
    self.moneyL = [[UILabel alloc] init];
    self.moneyL.frame = (CGRect){ScreenWidth-16-[commonMethod widthAuto:[NSString stringWithFormat:@"%@",model.model.mallPrice] fontSize:30 contentheight:25],CGRectGetMaxY(lab1.frame)-size.height+10,size};
    self.moneyL.text = [NSString stringWithFormat:@"%@",model.model.mallPrice];
//    lab1.textColor = CommonColor;
    self.moneyL.font = FontSize(30);
    self.moneyL.textAlignment = NSTextAlignmentRight;
    [self.cellView addSubview:self.moneyL];
    NSMutableAttributedString * moneyAttr = [[NSMutableAttributedString alloc] initWithString:self.moneyL.text];
    [moneyAttr addAttribute:NSFontAttributeName value:FontSize(18) range:NSMakeRange(0, 1)];
    self.moneyL.attributedText = moneyAttr;
    
    UILabel * couponL = [[UILabel alloc]init];
    couponL.frame = CGRectMake(16.5, CGRectGetMaxY(lab1.frame)+13, [commonMethod widthAuto:@"优惠券" fontSize:14 contentheight:14], 14);
    couponL.text = @"优惠券";
    couponL.textColor = UIColorFromRGB(0xFF835D);
    couponL.font = FontSize(14);
    [self.cellView addSubview:couponL];
    
    UIButton * couponButton = [UIButton buttonWithType:UIButtonTypeCustom];
    couponButton.frame = CGRectMake(ScreenWidth-16.5-[commonMethod widthAuto:@"无可用  >" fontSize:14 contentheight:14], CGRectGetMaxY(lab1.frame)+13, [commonMethod widthAuto:@"无可用  >" fontSize:14 contentheight:14], 14);
    [couponButton setTitle:@"无可用" forState:UIControlStateNormal];
    [couponButton setTitleColor:UIColorFromRGB(0xA2A6AC) forState:UIControlStateNormal];
    couponButton.titleLabel.font = FontSize(14);
    [couponButton setImage:[UIImage imageNamed:@"大模块进入我的"] forState:UIControlStateNormal];
    couponButton.titleEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 0);
    couponButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -[commonMethod widthAuto:@"无可用" fontSize:14 contentheight:14]*2-5);
//    couponButton.backgroundColor = SelectColor;
    [self.cellView addSubview:couponButton];
    
    UILabel * lineL = [[UILabel alloc] initWithFrame:CGRectMake(16, CGRectGetMaxY(couponL.frame)+19, ScreenWidth-32, 0.5)];
    lineL.backgroundColor = UIColorFromRGB(0xDADDE1);
    [self.cellView addSubview:lineL];
    
    UIImageView * imgV = [[UIImageView alloc] initWithFrame:CGRectMake(16, CGRectGetMaxY(lineL.frame)+20, 28, 28)];
    imgV.image = [UIImage imageNamed:@"我的钱包"];
    [self.cellView addSubview:imgV];
    
    UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imgV.frame)+12.5, CGRectGetMaxY(imgV.frame)-CGRectGetHeight(imgV.frame)/2-7, 60, 14)];
    label2.text = @"我的钱包";
    label2.font = FontSize(15);
    [self.cellView addSubview:label2];
    
    UIButton * myPayButton = [UIButton buttonWithType:UIButtonTypeCustom];
    myPayButton.frame = CGRectMake(ScreenWidth-16-18, imgV.center.y-9, 18, 18);
    myPayButton.clipsToBounds=YES;
    myPayButton.layer.cornerRadius = 9;
    myPayButton.layer.borderWidth = 0.5;
    myPayButton.tag = 100;
    myPayButton.layer.borderColor = UIColorFromRGB(0xA2A6AC).CGColor;
    [myPayButton addTarget:self action:@selector(buttonClickMethod:) forControlEvents:UIControlEventTouchUpInside];

    [self.cellView addSubview:myPayButton];
    
   
    UILabel * overageL = [[UILabel alloc] init];
    overageL.frame = CGRectMake(myPayButton.frame.origin.x-10-[commonMethod widthAuto:[NSString stringWithFormat:@"余额:%@",@"99"] fontSize:14 contentheight:13], myPayButton.center.y-6.5, [commonMethod widthAuto:[NSString stringWithFormat:@"余额:%@",@"99"] fontSize:14 contentheight:13], 13);
    overageL.text = [NSString stringWithFormat:@"余额:%@",@"99"];
//    overageL.textColor = SelectColor;
    overageL.textAlignment = NSTextAlignmentRight;
    overageL.font = FontSize(14);
    overageL.numberOfLines = 0;
    [self.cellView addSubview:overageL];
    
    UIButton * RechargeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    RechargeButton.frame = CGRectMake(ScreenWidth-16-[commonMethod widthAuto:@"去充值  >" fontSize:14 contentheight:14], CGRectGetMaxY(overageL.frame)+14.5, [commonMethod widthAuto:@"去充值  >" fontSize:14 contentheight:14], 14);
    [RechargeButton setTitle:@"去充值" forState:UIControlStateNormal];
    [RechargeButton setTitleColor:UIColorFromRGB(0xA2A6AC) forState:UIControlStateNormal];
    [RechargeButton addTarget:self action:@selector(RechargeButtonMethod:) forControlEvents:UIControlEventTouchUpInside];
    [RechargeButton setImage:[UIImage imageNamed:@"大模块进入我的"] forState:UIControlStateNormal];
    RechargeButton.titleLabel.font = FontSize(14);
    RechargeButton.titleEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 0);
    RechargeButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -[commonMethod widthAuto:@"去充值" fontSize:14 contentheight:14]*2-5);
//    RechargeButton.backgroundColor = SelectColor;
    [self.cellView addSubview:RechargeButton];
    
    
    UILabel * lineL2 = [[UILabel alloc] init];
    lineL2.frame = CGRectMake(lineL.frame.origin.x,CGRectGetMaxY(RechargeButton.frame)+20, ScreenWidth-32, 0.5);
    lineL2.backgroundColor = UIColorFromRGB(0xDADDE1);
    [self.cellView addSubview:lineL2];
    
    UIImageView * wechatImgV = [[UIImageView alloc] initWithFrame:CGRectMake(16, CGRectGetMaxY(lineL2.frame)+18, 28, 28)];
    wechatImgV.image = [UIImage imageNamed:@"微信支付"];
    [self.cellView addSubview:wechatImgV];
    
    
    UILabel * wechatL = [[UILabel alloc] init];
    wechatL.frame = CGRectMake(CGRectGetMaxX(wechatImgV.frame)+12, wechatImgV.center.y-7.5, 60, 15);
    wechatL.text = @"微信支付";
//    wechatL.textColor = SelectColor;
    wechatL.textAlignment = NSTextAlignmentCenter;
    wechatL.font = FontSize(15);
    wechatL.numberOfLines = 0;
    [self.cellView addSubview:wechatL];
    
   
    UIButton * wechatButton = [UIButton buttonWithType:UIButtonTypeCustom];
    wechatButton.frame = CGRectMake(myPayButton.frame.origin.x,wechatImgV.center.y-9, 18, 18);
    [wechatButton addTarget:self action:@selector(buttonClickMethod:) forControlEvents:UIControlEventTouchUpInside];
    wechatButton.clipsToBounds = YES;
    wechatButton.layer.cornerRadius = 9;
    wechatButton.layer.borderWidth = 0.5;
    wechatButton.layer.borderColor = UIColorFromRGB(0xA2A6AC).CGColor;
    wechatButton.tag = 200;
    [self.cellView addSubview:wechatButton];
    
    UIImageView * alipayImgV = [[UIImageView alloc] initWithFrame:CGRectMake(16, CGRectGetMaxY(wechatImgV.frame)+20, 28, 28)];
    alipayImgV.image = [UIImage imageNamed:@"支付宝"];
    [self.cellView addSubview:alipayImgV];
    
    
    UILabel * alipayL = [[UILabel alloc] init];
    alipayL.frame = CGRectMake(CGRectGetMaxX(alipayImgV.frame)+12, alipayImgV.center.y-7.5, 75, 15);
    alipayL.text = @"支付宝支付";
//    wechatL.textColor = SelectColor;
    alipayL.textAlignment = NSTextAlignmentCenter;
    alipayL.font = FontSize(15);
    alipayL.numberOfLines = 0;
    [self.cellView addSubview:alipayL];
    
   
    UIButton * alipayButton = [UIButton buttonWithType:UIButtonTypeCustom];
    alipayButton.frame = CGRectMake(myPayButton.frame.origin.x,alipayImgV.center.y-9, 18, 18);
    [alipayButton addTarget:self action:@selector(buttonClickMethod:) forControlEvents:UIControlEventTouchUpInside];
    alipayButton.clipsToBounds = YES;
    alipayButton.layer.cornerRadius = 9;
    alipayButton.layer.borderWidth = 0.5;
    alipayButton.layer.borderColor = UIColorFromRGB(0xA2A6AC).CGColor;
    alipayButton.tag = 300;
    [self.cellView addSubview:alipayButton];
    
    UIButton * agreebutton = [UIButton buttonWithType:UIButtonTypeCustom];
    agreebutton.frame = CGRectMake(16, CGRectGetMaxY(alipayImgV.frame)+48 , 18, 18);
    [agreebutton addTarget:self action:@selector(agreebuttonClickMethod) forControlEvents:UIControlEventTouchUpInside];
    [agreebutton setImage:[UIImage imageNamed:@"选中"] forState:UIControlStateNormal];
    agreebutton.titleLabel.font = FontSize(14);
    [self.cellView addSubview:agreebutton];
    
    
    UILabel * agreelabel = [[UILabel alloc] init];
    agreelabel.frame = CGRectMake(CGRectGetMaxX(agreebutton.frame)+13, agreebutton.center.y-7.5, [commonMethod widthAuto:@"同意" fontSize:15 contentheight:15], 15);
    agreelabel.text = @"同意";
    agreelabel.textColor = UIColorFromRGB(0xA2A6AC);
    agreelabel.textAlignment = NSTextAlignmentCenter;
    agreelabel.font = FontSize(15);
    agreelabel.numberOfLines = 0;
    [self.cellView addSubview:agreelabel];
    
    UIButton * agreeTextbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    agreeTextbutton.frame = CGRectMake(CGRectGetMaxX(agreelabel.frame), agreebutton.center.y-7.5 , [commonMethod widthAuto:@"《付款协议》" fontSize:15 contentheight:15], 15);
    [agreeTextbutton addTarget:self action:@selector(agreeTextbuttonClickMethod) forControlEvents:UIControlEventTouchUpInside];
    [agreeTextbutton setTitleColor:UIColorFromRGB(0x62BFB4) forState:UIControlStateNormal];
    [agreeTextbutton setTitle:@"《付款协议》" forState:UIControlStateNormal];
    agreeTextbutton.titleLabel.font = FontSize(14);
    [self.cellView addSubview:agreeTextbutton];
    
    UIButton * sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    sureButton.frame = CGRectMake(16, CGRectGetMaxY(agreeTextbutton.frame)+20, ScreenWidth-32, 50);
    [sureButton setTitle:[NSString stringWithFormat:@"确认支付%@元",@"199"] forState:UIControlStateNormal];
    [sureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sureButton addTarget:self action:@selector(sureButtonClickMethod) forControlEvents:UIControlEventTouchUpInside];
    sureButton.titleLabel.font = FontSize(17);
    sureButton.backgroundColor = UIColorFromRGB(0x5EBFB3 );
    sureButton.clipsToBounds = YES;
    sureButton.layer.cornerRadius = 16;
    [self.cellView addSubview:sureButton];

}
-(void)closeButtonClickMethod{
    
}
-(void)sureButtonClickMethod{
    
}
-(void)agreeTextbuttonClickMethod{
    
}
-(void)agreebuttonClickMethod{
    
}
-(void)buttonClickMethod:(UIButton*)button{
    
}
-(void)tapMethod{
    [UIView animateWithDuration:0.5 animations:^{
        self.cellView.frame =CGRectMake(0, self.frame.size.height, ScreenWidth, 485);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];

    }];
 }
-(CGSize)calculateLabelSize:(NSString*)str strWidth:(CGFloat)width fontSize:(UIFont*)font{
  CGSize  textSize = [str boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:nil].size;
    return textSize;
}
@end
