//
//  classContentViewDataModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/8.
//

#import "classContentViewDataModel.h"

@implementation classContentViewDataModel
-(void)setContentFrames:(classContentModel*)contentModel{
    NSString*textStr = [NSString stringWithFormat:@"%@%@",contentModel.fileType,contentModel.title];
    CGSize textSize = [textStr boundingRectWithSize:CGSizeMake(ScreenWidth-80, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 14]} context:nil].size;
    
    
    self.contentTextFrame = (CGRect){16,10,textSize.width+39,textSize.height};
    self.contentCellHeight = textSize.height+20;
//    NSString * str = contentModel.isLock==YES?@"可试看":@"";
    self.LockTextFrame = CGRectMake(ScreenWidth-17-[commonMethod widthAuto:@"可试看" fontSize:12 contentheight:12], self.contentCellHeight/2-6, [commonMethod widthAuto:@"可试看" fontSize:12 contentheight:12], 12);
    self.LockImageVFrame = CGRectMake(ScreenWidth-32, self.contentCellHeight/2-8, 16, 16);
     
}
@end
