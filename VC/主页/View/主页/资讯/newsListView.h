//
//  newsListView.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol newsListViewDelegate;
@interface newsListView : UIView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain)UITableView*myTab;
@property(nonatomic,retain)NSMutableArray*myArr;
@property(nonatomic,retain)NSMutableArray*cat2NameArr;
@property (nonatomic,weak)id myDelegate;

@end
@protocol newsListViewDelegate <NSObject>
@optional
-(void)didSelectCell:(NSIndexPath*)indexPath;
-(void)didSelectCollectionView:(NSIndexPath*)indexPath;

@end
NS_ASSUME_NONNULL_END
