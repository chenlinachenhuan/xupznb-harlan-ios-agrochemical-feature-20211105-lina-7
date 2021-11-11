//
//  CommentView.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/22.
//

#import "CommentView.h"
#import "commentTableView.h"
@interface CommentView()
@property(nonatomic,retain)commentTableView * comment;
@end
@implementation CommentView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //添加子控件
        [self setChildView];
         
    }
    return self;
}
- (void)setChildView{
    self.comment = [[commentTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self addSubview:self.comment];
}

- (void)setMomentFrames:(trendDataModel *)momentFrames{
    _momentFrames = momentFrames;
    self.comment.frame = _momentFrames.momentsToolBarFrame;
}

 

@end
