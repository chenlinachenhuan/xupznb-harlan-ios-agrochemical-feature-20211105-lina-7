//
//  trendCommentDataModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/30.
//

#import "trendCommentDataModel.h"

@implementation trendCommentDataModel
-(id)init{
    if (self) {
        self.commentTwoArr = [[NSMutableArray alloc] init];
    }
    return self;
}
-(CGFloat)setCommentFrames:(trendCommentModel*)commentModel{
    self.commentHeadImageFrame = CGRectMake(19.5, 20.5, 31, 31);
    self.commentNameFrame = CGRectMake(CGRectGetMaxX(self.commentHeadImageFrame)+12, 21, [commonMethod widthAuto:commentModel.nameStr fontSize:15 contentheight:14], 14);
    self.commentDateFrame = CGRectMake(CGRectGetMaxX(self.commentHeadImageFrame)+12, CGRectGetMaxY(self.commentNameFrame)+7, [commonMethod widthAuto:commentModel.timeStr fontSize:10 contentheight:10], 10);
    self.reportButtonFrame = CGRectMake(ScreenWidth-16-25, CGRectGetMaxY(self.commentHeadImageFrame)-15.5-8, 16, 16);
    self.commentButtonFrame = CGRectMake(self.reportButtonFrame.origin.x-23-16, CGRectGetMaxY(self.commentHeadImageFrame)-15.5-8, 16, 16);
    CGSize textSize = CGSizeMake(0, 0);
    textSize = [commentModel.textStr boundingRectWithSize:CGSizeMake(ScreenWidth-32, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 14]} context:nil].size;
    self.commentTextFrame = (CGRect){{16,CGRectGetMaxY(self.commentHeadImageFrame)+13.5},textSize};
    self.moreButtonFrame = CGRectMake(17.5, CGRectGetMaxY(self.commentTextFrame)+10, [commonMethod widthAuto:@"展开回复" fontSize:12 contentheight:11.5], 11.5);
    self.commentCellHeight = CGRectGetMaxY(self.moreButtonFrame)+20;
   
     
    return _commentCellHeight;;
}
 
@end
