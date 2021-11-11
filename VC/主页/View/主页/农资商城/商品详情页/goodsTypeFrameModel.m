//
//  goodsTypeFrameModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/14.
//

#import "goodsTypeFrameModel.h"

@implementation goodsTypeFrameModel
//-(id)init{
//    if (self ==[super init]) {
//
//    }
//    return self;
//}
-(void)setTypeViewFrames:(goodTypeTextModel*)textModel {
    
    self.imageVFrame = CGRectMake(16, 14, 58, 58);
    self.label1Frame = CGRectMake(CGRectGetMaxX(self.imageVFrame)+12, CGRectGetMaxY(self.imageVFrame)-CGRectGetHeight(self.imageVFrame)/2-4.5, 7.5, 9);
    self.moneyLFrame = CGRectMake(CGRectGetMaxX(self.label1Frame)+4, CGRectGetMaxY(self.imageVFrame)-CGRectGetHeight(self.imageVFrame)/2-8.5, [commonMethod widthAuto:textModel.moneyStr fontSize:22 contentheight:17], 17);
    self.removeButtonFrame = CGRectMake(ScreenWidth-16.5-14, 25, 14, 14);
    self.typeLFrame = CGRectMake(16.5, 0, [commonMethod widthAuto:textModel.typeStr fontSize:15 contentheight:14], 14);
    
    self.typeScrollViewFrame = CGRectMake(0, CGRectGetMaxY(self.imageVFrame)+10, ScreenWidth, _maxTypeScrollViewHeight-55.5-CGRectGetMaxY(self.imageVFrame)+10);
//    self.typeVFrame = CGRectMake(0, CGRectGetMaxY(self.typeLFrame)+11, ScreenWidth, <#CGFloat height#>)
}
@end
