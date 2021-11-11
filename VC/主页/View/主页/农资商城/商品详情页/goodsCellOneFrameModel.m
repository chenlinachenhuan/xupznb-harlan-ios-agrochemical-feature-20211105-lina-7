//
//  goodsCellOneFrameModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/12.
//

#import "goodsCellOneFrameModel.h"

@implementation goodsCellOneFrameModel

-(void)setGoodsFrams:(productDetailModel*)textModel{
    self.moneyUnitLFrame = CGRectMake(10, 15.5, [commonMethod widthAuto:@"¥" fontSize:15 contentheight:13], 13);
    self.moneyRangeLFrame = CGRectMake(CGRectGetMaxX(self.moneyUnitLFrame)+5, 10, [commonMethod widthAuto:[NSString stringWithFormat:@"%@-%@",textModel.mallMinPrice,textModel.mallMaxPrice] fontSize:24 contentheight:20], 20);
    self.moneyLFrame = CGRectMake(CGRectGetMaxX(self.moneyRangeLFrame)+12, CGRectGetMaxY(self.moneyRangeLFrame)-12, [commonMethod widthAuto:[NSString stringWithFormat:@"价格 ¥ %@起",textModel.mallMinPrice] fontSize:12 contentheight:12], 12);
    self.typeLFrame = CGRectMake(10, CGRectGetMaxY(self.moneyRangeLFrame)+15.5, 39, 17);
    self.numberLFrame = CGRectMake(ScreenWidth-30- [commonMethod widthAuto:[NSString stringWithFormat:@"月销%@+",textModel.saleNum] fontSize:12 contentheight:12], self.typeLFrame.origin.y, [commonMethod widthAuto:[NSString stringWithFormat:@"月销%@+",textModel.saleNum] fontSize:12 contentheight:12], 12);
    CGSize textSize = [textModel.name boundingRectWithSize:CGSizeMake(ScreenWidth-53, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC Medium" size: 17]} context:nil].size;
    self.titleLFrame = (CGRect){10, CGRectGetMaxY(self.typeLFrame)+7.5, textSize};
    self.shareLFrame = CGRectMake(ScreenWidth-30-24, CGRectGetMaxY(self.titleLFrame)+13, 24, 12);
    self.shareBFrame = CGRectMake(self.shareLFrame.origin.x-8-16, CGRectGetMaxY(self.shareLFrame)-CGRectGetHeight(self.shareLFrame)/2-8, 16, 16);
    self.cellOneHeight = CGRectGetMaxY(self.shareBFrame)+10;
    
    
}
@end

