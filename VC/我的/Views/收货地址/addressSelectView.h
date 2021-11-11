//
//  addressSelectView.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/28.
//

#import <UIKit/UIKit.h>
#import "areaListParser.h"
#import "provModel.h"
#import "cityModel.h"
#import "regionModel.h"
#import "selectTableViewCell.h"
#import "showTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface addressSelectView : UIView<areaListParserDelegate,UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>
@property(nonatomic,retain)UIView * shadowView;
@property(nonatomic,retain)UIView * bgView;
@property(nonatomic,retain)NSMutableArray * showArr;
@property(nonatomic,retain)NSMutableArray * selectArr;
@property(nonatomic,retain)NSMutableArray * selectIdArr;

@property(nonatomic,retain)UITableView * selectTab;
@property(nonatomic,retain)UITableView * showTab;
@property(nonatomic,retain)NSString * addressStr;
@property(nonatomic,retain)NSString * selectStr;

-(void)createSelectView;
@end

NS_ASSUME_NONNULL_END
