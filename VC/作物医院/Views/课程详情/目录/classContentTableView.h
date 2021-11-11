//
//  classContentTableView.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/8.
//

#import <UIKit/UIKit.h>
#import "classContentViewDataModel.h"
#import "classContentViewTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface classContentTableView : UITableView<UITableViewDelegate,UITableViewDataSource>
//rows/
@property (nonatomic)NSInteger rows;
//cell的高度/
@property(nonatomic,assign)CGFloat height;
//
@property(nonatomic,assign)CGFloat   headerHeight;
//声明自定义类型变量/
@property(nonatomic,retain)classContentViewDataModel * dataModel;
@property(nonatomic,retain)NSMutableArray * dataArr;

-(instancetype)initWithFrame:(CGRect)frame headerHeight:(CGFloat)headerHeight style:(UITableViewStyle)style rowCount:(NSInteger)rows cellHeight:(CGFloat)height dataArr:(NSMutableArray*)dataArr;
@end

NS_ASSUME_NONNULL_END
