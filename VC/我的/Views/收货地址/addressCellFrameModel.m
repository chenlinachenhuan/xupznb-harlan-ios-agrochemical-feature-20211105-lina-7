//
//  addressCellFrameModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/28.
//

#import "addressCellFrameModel.h"

@implementation addressCellFrameModel
-(void)setModel:(addressTextModel *)model{
    _model=model;
    _nameFrame = CGRectMake(54, 20, [commonMethod widthAuto:model.name fontSize:16 contentheight:16], 16);
    _phoneFrame = CGRectMake(CGRectGetMaxX(self.nameFrame)+4.5, CGRectGetMaxY(self.nameFrame)-CGRectGetHeight(self.nameFrame)/2-5, [commonMethod widthAuto:model.phone fontSize:13 contentheight:10], 10);
    self.selectAddressLFrame = CGRectMake(CGRectGetMaxX(self.phoneFrame)+5.5, CGRectGetMaxY(self.nameFrame)-CGRectGetHeight(self.nameFrame)/2-8.5, 40, 17);
    self.addressLFrame = (CGRect){self.nameFrame.origin.x, CGRectGetMaxY(self.nameFrame)+10.5, [commonMethod sizeWithText:[NSString stringWithFormat:@"%@ %@ %@ %@",model.province,model.city,model.region,model.address] sizeWithWidth:ScreenWidth-140 sizeWithFont:FontSize(14)]};
    self.cellHeight = CGRectGetMaxY(self.addressLFrame)+20;
    self.iconVFrame = CGRectMake(10, self.cellHeight/2-16, 32, 32);
    self.iconLFrame = self.iconVFrame;
    self.checkBFrame = CGRectMake(ScreenWidth-48, self.cellHeight/2-8, 16, 16);
}
@end
