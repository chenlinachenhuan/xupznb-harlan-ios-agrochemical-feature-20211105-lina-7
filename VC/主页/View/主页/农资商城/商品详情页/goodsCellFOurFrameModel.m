//
//  goodsCellFOurFrameModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/13.
//

#import "goodsCellFOurFrameModel.h"

@implementation goodsCellFOurFrameModel
-(void)setCellFOurFrames:(goodsDetailModel*)textModel{
    self.imageVFrame = CGRectMake(10, 18, 48, 48);
    CGSize nameSize = [commonMethod sizeWithText:textModel.storeNameStr sizeWithWidth:ScreenWidth-(CGRectGetMaxX(self.imageVFrame)+12+104) sizeWithFont:[UIFont fontWithName:@"PingFang SC Medium" size:17]];
    self.storeNameFrame =(CGRect){CGRectGetMaxX(self.imageVFrame)+12, CGRectGetMaxY(self.imageVFrame)-CGRectGetHeight(self.imageVFrame)/2-nameSize.height/2,nameSize};
    self.scoreL1Frame = CGRectMake(ScreenWidth-10-28-[commonMethod widthAuto:[NSString stringWithFormat:@"卖家服务 %@",textModel.score1Str] fontSize:10 contentheight:10], CGRectGetMaxY(self.imageVFrame)-CGRectGetHeight(self.imageVFrame)/2-3.5-10, [commonMethod widthAuto:[NSString stringWithFormat:@"卖家服务 %@",textModel.score1Str] fontSize:10 contentheight:10], 10);
    self.scoreL2Frame = CGRectMake(ScreenWidth-10-28-[commonMethod widthAuto:[NSString stringWithFormat:@"物流服务 %@",textModel.score2Str] fontSize:10 contentheight:10], CGRectGetMaxY(self.scoreL1Frame)+7, [commonMethod widthAuto:[NSString stringWithFormat:@"物流服务 %@",textModel.score2Str] fontSize:10 contentheight:10], 10);
    self.newGoodsLFrame = CGRectMake((ScreenWidth-20)/2-[commonMethod widthAuto:textModel.newgoodsStr fontSize:15 contentheight:11]/2, CGRectGetMaxY(self.imageVFrame)+25, [commonMethod widthAuto:textModel.newgoodsStr fontSize:15 contentheight:11], 11);
    self.label1Frame = CGRectMake((ScreenWidth-20)/2-25, CGRectGetMaxY(self.newGoodsLFrame)+7.5, 50, 11.5);
    self.allGoodsLFrame = CGRectMake(self.newGoodsLFrame.origin.x-ScreenWidth*0.24666667-[commonMethod widthAuto:textModel.allGoodsStr fontSize:15 contentheight:11], self.newGoodsLFrame.origin.y, [commonMethod widthAuto:textModel.allGoodsStr fontSize:15 contentheight:11], 11);
    self.label2Frame = CGRectMake(CGRectGetMaxX(self.allGoodsLFrame)-CGRectGetWidth(self.allGoodsLFrame)/2-25, self.label1Frame.origin.y, 50, 11.5);
    self.collectionLFrame = CGRectMake(CGRectGetMaxX(self.newGoodsLFrame)+0.2466667*ScreenWidth, self.newGoodsLFrame.origin.y, [commonMethod widthAuto:textModel.collectionStr fontSize:15 contentheight:12.5], 12.5);
    self.label3Frame = CGRectMake(CGRectGetMaxX(self.collectionLFrame)-CGRectGetWidth(self.collectionLFrame)/2-25, self.label2Frame.origin.y, 50, 11.5);
    self.sortButtonFrame = CGRectMake((ScreenWidth-20)/2-0.0666667*ScreenWidth-74, CGRectGetMaxY(self.label1Frame)+27.5, 74, 28);
    self.goToButtonFrame = CGRectMake((ScreenWidth-20)/2+0.0666667*ScreenWidth, self.sortButtonFrame.origin.y, 74, 28);
    self.cellHeight = CGRectGetMaxY(self.goToButtonFrame)+15;
}
@end
