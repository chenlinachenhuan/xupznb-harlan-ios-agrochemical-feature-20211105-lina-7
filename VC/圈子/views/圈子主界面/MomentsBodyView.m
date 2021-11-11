//
//  MomentsBodyView.m
//  SoolyMomentCell
//
//  Created by SoolyChristina on 2016/11/25.
//  Copyright © 2016年 SoolyChristina. All rights reserved.
//

#import "MomentsBodyView.h"
#import "trendDataModel.h"
//#import "PYPhotoBrowser.h"
#import "trendModel.h"
#import "trendImageView.h"
#import "toolButton.h"
#import "WJMoviePlayerView.h"

@interface MomentsBodyView ()

 
@property (nonatomic, strong) UIButton *commentButton;
@property (nonatomic, strong) UIButton *likeButton;
@property (nonatomic, strong) UIButton *forwordButton;
@property (nonatomic, strong)WJPlayerView *playerView;
//@property (nonatomic, strong)WJMoviePlayerView *bigPlayerView;

//@property (nonatomic, weak) PYPhotosView *photosView;

@end

@implementation MomentsBodyView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //添加子控件
//        [self setChildView];
//        self.backgroundColor = [UIColor orangeColor];
    }
    return self;
}

- (void)setChildView:(trendDataModel*)model{
    self.momentFrames = model;
    // 头像
    UIImageView *iconView = [[UIImageView alloc] init];
    [iconView sd_setImageWithURL:[NSURL URLWithString:self.momentFrames.moment.headImage]];
    iconView.frame = self.momentFrames.bodyIconFrame;
    iconView.clipsToBounds = YES;
    iconView.layer.cornerRadius = self.momentFrames.bodyIconFrame.size.width/2;
    [self addSubview:iconView];
    
    // 昵称
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = self.momentFrames.moment.nameStr;
    nameLabel.frame = self.momentFrames.bodyNameFrame;
    [self addSubview:nameLabel];
    nameLabel.font = circleCellNameFont;
    // 时间
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.font = circleCellTimeFont;
    timeLabel.textColor = [UIColor colorWithRed:162/255.0 green:166/255.0 blue:172/255.0 alpha:1.0];
    timeLabel.frame = self.momentFrames.bodyTimeFrame;
    timeLabel.text =[NSString stringWithFormat:@"%@ %@人阅读",self.momentFrames.moment.pubTime,self.momentFrames.moment.viewNum];
    [self addSubview:timeLabel];
    NSLog(@"%@ ==%@",Agro_appDelegate.loginModel.myId,self.momentFrames.moment.memberId);
    if (Agro_appDelegate.loginModel.myId!=nil&&[Agro_appDelegate.loginModel.myId intValue]==[self.momentFrames.moment.memberId intValue ]) {
        UIButton * removeButton = [[UIButton alloc] init];
        removeButton.frame = self.momentFrames.bodyRemoveButtonFrame;
        [removeButton setTitle:@"删除" forState:UIControlStateNormal];
        [removeButton setTitleColor:[UIColor colorWithRed:98/255.0 green:191/255.0 blue:180/255.0 alpha:1.0] forState:UIControlStateNormal];
        removeButton.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size: 12];
        
        [removeButton addTarget:self action:@selector(deleteButtonMethod) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:removeButton];
    }
    
 
    UIButton * collectButton = [[UIButton alloc] init];
    collectButton.frame = self.momentFrames.bodycollectButtonFrame;
    if ([[NSString stringWithFormat:@"%@",self.momentFrames.moment.followStatus] isEqualToString:@"0"]) {
        [collectButton setBackgroundImage:[UIImage imageNamed:@"未关注"] forState:UIControlStateNormal];
    }else{
        [collectButton setBackgroundImage:[UIImage imageNamed:@"已关注"] forState:UIControlStateNormal];
    }
    [collectButton addTarget:self action:@selector(collectButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:collectButton];
 
    
//    UILabel *titleLabel = [[UILabel alloc] init];
//    titleLabel.font = [UIFont fontWithName:@"PingFang SC" size: 15];
//    titleLabel.frame = self.momentFrames.bodyTitleFrame;
//    titleLabel.text = self.momentFrames.moment.titleStr;
//    titleLabel.numberOfLines=2;
//    [self addSubview:titleLabel];
 
    [self addSubview:[self introduceLabelShowAll]];
    self.label.textColor = [UIColor blackColor];
    if ([model.moment.typeId intValue]==2 ) {
        UIView * view = [[UIView alloc] initWithFrame:self.momentFrames.bodyPhotoFrame];
        [self addSubview:view];
        UITapGestureRecognizer * ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapM:)];
        [view addGestureRecognizer:ges];
        
        
        UIImageView * image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
