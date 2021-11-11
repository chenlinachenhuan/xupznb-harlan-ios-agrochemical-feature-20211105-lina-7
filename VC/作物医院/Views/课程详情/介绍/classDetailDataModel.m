//
//  classDetailDataModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/27.
//

#import "classDetailDataModel.h"
@implementation classDetailDataModel
-(id)init{
    if (self==[super init]) {
        self.isShow  = NO;
//         [self getCalculateData];
//        [self setIntroduceFrames];
    }
    return self;
}
-(void)setModel:(classDetailIntroduceModel *)model{
    _model = model;
    CGSize textSize = [[NSString stringWithFormat:@"独家  %@",self.model.title] boundingRectWithSize:CGSizeMake(ScreenWidth-32, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 17]} context:nil].size;
    self.titleFrame = (CGRect){{16,17.5},textSize};
    self.commentNumberImageFrame = CGRectMake(16, CGRectGetMaxY(self.titleFrame)+12, 91, 15);
    self.commentNumberFrame = CGRectMake(CGRectGetMaxX(self.commentNumberImageFrame)+12, CGRectGetMaxY(self.titleFrame)+12, [commonMethod widthAuto:@"暂无评分" fontSize:15 contentheight:15], 15);
    self.viewsFrame = CGRectMake(ScreenWidth-16-[commonMethod widthAuto:[NSString stringWithFormat:@"%@已加入学习",self.model.viewNum] fontSize:12 contentheight:11.5], CGRectGetMaxY(self.titleFrame)+15.5, [commonMethod widthAuto:[NSString stringWithFormat:@"%@已加入学习",self.model.viewNum] fontSize:12 contentheight:11.5], 11.5);
    self.moneyFrame = CGRectMake(16, CGRectGetMaxY(self.commentNumberImageFrame)+24, [commonMethod widthAuto:@"¥" fontSize:18 contentheight:22.5], 22.5);
    self.moneyFrame1 = CGRectMake(CGRectGetMaxX(self.moneyFrame), CGRectGetMaxY(self.commentNumberImageFrame)+20, [commonMethod widthAuto:[NSString stringWithFormat:@"%@",self.model.mallPrice] fontSize:30 contentheight:22.5], 22.5);
    self.cellOneFrame = CGRectMake(0, 0, ScreenWidth, CGRectGetMaxY(self.moneyFrame1)+17);
    
    self.headerImageFrame = CGRectMake(16, 12, 74, 74);
    self.nameFrame = CGRectMake(CGRectGetMaxX(self.headerImageFrame)+17, 11.5, [commonMethod widthAuto:self.model.proficientName fontSize:17 contentheight:16.5], 16.5);
    self.cellTwoImageOneFrame = CGRectMake(CGRectGetMaxX(self.nameFrame)+12, 12, 16, 16);
    self.cellTwoImageTwoFrame = CGRectMake(CGRectGetMaxX(self.cellTwoImageOneFrame)+8, 12, 16, 16);
    self.cellTwoImageThreeFrame = CGRectMake(CGRectGetMaxX(self.cellTwoImageTwoFrame)+8, 12, 16, 16);
    if (_isShow==YES) {
        CGSize introduceSize = [self.model.proficientContent boundingRectWithSize:CGSizeMake(ScreenWidth-CGRectGetMaxX(self.headerImageFrame)-34, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 14]} context:nil].size;
        self.introduceFrame = (CGRect){{CGRectGetMaxX(self.headerImageFrame)+17,CGRectGetMaxY(self.nameFrame)+9.5},introduceSize};
    }else{
        self.introduceFrame = CGRectMake(CGRectGetMaxX(self.headerImageFrame)+17, CGRectGetMaxY(self.nameFrame)+9.5, ScreenWidth-CGRectGetMaxX(self.headerImageFrame)-34, 60);
    }
    
   
    self.cellTwoFrame = CGRectMake(0, CGRectGetMaxY(self.cellOneFrame)+8, ScreenWidth, CGRectGetMaxY(self.introduceFrame)+12);
    
    self.cellThreeOneTextFrame = CGRectMake(16, 14, [commonMethod widthAuto:@"适用人群" fontSize:12 contentheight:11.5], 11.5);
    self.cellThreeTwoTextFrame = CGRectMake(16, CGRectGetMaxY(self.cellThreeOneTextFrame)+13, [commonMethod widthAuto:self.model.suitable fontSize:14 contentheight:13], 13);
    self.cellThreeFrame = CGRectMake(0, CGRectGetMaxY(self.cellTwoFrame)+8, ScreenWidth, CGRectGetMaxY(self.cellThreeTwoTextFrame)+12.5);
    
    self.cellFourOneTextFrame = CGRectMake(16, 14, [commonMethod widthAuto:@"课程简介" fontSize:12 contentheight:11.5], 11.5);
    CGSize textSize1 = [self.model.remark boundingRectWithSize:CGSizeMake(ScreenWidth-32, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 14]} context:nil].size;
    self.cellFourTwoTextFrame = (CGRect){{16,CGRectGetMaxY(self.cellFourOneTextFrame)+10.5},textSize1};
    self.cellFourFrame = CGRectMake(0, CGRectGetMaxY(self.cellThreeFrame)+8, ScreenWidth, CGRectGetMaxY(self.cellFourTwoTextFrame)+12);
    self.cellHeight = CGRectGetMaxY(self.cellFourFrame);
}
#pragma mark拿到数据
//-(void)getCalculateData{
//    self.model = [[classDetailIntroduceModel alloc] initWithData:[[NSDictionary alloc]init]];
//
//
//}
//
//-(void)setIntroduceFrames{
//    CGSize textSize = [self.model.titleStr boundingRectWithSize:CGSizeMake(ScreenWidth-32, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 17]} context:nil].size;
//    self.titleFrame = (CGRect){{16,17.5},textSize};
//    self.commentNumberImageFrame = CGRectMake(16, CGRectGetMaxY(self.titleFrame)+12, 91, 15);
//    self.commentNumberFrame = CGRectMake(CGRectGetMaxX(self.commentNumberImageFrame)+12, CGRectGetMaxY(self.titleFrame)+12, [commonMethod widthAuto:@"暂无评分" fontSize:15 contentheight:15], 15);
//    self.viewsFrame = CGRectMake(ScreenWidth-16-[commonMethod widthAuto:self.model.viewsStr fontSize:12 contentheight:11.5], CGRectGetMaxY(self.titleFrame)+15.5, [commonMethod widthAuto:self.model.viewsStr fontSize:12 contentheight:11.5], 11.5);
//    self.moneyFrame = CGRectMake(16, CGRectGetMaxY(self.commentNumberImageFrame)+24, [commonMethod widthAuto:@"¥" fontSize:18 contentheight:22.5], 22.5);
//    self.moneyFrame1 = CGRectMake(CGRectGetMaxX(self.moneyFrame), CGRectGetMaxY(self.commentNumberImageFrame)+20, [commonMethod widthAuto:self.model.moneyStr fontSize:30 contentheight:22.5], 22.5);
//    self.cellOneFrame = CGRectMake(0, 0, ScreenWidth, CGRectGetMaxY(self.moneyFrame1)+17);
//
//    self.headerImageFrame = CGRectMake(16, 12, 74, 74);
//    self.nameFrame = CGRectMake(CGRectGetMaxX(self.headerImageFrame)+17, 11.5, [commonMethod widthAuto:self.model.nameStr fontSize:17 contentheight:16.5], 16.5);
//    self.cellTwoImageOneFrame = CGRectMake(CGRectGetMaxX(self.nameFrame)+12, 12, 16, 16);
//    self.cellTwoImageTwoFrame = CGRectMake(CGRectGetMaxX(self.cellTwoImageOneFrame)+8, 12, 16, 16);
//    self.cellTwoImageThreeFrame = CGRectMake(CGRectGetMaxX(self.cellTwoImageTwoFrame)+8, 12, 16, 16);
//    if (_isShow==YES) {
//        CGSize introduceSize = [self.model.introduceStr boundingRectWithSize:CGSizeMake(ScreenWidth-CGRectGetMaxX(self.headerImageFrame)-34, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 14]} context:nil].size;
//        self.introduceFrame = (CGRect){{CGRectGetMaxX(self.headerImageFrame)+17,CGRectGetMaxY(self.nameFrame)+9.5},introduceSize};
//    }else{
//        self.introduceFrame = CGRectMake(CGRectGetMaxX(self.headerImageFrame)+17, CGRectGetMaxY(self.nameFrame)+9.5, ScreenWidth-CGRectGetMaxX(self.headerImageFrame)-34, 60);
//    }
//
//
//    self.cellTwoFrame = CGRectMake(0, CGRectGetMaxY(self.cellOneFrame)+8, ScreenWidth, CGRectGetMaxY(self.introduceFrame)+12);
//
//    self.cellThreeOneTextFrame = CGRectMake(16, 14, [commonMethod widthAuto:@"适用人群" fontSize:12 contentheight:11.5], 11.5);
//    self.cellThreeTwoTextFrame = CGRectMake(16, CGRectGetMaxY(self.cellThreeOneTextFrame)+13, [commonMethod widthAuto:self.model.typeStr fontSize:14 contentheight:13], 13);
//    self.cellThreeFrame = CGRectMake(0, CGRectGetMaxY(self.cellTwoFrame)+8, ScreenWidth, CGRectGetMaxY(self.cellThreeTwoTextFrame)+12.5);
//
//    self.cellFourOneTextFrame = CGRectMake(16, 14, [commonMethod widthAuto:@"课程简介" fontSize:12 contentheight:11.5], 11.5);
//    CGSize textSize1 = [self.model.classIntroduceStr boundingRectWithSize:CGSizeMake(ScreenWidth-32, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 14]} context:nil].size;
//    self.cellFourTwoTextFrame = (CGRect){{16,CGRectGetMaxY(self.cellFourOneTextFrame)+10.5},textSize1};
//    self.cellFourFrame = CGRectMake(0, CGRectGetMaxY(self.cellThreeFrame)+8, ScreenWidth, CGRectGetMaxY(self.cellFourTwoTextFrame)+12);
//    self.cellHeight = CGRectGetMaxY(self.cellFourFrame);
// }
-(void)setIsShow:(BOOL)isShow{
    _isShow = isShow;
    if (_isShow==YES) {
        [self setModel:self.model];
    }
}
//-(CGFloat)setCommentFrames:(classCommentModel*)commentModel{
//    self.commentHeadImageFrame = CGRectMake(16, 21.5, 31, 31);
//    self.commentNameFrame = CGRectMake(CGRectGetMaxX(self.commentHeadImageFrame)+12, 22, [self widthAuto:commentModel.nameStr fontSize:15 contentheight:14], 14);
//    self.commentDateFrame = CGRectMake(CGRectGetMaxX(self.commentHeadImageFrame)+12, CGRectGetMaxY(self.commentNameFrame)+7, [self widthAuto:commentModel.dateStr fontSize:10 contentheight:8], 8);
//    self.commentScoreFrame = CGRectMake(ScreenWidth-16-91, CGRectGetMaxY(self.commentHeadImageFrame)-15.5-7.5, 15, 15);
//    CGSize textSize = [commentModel.textStr boundingRectWithSize:CGSizeMake(ScreenWidth-32, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 14]} context:nil].size;
//    self.commentTextFrame = (CGRect){{16,CGRectGetMaxY(self.commentHeadImageFrame)+13.5},textSize};
//    self.commentCellHeight = CGRectGetMaxY(self.commentTextFrame)+18;
//    return _commentCellHeight;;
//}
 
@end
