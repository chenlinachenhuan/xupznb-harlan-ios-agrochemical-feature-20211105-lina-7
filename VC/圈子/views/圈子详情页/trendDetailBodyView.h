//
//  trendDetailBodyView.h
//  Agrochemical
//
//  Created by HarLan on 2021/9/26.
//

#import <UIKit/UIKit.h>
#import "trendDetailDataModel.h"
#import "toolButton.h"
#import "WJMoviePlayerView.h"
#import "trendImageView.h"
#import <MediaPlayer/MediaPlayer.h>
#import "trendProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface trendDetailBodyView : UIView<AVPlayerViewControllerDelegate>
@property (nonatomic, weak) UIImageView *iconView;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *textLabel;
@property (nonatomic, weak) UILabel *timeLabel;
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UIButton *removeButton;
@property (nonatomic, weak) UIButton *collectButton;
@property (nonatomic,strong) trendDetailDataModel *momentFrames;
@property (nonatomic, strong) UILabel *commentLabel;
@property (nonatomic, strong) toolButton *likeButton;
@property (nonatomic, strong) toolButton *forwordButton;
@property (nonatomic, strong)WJPlayerView *playerView;
//@property (nonatomic, strong)WJMoviePlayerView *bigPlayerView;
@property(nonatomic,strong)MPMoviePlayerController *playerController;
@property(nonatomic,weak)id<trendProtocolDelegate> myDelegate;

@end

NS_ASSUME_NONNULL_END
