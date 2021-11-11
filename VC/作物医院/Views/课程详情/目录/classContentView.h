//
//  classContentView.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/8.
//

#import <UIKit/UIKit.h>
#import "classContentTableView.h"
#import "classContentViewDataModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface classContentView : UIView
@property(nonatomic,retain)classContentViewDataModel * dataModel;
@property(nonatomic,retain)classContentTableView * contentTableView;
@property(nonatomic,retain)NSMutableArray * contentArr;
-(void)createclassContentView:(NSMutableArray *)dataArr;
@end

NS_ASSUME_NONNULL_END
