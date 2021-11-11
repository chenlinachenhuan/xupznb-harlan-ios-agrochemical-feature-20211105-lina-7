//
//  MomentsBodyView.h
//  SoolyMomentCell
//
//  Created by SoolyChristina on 2016/11/25.
//  Copyright © 2016年 SoolyChristina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "commentTableView.h"
#import "YYText.h"
#import "YYLabel.h"
#import "NSAttributedString+YYText.h"
#import "trendImageView.h"
#import <MediaPlayer/MediaPlayer.h>
#import "trendDeleteParser.h"
#import "trendModel.h"
#import "trendFabulousParser.h"
@class trendDataModel;
 @interface MomentsBodyView : UIView<trendFabulousParserDelegate>
@property (nonatomic,strong)UIImageView *iconView;
@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UILabel *timeLabel;
@property (nonatomic,strong)UIButton * removeButton;
@property (nonatomic,strong)UIButton * collectButton;
@property (nonatomic,strong)trendImageView * imageV;
@property (nonatomic,strong) trendDataModel *momentFrames;
@property(nonatomic,retain)commentTableView * comment;
@property(nonatomic,assign)NSInteger fabulousNum;

@property (nonatomic,strong) YYLabel *label;;
@property(nonatomic,weak)id<trendProtocolDelegate> myDelegate;
-(instancetype)initWithViewProtocol:(id)delegate;
- (void)setChildView:(trendDataModel*)model;
@end
 
