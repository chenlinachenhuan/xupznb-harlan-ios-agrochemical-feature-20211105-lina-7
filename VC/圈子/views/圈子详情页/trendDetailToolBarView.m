//
//  trendDetailToolBarView.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/26.
//

#import "trendDetailToolBarView.h"

@implementation trendDetailToolBarView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
 
        self.userInteractionEnabled = YES;
        //添加子控件
        [self setChildView];
    }
    return self;
}
- (void)setChildView{
    UILabel * commentLab = [[UILabel alloc] init];
    commentLab.textColor = CommonColor;
    commentLab.font = FontSize(15);
 
    [self addSubview:commentLab];
    self.commentLabel = commentLab;
    
    self.likeButton = [[UIButton alloc] init];
    [self.likeButton addTarget:self action:@selector(likeButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    self.likeButton.titleLabel.font = FontSize(12);
    [self.likeButton setTitleColor:CommonColor forState:UIControlStateNormal];
    self.likeButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -8.5);

    [self.likeButton setImage:[UIImage imageNamed:@"点赞"] forState:UIControlStateNormal];
    self.likeButton.titleLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.likeButton];
    
    self.forwordButton = [[UIButton alloc] init];
    [self.forwordButton addTarget:self action:@selector(forwordButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    self.forwordButton.titleLabel.font = FontSize(12);
    [self.forwordButton setTitleColor:CommonColor forState:UIControlStateNormal];
    self.forwordButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -8.5);
     [self.forwordButton setImage:[UIImage imageNamed:@"转发"] forState:UIControlStateNormal];
    self.forwordButton.titleLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.forwordButton];
    
}
-(void)likeButtonMethod{
//    [[ChrysanthemumIndexView sharedMasterUser]show];
    trendFabulousParser * parser = [[trendFabulousParser alloc]init];
    parser.myDelegate = self;
    [parser getTrendFabulous:[self.momentFrames.moment.myId intValue]];
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
-(void)forwordButtonMethod{
    
}
- (void)setMomentFrames:(trendDetailDataModel *)momentFrames{
    _momentFrames = momentFrames;
    //给子控件赋值
    [self setData];
    //给子控件设置frame
    [self setFrame];
     
 
}

-(void)setData{
    
    self.commentLabel.text = [NSString stringWithFormat:@"共%@条评论",_momentFrames.moment.commentTitleStr];
    [self.likeButton setTitle:_momentFrames.moment.fabulousNum forState:UIControlStateNormal];
    [self.forwordButton setTitle:_momentFrames.moment.shareNum forState:UIControlStateNormal];
    self.fabulousNum = [self.momentFrames.moment.fabulousNum integerValue];
    if ([self.momentFrames.moment.fabulousStatus intValue]==0) {
        [self.likeButton setImage:[UIImage imageNamed:@"点赞"] forState:UIControlStateNormal];
        self.likeButton.selected =NO;


    }else{
        self.likeButton.selected = YES;
        [self.likeButton setImage:[UIImage imageNamed:@"已点赞"] forState:UIControlStateNormal];
       
    }
}

-(void)setFrame{
    self.commentLabel.frame = _momentFrames.toolCommentFrame;
    self.likeButton.frame = _momentFrames.toolLikeFrame;
    self.forwordButton.frame = _momentFrames.toolForwardFrame;
}

@end
