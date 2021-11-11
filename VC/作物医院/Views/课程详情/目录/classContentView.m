//
//  classContentView.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/8.
//

#import "classContentView.h"

@implementation classContentView

-(void)createclassContentView:(NSMutableArray *)dataArr{
    for (classContentViewDataModel*model in dataArr) {
        [model setContentFrames:model.contentModel];
    }
    self.contentTableView = [[classContentTableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-0.56*ScreenWidth-48-40) headerHeight:46 style:UITableViewStylePlain rowCount:dataArr.count cellHeight:self.dataModel.contentCellHeight dataArr:dataArr];
    [self addSubview:self.contentTableView];
   
}

@end
