//
//  orderAddressCellView.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/3.
//

#import "orderAddressCellView.h"

@implementation orderAddressCellView

-(id)init{
    if (self==[super init]) {
        self.clipsToBounds=YES;
        self.layer.cornerRadius = 10;
        [self creatCellView];
    }
    return self;
}
-(void)creatCellView{
    self.morenL = [[UILabel alloc] init];
    self.morenL.backgroundColor = UIColorFromRGB(0xFEC146);
    self.morenL.text = @"默认";
    self.morenL.textColor = [UIColor whiteColor];
    self.morenL.textAlignment = NSTextAlignmentCenter;
    self.morenL.font = FontSize(12);
    self.morenL.clipsToBounds = YES;
    self.morenL.layer.cornerRadius = 5;
    [self addSubview:self.morenL];
    
    self.cityL = [[UILabel alloc] init];
    self.cityL.textColor = UIColorFromRGB(0x080808 );
    self.cityL.font = FontSize(14);
    [self addSubview:self.cityL];
    
    self.detailAddressL = [[UILabel alloc] init];
    self.detailAddressL.textColor = UIColorFromRGB(0x080808);
    self.detailAddressL.font = [UIFont fontWithName:@"PingFang SC Medium" size:17];
    self.detailAddressL.numberOfLines=0;
    [self addSubview:self.detailAddressL];
    
    self.nameL = [[UILabel alloc] init];
    self.nameL.font = FontSize(14);
    self.nameL.textColor = UIColorFromRGB(0x080808);
    [self addSubview:self.nameL];
    
    self.phoneL = [[UILabel alloc] init];
    self.phoneL.font = FontSize(14);
    self.phoneL.textColor = UIColorFromRGB(0x080808);
    [self addSubview:self.phoneL];
    
    self.enterImg = [[UIImageView alloc] init];
    self.enterImg.image = [UIImage imageNamed:@"大模块进入我的"];
    [self addSubview:self.enterImg];
}
-(void)setFrameModel:(orderAddressCellFrameModel *)frameModel{
    _frameModel = frameModel;
    for (int i=0; i<20; i++) {
        UIImageView * imagV = [[UIImageView alloc] init];
        imagV.frame = CGRectMake(6.5+(53+12)*i,frameModel.cellHeight-8 , 53, 4);
        imagV.image = [UIImage imageNamed:@"分隔条"];
        [self addSubview:imagV];
    }
    
    self.morenL.frame = frameModel.morenFrame;
    self.cityL.frame = frameModel.cityFrame;
    self.cityL.text = [NSString stringWithFormat:@"%@ %@ %@",frameModel.model.province,frameModel.model.city,frameModel.model.region];
    self.detailAddressL.frame = frameModel.detailAddressFrame;
    self.detailAddressL.text = frameModel.model.address;
    self.nameL.frame = frameModel.nameFrame;
    self.nameL.text = frameModel.model.name;
    self.phoneL.frame = frameModel.phoneFrame;
    self.phoneL.text = frameModel.model.phone;
    self.enterImg.frame = frameModel.imageFrame;
}
@end
