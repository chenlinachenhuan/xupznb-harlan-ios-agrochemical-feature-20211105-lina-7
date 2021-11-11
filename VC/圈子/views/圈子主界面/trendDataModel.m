//
//  trendDataModel.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/23.
//

#import "trendDataModel.h"

@implementation trendDataModel
- (void)setMoment:(trendModel *)moment{
    _moment = moment;
    //计算主体Frame
    [self setMomentsBodyFrames];
//    计算工具条Frame
//    [self setMomentsToolBarFrames];
    //计算CellHeight
    [self setCellHeight];
}
//计算Code圈主体Frame
- (void)setMomentsBodyFrames{
    //头像
    CGFloat iconX = 17.5;
    CGFloat iconY = 19.5;
    CGFloat iconW = 0.090379*ScreenWidth;
    CGFloat iconH = 0.090379*ScreenWidth;
    self.bodyIconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    //昵称
    CGFloat nameX = iconW + iconX + 8.5;
    CGFloat nameY = 17.5;
    //    CGFloat nameW = 120;
    CGSize nameSize = CGSizeMake([commonMethod widthAuto:self.moment.nameStr fontSize:15 contentheight:14.5], 14.5);
    
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
    CGFloat collectButtonX = ScreenWidth-16-29-0.048*ScreenWidth;
    CGFloat collectButtonY = CGRectGetMaxY(self.bodyIconFrame)-CGRectGetHeight(self.bodyIconFrame)/2-0.048*ScreenWidth*0.5;
    CGSize collectButtonSize = CGSizeMake(0.048*ScreenWidth, 0.048*ScreenWidth);
 
    self.bodycollectButtonFrame = (CGRect){{collectButtonX,collectButtonY},collectButtonSize};
//    //标题
//    CGFloat titleX = 14.5;
//    CGFloat titleY = CGRectGetMaxY(self.bodyIconFrame) + 18;
//    CGSize size = [commonMethod sizeWithText:self.moment.titleStr sizeWithWidth:ScreenWidth-72 sizeWithFont:FontSize(15)];
//    if (size.height<42) {
//        self.bodyTitleFrame = (CGRect){{titleX,titleY},size};
//    }else{
//        CGSize titleSize = CGSizeMake(ScreenWidth-48, 42);
//        self.bodyTitleFrame = (CGRect){{titleX,titleY},titleSize};
//    }
    
    
    //正文
    CGFloat textX = 14;
    CGFloat textY = CGRectGetMaxY(self.bodyIconFrame) + 10;
    CGFloat textW = circleCellWidth - 16 * 2;
    CGSize textSize = [self.moment.textStr boundingRectWithSize:CGSizeMake(textW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: FontSize(14)} context:nil].size;
    if (textSize.height<60) {
        self.bodyTextFrame = (CGRect){{textX,textY},textSize};

    }else{
        self.bodyTextFrame = (CGRect){{textX,textY},CGSizeMake(textW, 60)};

    }
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
    
    //评论
    CGFloat commentX = 20;
    CGFloat commentY = bodyH + 17.5;
    CGSize commentSize = CGSizeMake(80, ScreenWidth*0.0426666667);
    self.toolCommentFrame = (CGRect){{commentX,commentY},commentSize};
    //点赞
    CGFloat likeX = ScreenWidth/2-40;
    CGFloat likeY = bodyH + 17.5;
    CGSize likeSize = CGSizeMake(80, ScreenWidth*0.0426666667);
    self.toolLikeFrame = (CGRect){{likeX,likeY},likeSize};
    //转发
    CGFloat forwordX = ScreenWidth-16-14-80;
    CGFloat forwordY = bodyH + 17.5;
    CGSize forwordSize = CGSizeMake(80, ScreenWidth*0.0426666667);
    self.toolForwardFrame = (CGRect){{forwordX,forwordY},forwordSize};
    CGFloat toolBarX = 20.5;
    CGFloat toolBarY = CGRectGetMaxY(self.toolForwardFrame)+7;
    CGFloat toolBarW = circleCellWidth;
//    CGFloat toolBarH=20 ;
//    if (_moment.commentArr.count<3) {
//        if (_moment.commentArr.count==0) {
//            toolBarH=0;
//        }else if(_moment.commentArr.count==1){
//            toolBarH=50;
//        }else if(_moment.commentArr.count==2){
//            toolBarH=70;
//        }
//
//    }else{
    CGFloat  toolBarH=20*(_moment.commentArr.count)+50;
//    }
    self.momentsToolBarFrame = CGRectMake(toolBarX, toolBarY, toolBarW, toolBarH);
    self.momentsBodyFrame = CGRectMake(0, 0, circleCellWidth, CGRectGetMaxY(self.momentsToolBarFrame));
}

 

- (void)setCellHeight{
    self.cellHeight = CGRectGetMaxY(self.momentsBodyFrame);
}
 
 
@end
