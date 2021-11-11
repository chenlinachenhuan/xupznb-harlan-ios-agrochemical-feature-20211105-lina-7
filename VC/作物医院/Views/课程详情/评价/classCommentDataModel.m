//
//  classCommentDataModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/28.
//

#import "classCommentDataModel.h"
 @implementation classCommentDataModel
-(id)init{
    if (self==[super init]) {
        
     }
    return self;
}
 

-(CGFloat)setCommentFrames:(classCommentModel*)commentModel{
    self.commentHeadImageFrame = CGRectMake(16, 21.5, 31, 31);
    self.commentNameFrame = CGRectMake(CGRectGetMaxX(self.commentHeadImageFrame)+12, 22, [commonMethod widthAuto:commentModel.nameStr fontSize:15 contentheight:14], 14);
    self.commentDateFrame = CGRectMake(CGRectGetMaxX(self.commentHeadImageFrame)+12, CGRectGetMaxY(self.commentNameFrame)+7, [commonMethod widthAuto:commentModel.dateStr fontSize:10 contentheight:8], 8);
    self.commentScoreFrame = CGRectMake(ScreenWidth-16-91, CGRectGetMaxY(self.commentHeadImageFrame)-15.5-7.5, 15, 15);
    CGSize textSize = CGSizeMake(0, 0);
    if (commentModel.textStr.length>0) {
        textSize = [commentModel.textStr boundingRectWithSize:CGSizeMake(ScreenWidth-32, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 14]} context:nil].size;
        self.commentTextFrame = (CGRect){{16,CGRectGetMaxY(self.commentHeadImageFrame)+13.5},textSize};
        self.commentCellHeight = CGRectGetMaxY(self.commentTextFrame)+18;
    }else{
        self.commentTextFrame = (CGRect){{16,CGRectGetMaxY(self.commentHeadImageFrame)+21.5},textSize};
        self.commentCellHeight = CGRectGetMaxY(self.commentTextFrame);
    }
     
    return _commentCellHeight;;
}
 
@end
