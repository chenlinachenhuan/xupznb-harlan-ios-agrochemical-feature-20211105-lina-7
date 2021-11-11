//
//  trendDetailToolBarView.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/26.
//

#import <UIKit/UIKit.h>
#import "trendDetailDataModel.h"
#import "toolButton.h"
#import "trendFabulousParser.h"

NS_ASSUME_NONNULL_BEGIN

@interface trendDetailToolBarView : UIView<trendFabulousParserDelegate>
@property (nonatomic,strong) trendDetailDataModel *momentFrames;
@property (nonatomic, strong) UILabel *commentLabel;
@property (nonatomic, strong) UIButton *likeButton;
@property (nonatomic, strong) UIButton *forwordButton;
@property(nonatomic,assign)NSInteger fabulousNum;

@end

NS_ASSUME_NONNULL_END