//        image.image = [commonMethod firstFrameWithVideoURL:[NSURL URLWithString:self.momentFrames.moment.movUrl]];
        image.backgroundColor = SelectColor;
        [view addSubview:image];
        
        UIImageView * start = [[UIImageView alloc] initWithFrame:CGRectMake(view.frame.size.width/2-15, view.frame.size.height/2-15, 30, 30)];
        start.image = [UIImage imageNamed:@"播放"];
        [view addSubview:start];
        
    }else if ([model.moment.typeId intValue]==1){
        // 图片
        trendImageView * imageV = [[trendImageView alloc] init];
        [self addSubview:imageV];
        if (self.momentFrames.moment.imageArr.count!=0) {
            imageV.hidden = NO;
            imageV.frame = self.momentFrames.bodyPhotoFrame;
            [imageV imageFrame:imageV.frame imageArr:self.momentFrames.moment.imageArr];
        }else{
            imageV.hidden = YES;
        }
    }
     
    
    self.commentButton = [[UIButton alloc] init];
    self.commentButton.frame = self.momentFrames.toolCommentFrame;
    [self.commentButton setImage:[UIImage imageNamed:@"评论"] forState:UIControlStateNormal];
    [self.commentButton setTitleColor:[UIColor colorWithRed:162/255.0 green:166/255.0 blue:172/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.commentButton.titleLabel setFont:[UIFont fontWithName:@"PingFang SC" size: 12]];
    [self.commentButton addTarget:self action:@selector(commentButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    self.commentButton.titleEdgeInsets = UIEdgeInsetsMake( 0, -CGRectGetWidth(self.momentFrames.toolCommentFrame)/2, 0, -8.5);
    self.commentButton.imageEdgeInsets = UIEdgeInsetsMake(0, -CGRectGetWidth(self.momentFrames.toolCommentFrame)/2, 0,0);
    [self.commentButton setTitle: self.momentFrames.moment.commentTitleStr forState:UIControlStateNormal];;
    [self addSubview:self.commentButton];
    
    self.likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.likeButton.frame = self.momentFrames.toolLikeFrame;
//    [self.likeButton setImage:[UIImage imageNamed:@"点赞"] forState:UIControlStateNormal];
    [self.likeButton.titleLabel setFont:[UIFont fontWithName:@"PingFang SC" size: 12]];
    [self.likeButton setTitleColor:[UIColor colorWithRed:162/255.0 green:166/255.0 blue:172/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.likeButton setTitle: self.momentFrames.moment.fabulousNum forState:UIControlStateNormal];
    self.likeButton.titleEdgeInsets = UIEdgeInsetsMake( 0, -CGRectGetWidth(self.momentFrames.toolLikeFrame)/2, 0, -8.5);
    self.likeButton.imageEdgeInsets = UIEdgeInsetsMake(0, -CGRectGetWidth(self.momentFrames.toolLikeFrame)/2, 0,0);
    [self.likeButton addTarget:self action:@selector(likeButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.likeButton];
    self.fabulousNum = [self.momentFrames.moment.fabulousNum integerValue];
    if ([self.momentFrames.moment.fabulousStatus intValue]==0) {
        [self.likeButton setImage:[UIImage imageNamed:@"点赞"] forState:UIControlStateNormal];
        self.likeButton.selected =NO;


    }else{
        self.likeButton.selected = YES;
        [self.likeButton setImage:[UIImage imageNamed:@"已点赞"] forState:UIControlStateNormal];
       
    }
    self.forwordButton = [toolButton buttonWithType:UIButtonTypeCustom];
    self.forwordButton.frame = self.momentFrames.toolForwardFrame;
    [self.forwordButton setImage:[UIImage imageNamed:@"转发"] forState:UIControlStateNormal];
    [self.forwordButton.titleLabel setFont:[UIFont fontWithName:@"PingFang SC" size: 12]];
    [self.forwordButton setTitleColor:[UIColor colorWithRed:162/255.0 green:166/255.0 blue:172/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.forwordButton setTitle: self.momentFrames.moment.shareNum forState:UIControlStateNormal];
    self.forwordButton.titleEdgeInsets = UIEdgeInsetsMake( 0, -CGRectGetWidth(self.momentFrames.toolForwardFrame)/2, 0, -8.5);
    self.forwordButton.imageEdgeInsets = UIEdgeInsetsMake(0, -CGRectGetWidth(self.momentFrames.toolForwardFrame)/2, 0,0);
    [self addSubview:self.forwordButton];
    
    self.comment = [[commentTableView alloc] init];
    self.comment.frame = self.momentFrames.momentsToolBarFrame;
    self.comment.userInteractionEnabled = YES;
    [self.comment CommentArr:self.momentFrames.moment.commentArr];
    [self addSubview:self.comment];
    
    
}
-(void)deleteButtonMethod{
    [self.myDelegate deleteButtonClick:self.momentFrames.moment];
}
-(void)likeButtonClick:(trendModel *)model{
    [[ChrysanthemumIndexView sharedMasterUser]show];
    trendFabulousParser * parser = [[trendFabulousParser alloc]init];
    parser.myDelegate = self;
    [parser getTrendFabulous:[model.myId intValue]];
}
-(void)successFabulousTrend{
//    [self reloadDataMethod];
    self.likeButton.selected = !self.likeButton.selected;
    if (self.likeButton.selected==NO) {
        self.fabulousNum--;
        [self.likeButton setImage:[UIImage imageNamed:@"点赞"] forState:UIControlStateNormal];
        [self.likeButton setTitle: [NSString stringWithFormat:@"%ld",self.fabulousNum] forState:UIControlStateNormal];
         

    }else{
        [self.likeButton setImage:[UIImage imageNamed:@"已点赞"] forState:UIControlStateNormal];
        self.fabulousNum++;

        [self.likeButton setTitle: [NSString stringWithFormat:@"%ld",self.fabulousNum] forState:UIControlStateNormal];
    }
    
}
-(void)failedMethod:(NSString *)message{
    
}
-(void)likeButtonMethod{
    trendFabulousParser * parser = [[trendFabulousParser alloc]init];
    parser.myDelegate = self;
    [parser getTrendFabulous:[self.momentFrames.moment.myId intValue]];
    
//    [self.myDelegate likeButtonClick:self.momentFrames.moment];

}
-(void)tapM:(UIGestureRecognizer*)rec{
    self.playerView = [[WJPlayerView alloc] init];
//        self.playerView.playerView = [[WJPlayerView alloc] init];
//        [self.playerView addSubview:self.playerView.playerView];
//        self.playerView.backgroundColor = SelectColor;
    self.playerView.movieURL =[NSURL URLWithString:self.momentFrames.moment.movUrl];
    [self.playerView show];
    UITapGestureRecognizer * ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapC:)];
    [self.playerView addGestureRecognizer:ges];
//    self.bigPlayerView = [[WJMoviePlayerView alloc] init];
////        self.playerView.backgroundColor = SelectColor;
//    self.bigPlayerView.movieURL =[NSURL URLWithString:self.momentFrames.moment.movUrl];
//    [self.bigPlayerView show];
////    }];;
////    self.playerView = [[WJMoviePlayerView alloc] init];
////    self.playerView.movieURL =[NSURL URLWithString:self.momentFrames.moment.movUrl];
////    [ self.playerView show];
//    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapC:)];
//   [ self.bigPlayerView  addGestureRecognizer:tap];
}
-(void)tapC:(UIGestureRecognizer*)rec{
    [self.playerView closeMoviePlayerView];
}
-(void)collectButtonMethod{
    
}
-(YYLabel*)introduceLabelShowAll{
    NSMutableAttributedString *text = [NSMutableAttributedString new];
    // 添加文本
    NSString *title =  self.momentFrames.moment.textStr;
    [text appendAttributedString:[[NSAttributedString alloc] initWithString:title attributes:nil]];
    text.yy_font = FontSize(14) ;
    _label = [YYLabel new];
    _label.userInteractionEnabled = YES;
//    _label.backgroundColor = [UIColor orangeColor];
    _label.numberOfLines = 0;
    _label.textVerticalAlignment = YYTextVerticalAlignmentTop;
    _label.frame = self.momentFrames.bodyTextFrame;
    _label.attributedText = text;
    [self addSeeMoreButton];
    UITapGestureRecognizer * tapG = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapActionMethod:)];
    [_label addGestureRecognizer:tapG];
    return self.label;
}
-(void)tapActionMethod:(UITapGestureRecognizer*)tapG{
    [self.comment.commentDelegate didselectCell:self.tag];
}
#pragma mark - 添加全文
- (void)addSeeMoreButton {
//    __weak __typeof(self) weakSelf = self;
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"...查看全文"];
    YYTextHighlight *hi = [[YYTextHighlight alloc] init];
    [hi setColor:[UIColor colorWithRed:0.578 green:0.790 blue:1.000 alpha:1.000]];
    hi.tapAction = ^(UIView *containerView,NSAttributedString *text,NSRange range, CGRect rect) {
        
    };
    [text yy_setColor:SelectColor range:[text.string rangeOfString:@"查看全文"]];
    [text yy_setTextHighlight:hi range:[text.string rangeOfString:@"查看全文"]];
    text.yy_font = _label.font;
    YYLabel *seeMore = [YYLabel new];
    seeMore.attributedText = text;
    [seeMore sizeToFit];
    NSAttributedString *truncationToken = [NSAttributedString yy_attachmentStringWithContent:seeMore contentMode:UIViewContentModeCenter attachmentSize:seeMore.frame.size alignToFont:text.yy_font alignment:YYTextVerticalAlignmentCenter];
    _label.truncationToken = truncationToken;
}
-(void)commentButtonMethod{
    [self.comment.commentDelegate didselectCell:self.tag];
}
 
 
 

@end
