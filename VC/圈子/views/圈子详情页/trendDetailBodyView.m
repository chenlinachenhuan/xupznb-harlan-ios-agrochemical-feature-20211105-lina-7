//
//  trendDetailBodyView.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/26.
//

#import "trendDetailBodyView.h"
 @implementation trendDetailBodyView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //添加子控件
//        self.backgroundColor = [UIColor redColor];
        [self setChildView];
    }
    return self;
}
- (void)setChildView{
    
    // 头像
    UIImageView *iconView = [[UIImageView alloc] init];
    [self addSubview:iconView];
     
    self.iconView = iconView;
    
    // 昵称
    UILabel *nameLabel = [[UILabel alloc] init];
    [self addSubview:nameLabel];
    nameLabel.font = circleCellNameFont;
    self.nameLabel = nameLabel;
    // 时间
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.font = circleCellTimeFont;
    timeLabel.textColor = [UIColor colorWithRed:162/255.0 green:166/255.0 blue:172/255.0 alpha:1.0];
    [self addSubview:timeLabel];
    self.timeLabel = timeLabel;
    
    if (Agro_appDelegate.loginModel.myId!=nil&&[Agro_appDelegate.loginModel.myId intValue]==[self.momentFrames.moment.memberId intValue ]) {
        UIButton * removeButton = [[UIButton alloc] init];
        removeButton.frame = self.momentFrames.bodyRemoveButtonFrame;
        [removeButton setTitle:@"删除" forState:UIControlStateNormal];
        [removeButton setTitleColor:[UIColor colorWithRed:98/255.0 green:191/255.0 blue:180/255.0 alpha:1.0] forState:UIControlStateNormal];
        removeButton.titleLabel.font = [UIFont fontWithName:@"PingFang SC" size: 12];
        
        [removeButton addTarget:self action:@selector(deleteButtonMethod) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:removeButton];
        self.removeButton = removeButton;

    }
     UIButton * collectButton = [[UIButton alloc] init];
    [collectButton setBackgroundImage:[UIImage imageNamed:@"已关注"] forState:UIControlStateNormal];
    [self addSubview:collectButton];
    self.collectButton = collectButton;
    
    
//    UILabel *titleLabel = [[UILabel alloc] init];
//    titleLabel.font = [UIFont fontWithName:@"PingFang SC" size: 15];
//    titleLabel.numberOfLines=0;
//    [self addSubview:titleLabel];
//    self.titleLabel = titleLabel;
    
    // 正文
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.font = circleCellTextFont;
    
//    textLabel.textColor = [UIColor colorWithRed:162/255.0 green:166/255.0 blue:172/255.0 alpha:1.0];

    //换行
    textLabel.numberOfLines = 0;
    [self addSubview:textLabel];
    self.textLabel = textLabel;
    
//    UILabel * commentLab = [[UILabel alloc] init];
//    commentLab.textColor = CommonColor;
//    commentLab.font = FontSize(15);
//    commentLab.backgroundColor = [UIColor redColor];
//
//    [self addSubview:commentLab];
//    self.commentLabel = commentLab;
//
//    self.likeButton = [toolButton buttonWithType:UIButtonTypeCustom];
//    [self.likeButton addTarget:self action:@selector(likeButtonMethod) forControlEvents:UIControlEventTouchUpInside];
//    self.likeButton.titleLabel.textColor  = CommonColor;
//    self.likeButton.backgroundColor = [UIColor redColor];
//    [self.likeButton setImage:[UIImage imageNamed:@"点赞"] forState:UIControlStateNormal];
//    [self addSubview:self.likeButton];
//
//    self.forwordButton = [[toolButton alloc] init];
//    [self.forwordButton addTarget:self action:@selector(forwordButtonMethod) forControlEvents:UIControlEventTouchUpInside];
//    self.forwordButton.titleLabel.textColor  = CommonColor;
//    self.forwordButton.backgroundColor = [UIColor redColor];
//    [self.forwordButton setImage:[UIImage imageNamed:@"转发"] forState:UIControlStateNormal];
//    [self addSubview:self.forwordButton];
}
 
 
- (void)setMomentFrames:(trendDetailDataModel *)momentFrames{
    _momentFrames = momentFrames;
    //给子控件赋值
    [self setData];
    //给子控件设置frame
    [self setFrame];
    if ([momentFrames.moment.typeId intValue]==2 ) {
        UIView * view = [[UIView alloc] initWithFrame:self.momentFrames.bodyPhotoFrame];
        [self addSubview:view];
        UITapGestureRecognizer * ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapM:)];
        [view addGestureRecognizer:ges];
        
        
        UIImageView * image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
        image.image = [commonMethod firstFrameWithVideoURL:[NSURL URLWithString:self.momentFrames.moment.movUrl]];
        image.backgroundColor = SelectColor;
        [view addSubview:image];
        
        UIImageView * start = [[UIImageView alloc] initWithFrame:CGRectMake(view.frame.size.width/2-15, view.frame.size.height/2-15, 30, 30)];
        start.image = [UIImage imageNamed:@"播放"];
        [view addSubview:start];
        
    }else if ([momentFrames.moment.typeId intValue]==1){
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
-(void)setData{
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:self.momentFrames.moment.headImage]];
    self.nameLabel.text = self.momentFrames.moment.nameStr;
    self.textLabel.text = self.momentFrames.moment.textStr;
    if ([self.momentFrames.moment.followStatus intValue]==0) {
        [self.collectButton setBackgroundImage:[UIImage imageNamed:@"未关注"] forState:UIControlStateNormal];
    }else{
        [self.collectButton setBackgroundImage:[UIImage imageNamed:@"已关注"] forState:UIControlStateNormal];

    }
    self.timeLabel.text =[NSString stringWithFormat:@"%@ %@人阅读",self.momentFrames.moment.pubTime,self.momentFrames.moment.viewNum];
    self.titleLabel.text = self.momentFrames.moment.titleStr;
//    self.commentLabel.text = _momentFrames.moment.commentTitleStr;
//    [self.likeButton setTitle:_momentFrames.moment.likeStr forState:UIControlStateNormal];
//    [self.forwordButton setTitle:_momentFrames.moment.forwordStr forState:UIControlStateNormal];

}

-(void)setFrame{
    self.iconView.frame = self.momentFrames.bodyIconFrame;
    self.nameLabel.frame = self.momentFrames.bodyNameFrame;
    self.textLabel.frame = self.momentFrames.bodyTextFrame;
    self.timeLabel.frame = self.momentFrames.bodyTimeFrame;
    self.removeButton.frame = self.momentFrames.bodyRemoveButtonFrame;
    self.collectButton.frame = self.momentFrames.bodycollectButtonFrame;
    self.titleLabel.frame = self.momentFrames.bodyTitleFrame;
//    self.commentLabel.frame = _momentFrames.toolCommentFrame;
//    self.likeButton.frame = _momentFrames.toolLikeFrame;
//    self.forwordButton.frame = _momentFrames.toolForwardFrame;
    self.iconView.clipsToBounds = YES;
    self.iconView.layer.cornerRadius = self.momentFrames.bodyIconFrame.size.width/2;
}
-(void)deleteButtonMethod{
    [self.myDelegate deleteButtonClick:self.momentFrames.moment];
}
@end
