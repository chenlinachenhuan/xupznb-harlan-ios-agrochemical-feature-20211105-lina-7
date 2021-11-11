//
//  trendCommentTwoFrameModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/11.
//

#import "trendCommentTwoFrameModel.h"

@implementation trendCommentTwoFrameModel
-(void)setModel:(trendTwoCommentModel *)model{
    _model=model;
    CGSize textSize = [commonMethod sizeWithText:[NSString stringWithFormat:@"%@ %@",model.nameStr,model.textStr] sizeWithWidth:ScreenWidth-17.5*2 sizeWithFont:FontSize(14)];
    //
        self.nameAndTextFrame = (CGRect){17.5, 0, textSize};
        self.cellHeight = textSize.height;
}
//-(void)setTowCommentFrames:(trendTwoCommentModel*)model{
//    CGSize textSize = [commonMethod sizeWithText:[NSString stringWithFormat:@"%@ %@",model.nameStr,model.textStr] sizeWithWidth:ScreenWidth-17.5*2 sizeWithFont:FontSize(14)];
//
//    self.nameAndTextFrame = (CGRect){17.5, 0, textSize};
//    self.cellHeight = textSize.height;
//}
@end
