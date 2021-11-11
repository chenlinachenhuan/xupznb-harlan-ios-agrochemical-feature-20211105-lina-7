//
//  classDetailCellView.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/27.
//

#import <UIKit/UIKit.h>
#import "classDetailDataModel.h"
#import "YYText.h"
#import "YYLabel.h"
#import "NSAttributedString+YYText.h"
NS_ASSUME_NONNULL_BEGIN
@protocol classDetailCellViewDelegate;
 
@interface classDetailCellView : UIView<UIGestureRecognizerDelegate>
@property(nonatomic,retain)classDetailDataModel * dataModel;
@property (nonatomic,strong) YYLabel *label;;
@property (nonatomic,strong) UIView * cellThreeView;
@property (nonatomic,strong)UIView * cellTwoView;
@property (nonatomic,strong)UIView * cellFourView;
@property(nonatomic ,weak)id delegate;
-(void)createCellView:(classDetailDataModel *)dataModel;
@end
@protocol classDetailCellViewDelegate <NSObject>

-(void)tapLabelAction:(classDetailDataModel*)model;

@end
NS_ASSUME_NONNULL_END
