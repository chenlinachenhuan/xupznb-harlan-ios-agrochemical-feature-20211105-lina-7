//
//  showProductListView.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface showProductListView : UIView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain)UIView * shadowView;
@property(nonatomic,retain)UIView * bgView;
@property(nonatomic,retain)UITableView * myTab;
@property(nonatomic,retain)NSMutableArray*listArr;
@end

NS_ASSUME_NONNULL_END
