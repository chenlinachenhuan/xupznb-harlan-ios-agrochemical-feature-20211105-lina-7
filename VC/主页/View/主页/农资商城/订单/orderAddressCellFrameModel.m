//
//  orderAddressCellFrameModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/11/3.
//

#import "orderAddressCellFrameModel.h"
@implementation orderAddressCellFrameModel
-(void)setModel:(addressTextModel *)model{
    _model = model;
    if ([model.defaultStatus integerValue]==1) {
        self.morenFrame = CGRectMake(12, 18, 40, 17);
    }else{
        self.morenFrame = CGRectMake(5, 0, 0, 0);
    }
    self.cityFrame = CGRectMake(CGRectGetMaxX(self.morenFrame)+7, 18, [commonMethod widthAuto:[NSString stringWithFormat:@"%@ %@ %@",model.province,model.city,model.region] fontSize:14 contentheight:14], 14);
    self.detailAddressFrame = (CGRect){12,CGRectGetMaxY(self.cityFrame)+11,[commonMethod sizeWithText:[NSString stringWithFormat:@"%@",model.address] sizeWithWidth:ScreenWidth-80 sizeWithFont:[UIFont fontWithName:@"PingFang SC Medium" size:17]]};
    self.nameFrame = CGRectMake(12, CGRectGetMaxY(self.detailAddressFrame)+11.5, [commonMethod widthAuto:model.name fontSize:14 contentheight:14], 14);
    self.phoneFrame = CGRectMake(CGRectGetMaxX(self.nameFrame)+7.5, CGRectGetMaxY(self.nameFrame)-7-5.5, [commonMethod widthAuto:model.phone fontSize:14 contentheight:11], 11);
    self.cellHeight = CGRectGetMaxY(self.phoneFrame)+34;
    self.imageFrame = CGRectMake(ScreenWidth-35, _cellHeight/2-3.5, 7, 12);
}
@end
