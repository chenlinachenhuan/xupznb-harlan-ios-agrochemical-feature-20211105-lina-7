//
//  trendDetailDataModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/26.
//

#import "trendDetailDataModel.h"

@implementation trendDetailDataModel
- (void)setMoment:(trendModel *)moment{
    _moment = moment;
    //计算主体Frame
    [self setMomentsBodyFrames];
//    计算工具条Frame
    [self setMomentsToolBarFrames];
    //计算CellHeight
    [self setCommentHeaderFrames];
}
//计算Code圈主体Frame
- (void)setMomentsBodyFrames{
    //头像
    CGFloat iconX = 19.5;
    CGFloat iconY = 19.5;
    CGFloat iconW = 0.090379*ScreenWidth;
    CGFloat iconH = 0.090379*ScreenWidth;
    self.bodyIconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    //昵称
    CGFloat nameX = iconW + iconX + 8.5;
    CGFloat nameY = 17.5;
    //    CGFloat nameW = 120;
    CGSize nameSize = CGSizeMake([commonMethod widthAuto:_moment.nameStr fontSize:15 contentheight:14.5], 14.5);
    
    self.bodyNameFrame = (CGRect){{nameX,nameY},nameSize};
    
    //时间
    CGFloat timeX = nameX;
    CGFloat timeY = CGRectGetMaxY(self.bodyNameFrame) + 8;
    CGSize timeSize = CGSizeMake([commonMethod widthAuto:[NSString stringWithFormat:@"%@ %@人阅读",self.moment.pubTime,self.moment.viewNum] fontSize:12 contentheight:11], 11);
//    [self.moment.viewsStr boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 12]} context:nil].size;
    self.bodyTimeFrame = (CGRect){{timeX,timeY},timeSize};
    
    //删除Button
    CGFloat removeButtonX = CGRectGetMaxX(self.bodyTimeFrame)+8.5;
    CGFloat removeButtonY = timeY;
    CGSize removeButtonSize = CGSizeMake([commonMethod widthAuto:@"删除" fontSize:12 contentheight:11], 11);
 
    self.bodyRemoveButtonFrame = (CGRect){{removeButtonX,removeButtonY},removeButtonSize};
    //收藏Button
    CGFloat collectButtonX = ScreenWidth-16-0.048*ScreenWidth;
    CGFloat collectButtonY = CGRectGetMaxY(self.bodyIconFrame)-CGRectGetHeight(self.bodyIconFrame)/2-0.048*ScreenWidth*0.5;
    CGSize collectButtonSize = CGSizeMake(0.048*ScreenWidth, 0.048*ScreenWidth);
 
    self.bodycollectButtonFrame = (CGRect){{collectButtonX,collectButtonY},collectButtonSize};
    //标题
//    CGFloat titleX = 16.5;
//    CGFloat titleY = CGRectGetMaxY(self.bodyIconFrame) + 18;
// 
//    CGSize titleSize =[commonMethod sizeWithText:self.moment.titleStr sizeWithWidth:ScreenWidth-72 sizeWithFont:FontSize(15)];
//    
//    self.bodyTitleFrame = (CGRect){{titleX,titleY},titleSize};
    
    //正文
    CGFloat textX = 16;
    CGFloat textY = CGRectGetMaxY(self.bodyIconFrame) + 10;
    CGFloat textW = circleCellWidth;
    CGSize textSize = [self.moment.textStr boundingRectWithSize:CGSizeMake(textW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 14]} context:nil].size;
    self.bodyTextFrame = (CGRect){{textX,textY},textSize};
    CGFloat bodyH;
   //图片 (判断是否有图片)
   if ([_moment.imageArr  count] != 0) {
       if (_moment.imageArr.count==1) {
           CGFloat photosX = 14;
           CGFloat photosY = CGRectGetMaxY(self.bodyTextFrame) + 16;
           CGFloat photosW = ScreenWidth*0.464;
           CGFloat photosH = ScreenWidth*0.464*4/3;
           self.bodyPhotoFrame = CGRectMake(photosX, photosY, photosW, photosH);
       }else if (_moment.imageArr.count==2){
           CGFloat photosX = 14;
           CGFloat photosY = CGRectGetMaxY(self.bodyTextFrame) + 16;
           CGFloat photosW =ScreenWidth-32-28  ;
           CGFloat photosH = (ScreenWidth-32-28 -3)/2;
           self.bodyPhotoFrame = CGRectMake(photosX, photosY, photosW, photosH);
       }else if (_moment.imageArr.count==3){
           CGFloat photosX = 14;
           CGFloat photosY = CGRectGetMaxY(self.bodyTextFrame) + 16;
           CGFloat photosW =ScreenWidth-32-28  ;
           CGFloat photosH = (ScreenWidth-32-28 -3)/3;
           self.bodyPhotoFrame = CGRectMake(photosX, photosY, photosW, photosH);
       }else if (_moment.imageArr.count>3&&_moment.imageArr.count<=6){
           CGFloat photosX = 14;
           CGFloat photosY = CGRectGetMaxY(self.bodyTextFrame) + 16;
           CGFloat photosW =ScreenWidth-32-28  ;
           CGFloat photosH = 2*(ScreenWidth-32-28 -3)/3+3;
           self.bodyPhotoFrame = CGRectMake(photosX, photosY, photosW, photosH);
       }else if (_moment.imageArr.count>6&&_moment.imageArr.count<=9){
           CGFloat photosX = 14;
           CGFloat photosY = CGRectGetMaxY(self.bodyTextFrame) + 16;
           CGFloat photosW =ScreenWidth-32-28  ;
           CGFloat photosH = 3*(ScreenWidth-32-28 -3)/3+3*2;
           self.bodyPhotoFrame = CGRectMake(photosX, photosY, photosW, photosH);
       }
       
       //主体frame
        bodyH = CGRectGetMaxY(self.bodyPhotoFrame) ;
    }else{
       //主体frame
        bodyH = CGRectGetMaxY(self.bodyTextFrame);
        if ([self.moment.typeId intValue]==2) {
            
            CGFloat photosX = 14;
            CGFloat photosY = CGRectGetMaxY(self.bodyTextFrame) + 16;
            CGFloat photosW = ScreenWidth*0.464;
            bodyH = CGRectGetMaxY(self.bodyTextFrame)+ScreenWidth*0.464*4/3+10;
            self.bodyPhotoFrame = CGRectMake(photosX, photosY, photosW, ScreenWidth*0.464*4/3);
        }
     }
