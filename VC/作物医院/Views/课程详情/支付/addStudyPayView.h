//
//  addStudyPayView.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/11.
//

#import <UIKit/UIKit.h>
#import "classDetailDataModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface addStudyPayView : UIView
@property(nonatomic,retain)UIView * cellView;
@property(nonatomic,retain)UILabel * moneyL;
-(void)createCellView:(classDetailDataModel*)model;
@end

NS_ASSUME_NONNULL_END
