//
//  goodsCellOneVIew.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/12.
//

#import "goodsCellOneVIew.h"

@implementation goodsCellOneVIew
-(id)init{
    if (self==[super init]) {
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 10;
    }
    return self;
}
-(void)createCellOneView:(goodsCellOneFrameModel *)frameModel{
    UILabel * moneyUnitL = [[UILabel alloc] init];
    moneyUnitL.frame = frameModel.moneyUnitLFrame;
    moneyUnitL.text = @"¥";
    moneyUnitL.font = FontSize(15);
    moneyUnitL.textColor = SelectColor;
    [self addSubview:moneyUnitL];
    
    UILabel * moneyRangeL = [[UILabel alloc] init];
    moneyRangeL.frame = frameModel.moneyRangeLFrame;
    moneyRangeL.text = [NSString stringWithFormat:@"%@-%@",frameModel.textModel.mallMinPrice,frameModel.textModel.mallMaxPrice];
    moneyRangeL.font = FontSize(24);
    moneyRangeL.textColor = SelectColor;
    [self addSubview:moneyRangeL];
    
    UILabel * moneyL = [[UILabel alloc] init];
    moneyL.frame = frameModel.moneyLFrame;
    moneyL.text = [NSString stringWithFormat:@"价格 ¥ %@起",frameModel.textModel.marketMinPrice];
    moneyL.font = FontSize(12);
    moneyL.textColor = CommonColor;
    [self addSubview:moneyL];
    
    if ([frameModel.textModel.isSelf integerValue]==1) {
        UILabel * typeL = [[UILabel alloc] init];
        typeL.frame = frameModel.typeLFrame;
        typeL.text = @"自营";
        typeL.font = FontSize(12);
        typeL.textColor = [UIColor whiteColor];
        typeL.backgroundColor = [UIColor colorWithRed:254/255.0 green:193/255.0 blue:70/255.0 alpha:1.0];
        typeL.textAlignment = NSTextAlignmentCenter;
        typeL.clipsToBounds = YES;
        typeL.layer.cornerRadius = 5;
        [self addSubview:typeL];
    }
    
    
    UILabel * numberL = [[UILabel alloc] init];
    numberL.frame = frameModel.numberLFrame;
    numberL.text = [NSString stringWithFormat:@"月销%@+",frameModel.textModel.saleNum];
    numberL.font = FontSize(12);
    numberL.textColor = CommonColor;
    [self addSubview:numberL];
    
    UILabel * titleL = [[UILabel alloc] init];
    titleL.frame = frameModel.titleLFrame;
    titleL.text = frameModel.textModel.name;
    titleL.font = [UIFont fontWithName:@"PingFang SC Medium" size:17];
//    titleL.backgroundColor = SelectColor;
    titleL.numberOfLines = 0;
    [self addSubview:titleL];
    
    UILabel * shareL = [[UILabel alloc] init];
    shareL.frame = frameModel.shareLFrame;
    shareL.text = @"分享";
    shareL.font = FontSize(12);
    shareL.textColor = CommonColor;
    [self addSubview:shareL];
    
    UIButton * shareB = [UIButton buttonWithType:UIButtonTypeCustom];
    shareB.frame = frameModel.shareBFrame;
    [shareB setBackgroundImage:[UIImage imageNamed:@"转发1"] forState:UIControlStateNormal];
    [shareB addTarget:self action:@selector(shareMethod) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:shareB];
        
}
-(void)shareMethod{
    
}
@end