//
//    CGFloat commentX = 16.5;
//    CGFloat commentY = CGRectGetMaxY(self.momentsBodyFrame) + 19;
//    CGSize commentSize = CGSizeMake([self widthAuto:self.moment.commentTitleStr fontSize:15 contentheight:14],14);
//    self.toolCommentFrame = (CGRect){{commentX,commentY},commentSize};
//    //点赞
//    CGFloat likeX = ScreenWidth/2-40;
//    CGFloat likeY = CGRectGetMaxY(self.momentsBodyFrame) + 17.5;
//    CGSize likeSize = CGSizeMake(80, ScreenWidth*0.0426666667);
//    self.toolLikeFrame = (CGRect){{likeX,likeY},likeSize};
//    //转发
//    //获取文字的长度
////    NSDictionary *attributes = @{NSFontAttributeName:[UIFont fontWithName:@"PingFang SC" size:12]};
////    CGFloat length = [self.moment.forwordStr boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.width;
//    CGFloat forwordX = ScreenWidth-16-80;
//    CGFloat forwordY = CGRectGetMaxY(self.momentsBodyFrame) + 17.5;
//    CGSize forwordSize = CGSizeMake(80, ScreenWidth*0.0426666667);
//    self.toolForwardFrame = (CGRect){{forwordX,forwordY},forwordSize};
     self.momentsBodyFrame = CGRectMake(0, 0, ScreenWidth, bodyH);
}

//计算Code圈工具条Frame
- (void)setMomentsToolBarFrames{
    //评论
    CGFloat commentX = 16.5;
    CGFloat commentY = 0;
    CGSize commentSize = CGSizeMake([commonMethod widthAuto: [NSString stringWithFormat:@"共%@条评论",self.moment.commentTitleStr] fontSize:15 contentheight:14],14);
    self.toolCommentFrame = (CGRect){{commentX,commentY},commentSize};
    
    NSDictionary *attributes = @{NSFontAttributeName:FontSize(12)};
    //转发
    
    CGFloat length1 = [self.moment.forwordStr boundingRectWithSize:CGSizeMake(MAXFLOAT, 16) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.width;
    CGFloat forwordX = ScreenWidth-16-length1-8.5-16;
    CGFloat forwordY = 0;
    CGSize forwordSize = CGSizeMake(length1+8.5+16, 16);
    self.toolForwardFrame = (CGRect){{forwordX,forwordY},forwordSize};
     //点赞
    CGFloat length = [self.moment.likeStr boundingRectWithSize:CGSizeMake(MAXFLOAT, 16) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.width;
    CGFloat likeX =  forwordX-length-8.5-16-30;
    CGFloat likeY = 0;
    CGSize likeSize = CGSizeMake(length+8.5+16, 16);
    self.toolLikeFrame = (CGRect){{likeX,likeY},likeSize};
    self.momentsToolBarFrame = CGRectMake(0, CGRectGetMaxY(self.momentsBodyFrame)+20, ScreenWidth, CGRectGetHeight(self.toolForwardFrame));

    
    
}

- (void)setCommentHeaderFrames{
    self.detailReportButtonFrame = CGRectMake(ScreenWidth-25-0.0426666667*ScreenWidth, 20+CGRectGetHeight(self.bodyIconFrame)/2-0.0426666667*ScreenWidth*0.5, 0.0426666667*ScreenWidth, 0.0426666667*ScreenWidth);
    self.detailCommentButtonFrame = CGRectMake(CGRectGetMaxX(self.detailReportButtonFrame)-23-0.0426666667*ScreenWidth*2, 20+CGRectGetHeight(self.bodyIconFrame)/2-0.0426666667*ScreenWidth*0.5, 0.0426666667*ScreenWidth, 0.0426666667*ScreenWidth);
    CGSize textSize = [self.moment.textStr boundingRectWithSize:CGSizeMake(ScreenWidth-32, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 14]} context:nil].size;
    self.detailCommentTextFrame = CGRectMake(16, CGRectGetMaxY(self.bodyIconFrame)+13.5, textSize.width, textSize.height);
    self.detailShowCommentButtonFrame = CGRectMake(16, CGRectGetMaxY(self.detailCommentTextFrame )+10, [commonMethod widthAuto:@"查看回复" fontSize:12 contentheight:12], 12);
    self.commentHeaderFrame = CGRectMake(0, CGRectGetMaxY(self.momentsToolBarFrame)+14, ScreenWidth, CGRectGetMaxY(self.detailShowCommentButtonFrame)+20);
    
}
 
@end
