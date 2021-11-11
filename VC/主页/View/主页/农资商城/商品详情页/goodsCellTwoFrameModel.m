//
//  goodsCellTwoFrameModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/12.
//

#import "goodsCellTwoFrameModel.h"
#import "productSKUModel.h"
#import "guaranteeBaseListModel.h"
@implementation goodsCellTwoFrameModel
-(void)setGoodsTwoCellFrams:(productDetailModel*)textModel{
    productSKUModel * model = textModel.typeArr[0];
    self.label1Frame = CGRectMake(10, 18, 30, 13);
    self.typeLFrame = CGRectMake(CGRectGetMaxX(self.label1Frame)+20, 18, [commonMethod widthAuto:model.spec1Val fontSize:14 contentheight:13.5], 13.5);
    self.button1Frame = CGRectMake(ScreenWidth-30-14, CGRectGetMaxY(self.typeLFrame)-CGRectGetHeight(self.typeLFrame)/2-1.5, 14, 3);
    self.typeTextLFrame = CGRectMake(CGRectGetMaxX(self.typeLFrame)+15.5, 18, ScreenWidth-(CGRectGetMaxX(self.typeLFrame)+15.5)-CGRectGetWidth(self.button1Frame)-10-20, 13.5);
    self.typeVFrame = CGRectMake(self.typeLFrame.origin.x, CGRectGetMaxY(self.typeLFrame)+10, ScreenWidth-self.typeLFrame.origin.x-30, 30);
    self.label2Frame = CGRectMake(10, CGRectGetMaxY(self.typeVFrame)+20, 30, 13.5);
    self.addressLFrame = CGRectMake(CGRectGetMaxX(self.label2Frame)+20, self.label2Frame.origin.y, [commonMethod widthAuto:textModel.departure fontSize:14 contentheight:13], 13);
    self.lineLFrame = CGRectMake(CGRectGetMaxX(self.addressLFrame)+15.5, self.label2Frame.origin.y+2, 1, 12);
    self.edFrame = CGRectMake(CGRectGetMaxX(self.lineLFrame)+15.5, self.label2Frame.origin.y, [commonMethod widthAuto:[NSString stringWithFormat:@"快递:%@",model.freight] fontSize:14 contentheight:13], 13);
    self.button2Frame = CGRectMake(self.button1Frame.origin.x, CGRectGetMaxY(self.label2Frame)-CGRectGetHeight(self.label2Frame)/2-1.5, 14, 3);
    self.label3Frame = CGRectMake(10, CGRectGetMaxY(self.label2Frame)+20, 30, 13.5);
    NSMutableArray * arr = [[NSMutableArray alloc] init];
    for (guaranteeBaseListModel * model in textModel.guaranteeBaseList) {
        [arr addObject:model.dictValue];
    }
    NSString * ensureStr = [arr componentsJoinedByString:@" · "];

    CGSize textSize = [ensureStr boundingRectWithSize:CGSizeMake(ScreenWidth-self.addressLFrame.origin.x-20-20-14, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 14]} context:nil].size;
    
    self.ensureFrame = (CGRect){self.addressLFrame.origin.x, self.label3Frame.origin.y-2.5, textSize};
    self.button3Frame = CGRectMake(self.button2Frame.origin.x, CGRectGetMaxY(self.label3Frame)-CGRectGetHeight(self.label3Frame)/2-1.5, 14, 3);
    self.label4Frame = CGRectMake(self.label3Frame.origin.x, CGRectGetMaxY(self.ensureFrame)+20, 30, 13.5);
    self.parameterFrame = CGRectMake(self.ensureFrame.origin.x, self.label4Frame.origin.y, CGRectGetWidth(self.ensureFrame), 13.5);
    self.button4Frame = CGRectMake(self.button3Frame.origin.x, CGRectGetMaxY(self.label4Frame)-CGRectGetHeight(self.label4Frame)/2-1.5, 14, 3);
    
    self.cellTwoHeight = CGRectGetMaxY(self.parameterFrame)+23.5;
}
@end
