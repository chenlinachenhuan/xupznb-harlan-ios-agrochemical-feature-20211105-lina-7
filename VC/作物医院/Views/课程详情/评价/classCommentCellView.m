//
//  classCommentCellView.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/28.
//

#import "classCommentCellView.h"
@implementation classCommentCellView
-(id)initWithFrame:(CGRect)frame{
    if (self==[super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor orangeColor];
         
    }
    return self;
}
-(void)createCellView:(NSMutableArray *)dataArr{
    for (classCommentDataModel*model in dataArr) {
        [model setCommentFrames:model.commentModel];
    }
    self.commentTableView = [[classCommentTableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-0.56*ScreenWidth-48) headerHeight:46 style:UITableViewStyleGrouped rowCount:dataArr.count cellHeight:self.dataModel.commentCellHeight dataArr:dataArr];
    [self addSubview:self.commentTableView];
   
}
 
@end
