//
//  trendCollectionViewCell.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/23.
//

#import "trendCollectionViewCell.h"
#import "CommentView.h"
#import "trendDataModel.h"
@interface trendCollectionViewCell()

 

//工具条
@property (nonatomic,weak) CommentView *toolBarView;

@end
@implementation trendCollectionViewCell

 
- (id)initWithFrame:(CGRect)frame

{
    if ([super initWithFrame:frame]==self) {
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 10;
        self.backgroundColor = [UIColor whiteColor];
//        [self setChildView];

    }
    return self;
}
//添加子控件
- (void)setChildView{
    //Code圈主体
    MomentsBodyView *bodyView = [[MomentsBodyView alloc] init];
    [self addSubview:bodyView];
    self.bodyView = bodyView;
    
//    //评论
//    CommentView *toolBar = [[CommentView alloc] init];
//    [self addSubview:toolBar];
//    self.toolBarView = toolBar;
}

//- (void)setMomentFrames:(trendDataModel *)momentFrames{
//    _momentFrames = momentFrames;
//    
//    //设置子控件的frame
//    self.bodyView.frame = momentFrames.momentsBodyFrame;
//    self.bodyView.momentFrames = momentFrames;
////    self.toolBarView.frame = momentFrames.momentsToolBarFrame;
////    self.toolBarView.momentFrames = momentFrames;
//}

//设置cell的frame
-(void)setFrame:(CGRect)frame{
    frame.origin.x += 16;
    frame.size.width -= 16 * 2;
    [super setFrame:frame];
}


 
@end
