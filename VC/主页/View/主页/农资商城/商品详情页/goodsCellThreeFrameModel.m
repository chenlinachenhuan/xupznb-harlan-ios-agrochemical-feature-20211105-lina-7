//
//  goodsCellThreeFrameModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/13.
//

#import "goodsCellThreeFrameModel.h"

@implementation goodsCellThreeFrameModel
-(void)setCellThreeFrames:(goodsDetailCommentModel*)textModel{
    self.headImgVFrame = CGRectMake(10, 10, 38, 38);
    self.nameLFrame = CGRectMake(CGRectGetMaxX(self.headImgVFrame)+12, 15, [commonMethod widthAuto:textModel.nameStr fontSize:15 contentheight:14], 14);
    self.dateLFrame = CGRectMake(self.nameLFrame.origin.x, CGRectGetMaxY(self.nameLFrame)+7, [commonMethod widthAuto:textModel.dateStr fontSize:10 contentheight:8], 8);
    CGSize textSize = [commonMethod sizeWithText:textModel.textStr sizeWithWidth:ScreenWidth-40 sizeWithFont:FontSize(14)];
    self.textLFrame = (CGRect){10, CGRectGetMaxY(self.headImgVFrame)+13.5,textSize};
    CGSize typeSize = [commonMethod sizeWithText:textModel.typeStr sizeWithWidth:ScreenWidth-40 sizeWithFont:FontSize(12)];
    self.typeLFrame =(CGRect){10, CGRectGetMaxY(self.textLFrame)+10,typeSize};
    if (textModel.imageArr.count==0) {
        self.imageVFrame = CGRectZero;
        self.cellHeight = CGRectGetMaxY(self.typeLFrame)+14;
    }else{
        self.imageVFrame = CGRectMake(10, CGRectGetMaxY(self.typeLFrame)+14, ScreenWidth-40, (ScreenWidth-40-4*2)/3);
        self.cellHeight = CGRectGetMaxY(self.imageVFrame)+14;
    }
   
    
}
@end
