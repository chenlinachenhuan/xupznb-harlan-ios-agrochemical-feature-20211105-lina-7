//
//  newsCommentFrameModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/18.
//

#import "newsCommentFrameModel.h"

@implementation newsCommentFrameModel
-(CGFloat)setCommentFrames:(newsCommentListTextModel*)commentModel{
    self.commentHeadImageFrame = CGRectMake(19.5, 20.5, 31, 31);
    self.commentNameFrame = CGRectMake(CGRectGetMaxX(self.commentHeadImageFrame)+12, 21, [commonMethod widthAuto:commentModel.nickname fontSize:15 contentheight:14], 14);
    self.commentDateFrame = CGRectMake(CGRectGetMaxX(self.commentHeadImageFrame)+12, CGRectGetMaxY(self.commentNameFrame)+7, [commonMethod widthAuto:[NSString stringWithFormat:@"%@",commentModel.pubTimeOffsetDesc] fontSize:10 contentheight:11], 11);
    self.reportButtonFrame = CGRectMake(ScreenWidth-16-25, CGRectGetMaxY(self.commentHeadImageFrame)-15.5-8, 16, 16);
    self.commentButtonFrame = CGRectMake(self.reportButtonFrame.origin.x-23-16-[commonMethod widthAuto:[NSString stringWithFormat:@"%@",commentModel.fabulousNum] fontSize:12 contentheight:10]-8, CGRectGetMaxY(self.commentHeadImageFrame)-15.5-8, [commonMethod widthAuto:[NSString stringWithFormat:@"%@",commentModel.fabulousNum] fontSize:12 contentheight:10]+8+16, 16);
    CGSize textSize = CGSizeMake(0, 0);
    textSize = [commentModel.content boundingRectWithSize:CGSizeMake(ScreenWidth-32, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 14]} context:nil].size;
    self.commentTextFrame = (CGRect){{16,CGRectGetMaxY(self.commentHeadImageFrame)+13.5},textSize};
    self.lineLFrame = CGRectMake(16.5 ,CGRectGetMaxY(self.commentTextFrame)+18, ScreenWidth-33, 0.5);
    self.commentCellHeight = CGRectGetMaxY(self.lineLFrame);
   
     
    return _commentCellHeight;;
}
@end
