//
//  carTableView.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/26.
//

#import <UIKit/UIKit.h>
#import "carCellTextModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface carTableView : UITableView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain)NSMutableArray * dataArray;
@end

NS_ASSUME_NONNULL_END
